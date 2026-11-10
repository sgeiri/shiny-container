pkgs <- c('Cairo', 'data.table', 'devtools', 'DBI', 'doParallel', 'DT', 'dygraphs', 'ggplot2', 'ggrepel', 'ggsci', 'ggthemes', 'gridExtra', 'htmltools', 'htmlwidgets', 'leaflet', 'RColorBrewer', 'remotes', 'RPostgreSQL', 'rJava', 'scales', 'sf', 'shiny', 'shinyBS', 'shinydashboard', 'shinythemes', 'shinyWidgets', 'xts', 'RJDBC')

install.packages(pkgs[!(pkgs %in% installed.packages()[,'Package'])], repos='https://cran.r-project.org/', INSTALL_opts="--strip")
# install.packages('https://cran.r-project.org/src/contrib/Archive/RJDBC/RJDBC_0.2-8.tar.gz', repo=NULL, type='source', INSTALL_opts="--strip")

devtools::install_github('ThomasSiegmund/D3TableFilter')
devtools::install_github('aoles/shinyURL')
