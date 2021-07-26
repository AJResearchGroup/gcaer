Bootstrap: docker
From: r-base

%runscript
    Rscript -e 'gcaer::is_gcae_installed()'

%post
    sed -i 's/$/ universe/' /etc/apt/sources.list
    apt-get update
    apt-get -y install libssl-dev
    apt-get clean
    Rscript -e 'install.packages("remotes")'
    Rscript -e 'remotes::install_github("richelbilderbeek/plinkr")'
    Rscript -e 'plinkr::install_plinks()'
    Rscript -e 'plinkr::plinkr_report.R'
    Rscript -e 'remotes::install_github("richelbilderbeek/gcaer")'
    Rscript -e 'gcaer::install_gcaer()'

