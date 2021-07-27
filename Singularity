Bootstrap: docker
From: r-base

%files
    ~/.local/share/plinkr
    ~/.local/share/gcaer

%runscript
    Rscript -e 'gcaer::is_gcae_installed()'

%post
    sed -i 's/$/ universe/' /etc/apt/sources.list
    apt-get update
    apt-get -y install libssl-dev libcurl4-openssl-dev libxml2-dev r-cran-stringi
    apt-get clean
    Rscript -e 'install.packages(c("remotes", "devtools"))'
    Rscript -e 'remotes::install_github("richelbilderbeek/plinkr")'
    Rscript -e 'plinkr::install_plinks()'
    Rscript -e 'remotes::install_github("richelbilderbeek/gcaer")'
    Rscript -e 'gcaer::install_gcaer()'

%test
    Rscript -e 'gcaer::is_gcae_installed()'

