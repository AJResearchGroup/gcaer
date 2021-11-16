import tensorflow as tf
import gym
import numpy as np

def fullyConnected(name, input_layer, output_dim, activation=None):
    """
    Adds a fully connected layer after the `input_layer`. `output_dim` is
    the size of next layer. `activation` is the optional activation 
    function for the next layer.
    """
    initializer = tf.random_uniform_initializer(minval=-.003, maxval=.003)

    input_dims = input_layer.get_shape().as_list()[1:]
    weight = tf.get_variable(name + "_w", shape=[*input_dims, output_dim],
                             dtype=tf.float32, initializer=initializer)
    bias = tf.get_variable(name + "_b", shape=output_dim, dtype=tf.float32,
                           initializer=initializer)
    next_layer = tf.matmul(input_layer, weight) + bias

    if activation:
        next_layer = activation(next_layer, name=name + "_activated")

    return next_layer

class Memory(object):
    """
    Saves experiences as (state, action, reward, next_action, 
    termination). It only supports discrete action spaces.
    """

    def __init__(self, size, state_dims):
        self.length = size

        self.states = np.empty([size, state_dims], dtype=float)
        self.actions = np.empty(size, dtype=int)
        self.rewards = np.empty((size, 1), dtype=float)
        self.states_next = np.empty([size, state_dims], dtype=float)
        self.terminations = np.zeros((size, 1), dtype=bool)

        self.memory = [self.states, self.actions,
                       self.rewards, self.states_next, self.terminations]

        self.pointer = 0
        self.count = 0

    def add(self, state, action, reward, next_state, termination):
        self.states[self.pointer] = state
        self.actions[self.pointer] = action
        self.rewards[self.pointer] = reward
        self.states_next[self.pointer] = next_state
        self.terminations[self.pointer] = termination
        self.pointer = (self.pointer + 1) % self.length
        self.count += 1

    def sample(self, batch_size):
        index = np.random.randint(
            min(self.count, self.length), size=(batch_size))
        return (self.states[index], self.actions[index],
            self.rewards[index], self.states_next[index],
            self.terminations[index])

class DQN(object):
    """
    Deep Q network agent. 
    """

    def __init__(self, state_dim, action_dim, memory_size, layer_dims,
                 optimizer):

        self.action_dim = action_dim
        self.state = tf.placeholder(
            tf.float32, [None, state_dim], "states")
        self.action_ph = tf.placeholder(tf.int32, [None], "actions")
        self.action_value_ph = tf.placeholder(
            tf.float32, [None], "action_values")
        self.memory = Memory(memory_size, state_dim)

        def _make():
            flow = self.state
            for i, size in enumerate(layer_dims):
                flow = fullyConnected(
                    "layer%i" % i, flow, size, tf.nn.relu)

            return fullyConnected(
                "output_layer", flow, self.action_dim)

        # generate the learner network
        with tf.variable_scope('learner'):
            self.action_value = _make()
        # generate the target network
        with tf.variable_scope('target'):
            self.target_action_value = _make()

        # get parameters for learner and target networks
        from_list = tf.get_collection(
            tf.GraphKeys.TRAINABLE_VARIABLES, scope='learner')
        target_list = tf.get_collection(
            tf.GraphKeys.TRAINABLE_VARIABLES, scope='target')

        # create a copy operation from parameters of learner 
        # to parameters of target network
        from_list = sorted(from_list, key=lambda v: v.name)
        target_list = sorted(target_list, key=lambda v: v.name)
        self.update_target_network = []
        for i in range(len(from_list)):
            self.update_target_network.append(target_list[i].assign(from_list[i]))

        # gather the action-values of the performed actions
        row = tf.range(0, tf.shape(self.action_value)[0])
        indexes = tf.stack([row, self.action_ph], axis=1)
        action_value = tf.gather_nd(self.action_value, indexes)

        # calculate loss of Q network
        self.single_loss = tf.square(action_value - self.action_value_ph)
        self._loss = tf.reduce_mean(self.single_loss)

        self.train_op = optimizer.minimize(self._loss)

    def train(self, session, batch=None, discount=.97):
        states, actions, rewards, next_states, terminals =\
            self.memory.sample(batch)
        next_state_value = session.run(
            self.target_action_value, {self.state: next_states})
        observed_value = rewards + discount * \
            np.max(next_state_value, 1, keepdims=True)
        observed_value[terminals] = rewards[terminals]

        _, batch_loss = session.run([self.train_op, self._loss], {
            self.state: states, self.action_ph: actions,
            self.action_value_ph: observed_value[:, 0]})
        return batch_loss

    def policy(self, session, state):
        return session.run(self.action_value, {self.state: [state]})[0]

    def memorize(self, state, action, reward, next_state, terminal):
        self.memory.add(state, action, reward, next_state, terminal)

    def update(self, session):
        session.run(self.update_target_network)


ENVIRONMENT = 'CartPole-v1'  # environment name from `OpenAI`.
MEMORY_SIZE = 50000  # how many of recent time steps should be saved in agent's memory
LEARNING_RATE = .01  # learning rate for Adam optimizer
BATCH_SIZE = 8  # number of experiences to sample in each training step
EPSILON = .1  # how often an action should be chosen randomly. This encourages exploration
EPXILON_DECAY = .99  # the rate of decaying `EPSILON`
NETWORK_ARCHITECTURE = [100] # shape of the q network. Each element is one layer
TOTAL_EPISODES = 500  # number of total episodes
MAX_STEPS = 200  # maximum number of steps in each episode
REPORT_STEP = 10  # how many episodes to run before printing a summary

env = gym.make(ENVIRONMENT)  # initialize environment
state_dim = env.observation_space.shape[
    0]  # dimensions of observation space
action_dim = env.action_space.n

optimizer = tf.train.AdamOptimizer(LEARNING_RATE)
agent = DQN(state_dim, action_dim, MEMORY_SIZE,
            NETWORK_ARCHITECTURE, optimizer)

eps = [EPSILON]

def runEpisode(env, session):
    state = env.reset()
    total_l = 0.
    total_reward = 0.
    for i in range(MAX_STEPS):
        if np.random.uniform() < eps[0]:
            action = np.random.randint(action_dim)
        else:
            action_values = agent.policy(session, state)
            action = np.argmax(action_values)

        next_state, reward, terminated, _ = env.step(action)

        if terminated:
            reward = -1

        total_reward += reward

        agent.memorize(state, action, reward, next_state, terminated)
        state = next_state
        total_l += agent.train(session, BATCH_SIZE)

        if terminated:
            break

    eps[0] *= EPXILON_DECAY
    i += 1

    return i, total_reward / i, total_l / i

session = tf.InteractiveSession()
session.run(tf.global_variables_initializer())

for i in range(1, TOTAL_EPISODES + 1):
    leng, reward, loss = runEpisode(env, session)
    agent.update(session)
    if i % REPORT_STEP == 0:
        print(("Episode: %4i " +
               "| Episod Length: %3i " +
               "| Avg Reward: %+.3f " +
               "| Avg Loss: %6.3f " +
               "| Epsilon: %.3f") %
              (i, leng, reward, loss, eps[0]))

