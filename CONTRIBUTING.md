# Contributing

Awesome that you are reading this!

This GitHub follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).

 * For questions, you can create an Issue
 * Code changes go via Pull Requests

## Submitting code

Submitted code should follow these quality guidelines:

 * All tests pass cleanly/silently
 * Code coverage above 95%
 * Coding style should follow the default style by `lintr`

These are all checked by GitHub Actions when submitting
a Pull Request. 

Emails with code will not be accepted.

## Submitting bugs

Awesome. These are your options:

 * Add an Issue, with the test that fails
 * Submit a Pull Request, where the test is added to the `tests/testthat` folder
 * Send @richelbilderbeek an email (@richelbilderbeek will make an Issue of it)

Pull Requests should follow the same guidelines as 'Submitting code'.

## Branching policy

 * The `master` branch should ideally always build successfully, but only tagged versions do. This is because Singularity container use the code at `master`
 * The `develop` branch is a copy of a `master` branch that is known to build

## git usage

To get started working on `gcaer` do:

```
git clone https://github.com/richelbilderbeek/gcaer
```

Development is done on the `develop` branch. 
To download and checkout the `develop` branch, 
first go into the `gcaer` folder (`cd gcaer`), then do:

```
git checkout develop
```

Then the workflow is the common `git` workflow:

```
git pull
git add --all :/
git commit -m "Did something awesome"
git push
```
