01\_explore-libraries\_jenny.R
================
annamoeller
Wed Jan 31 14:05:31 2018

``` r
# You can put this yaml in R code!

## how jenny might do this in a first exploration
## purposely leaving a few things to change later!
```

Which libraries does R search for packages?

``` r
.libPaths()
```

    ## [1] "/Library/Frameworks/R.framework/Versions/3.4/Resources/library"

``` r
## let's confirm the second element is, in fact, the default library
.Library
```

    ## [1] "/Library/Frameworks/R.framework/Resources/library"

``` r
library(fs)
path_real(.Library)
```

    ## /Library/Frameworks/R.framework/Versions/3.4/Resources/library

Installed packages

``` r
library(tidyverse)
```

    ## ── Attaching packages ────────────────────────────────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 2.2.1     ✔ purrr   0.2.4
    ## ✔ tibble  1.4.2     ✔ dplyr   0.7.4
    ## ✔ tidyr   0.7.2     ✔ stringr 1.2.0
    ## ✔ readr   1.1.1     ✔ forcats 0.2.0

    ## ── Conflicts ───────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
ipt <- installed.packages() %>%
  as_tibble()

## how many packages?
nrow(ipt)
```

    ## [1] 144

Exploring the packages

``` r
## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
ipt %>%
  count(LibPath, Priority)
```

    ## # A tibble: 3 x 3
    ##   LibPath                                                 Priority       n
    ##   <chr>                                                   <chr>      <int>
    ## 1 /Library/Frameworks/R.framework/Versions/3.4/Resources… base          14
    ## 2 /Library/Frameworks/R.framework/Versions/3.4/Resources… recommend…    15
    ## 3 /Library/Frameworks/R.framework/Versions/3.4/Resources… <NA>         115

``` r
##   * what proportion need compilation?
ipt %>%
  count(NeedsCompilation) %>%
  mutate(prop = n / sum(n))
```

    ## # A tibble: 3 x 3
    ##   NeedsCompilation     n   prop
    ##   <chr>            <int>  <dbl>
    ## 1 no                  62 0.431 
    ## 2 yes                 77 0.535 
    ## 3 <NA>                 5 0.0347

``` r
##   * how break down re: version of R they were built on
ipt %>%
  count(Built) %>%
  mutate(prop = n / sum(n))
```

    ## # A tibble: 4 x 3
    ##   Built     n   prop
    ##   <chr> <int>  <dbl>
    ## 1 3.4.0    57 0.396 
    ## 2 3.4.1    12 0.0833
    ## 3 3.4.2    18 0.125 
    ## 4 3.4.3    57 0.396

Reflections

``` r
## reflect on ^^ and make a few notes to yourself; inspiration
##   * does the number of base + recommended packages make sense to you?
##   * how does the result of .libPaths() relate to the result of .Library?
```

Going further

``` r
## if you have time to do more ...

## is every package in .Library either base or recommended?
all_default_pkgs <- list.files(.Library)
all_br_pkgs <- ipt %>%
  filter(Priority %in% c("base", "recommended")) %>%
  pull(Package)
setdiff(all_default_pkgs, all_br_pkgs)
```

    ##   [1] "abind"         "assertthat"    "backports"     "base64enc"    
    ##   [5] "BH"            "bindr"         "bindrcpp"      "bitops"       
    ##   [9] "broom"         "callr"         "caTools"       "cellranger"   
    ##  [13] "circlize"      "circular"      "cli"           "clipr"        
    ##  [17] "clisymbols"    "coda"          "colorspace"    "crayon"       
    ##  [21] "curl"          "DBI"           "dbplyr"        "denstrip"     
    ##  [25] "desc"          "dichromat"     "digest"        "dotCall64"    
    ##  [29] "dplyr"         "enc"           "evaluate"      "expm"         
    ##  [33] "fields"        "forcats"       "fs"            "ggplot2"      
    ##  [37] "gh"            "git2r"         "GlobalOptions" "glue"         
    ##  [41] "gtable"        "haven"         "highr"         "hms"          
    ##  [45] "htmltools"     "httr"          "ini"           "jsonlite"     
    ##  [49] "knitr"         "labeling"      "lazyeval"      "lubridate"    
    ##  [53] "magrittr"      "maps"          "maptools"      "markdown"     
    ##  [57] "mcmcplots"     "mime"          "mnormt"        "modelr"       
    ##  [61] "msm"           "munsell"       "mvtnorm"       "openssl"      
    ##  [65] "pillar"        "pkgconfig"     "plogr"         "plyr"         
    ##  [69] "psych"         "purrr"         "R2jags"        "R2WinBUGS"    
    ##  [73] "R6"            "rARPACK"       "raster"        "RColorBrewer" 
    ##  [77] "Rcpp"          "RcppEigen"     "readr"         "readxl"       
    ##  [81] "rematch"       "rematch2"      "reprex"        "reshape2"     
    ##  [85] "rgdal"         "rgeos"         "rjags"         "rlang"        
    ##  [89] "rmarkdown"     "rprojroot"     "RSpectra"      "rstudioapi"   
    ##  [93] "rvest"         "scales"        "selectr"       "sfsmisc"      
    ##  [97] "shape"         "sp"            "spam"          "stocc"        
    ## [101] "stringi"       "stringr"       "styler"        "tibble"       
    ## [105] "tidyr"         "tidyselect"    "tidyverse"     "translations" 
    ## [109] "truncnorm"     "usethis"       "utf8"          "viridisLite"  
    ## [113] "whisker"       "withr"         "xml2"          "yaml"

``` r
## study package naming style (all lower case, contains '.', etc

## use `fields` argument to installed.packages() to get more info and use it!
ipt2 <- installed.packages(fields = "URL") %>%
  as_tibble()
ipt2 %>%
  mutate(github = grepl("github", URL)) %>%
  count(github) %>%
  mutate(prop = n / sum(n))
```

    ## # A tibble: 2 x 3
    ##   github     n  prop
    ##   <lgl>  <int> <dbl>
    ## 1 F         74 0.514
    ## 2 T         70 0.486
