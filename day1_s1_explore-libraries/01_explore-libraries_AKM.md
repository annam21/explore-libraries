01\_explore-libraries\_AKM.R
================
annamoeller
Wed Jan 31 14:33:54 2018

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

Which libraries does R search for packages?

``` r
  .Library
```

    ## [1] "/Library/Frameworks/R.framework/Resources/library"

``` r
  .libPaths()
```

    ## [1] "/Library/Frameworks/R.framework/Versions/3.4/Resources/library"

``` r
  # This is a change, to see if github_document works 
  
  #' Installed packages
  # Macintosh HD/Library/Frameworks/R.framework/Versions/3.4/Resources/library/rjags
  
  ## use installed.packages() to get all installed packages
  
  ## how many packages?
  pack <- installed.packages() %>%
    as_tibble
  dim(pack)
```

    ## [1] 144  16

``` r
  # 143
  
  #' Exploring the packages
  
  ## count some things! inspiration
  ##   * tabulate by LibPath, Priority, or both
  pack %>% 
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
  pack %>% 
    count(NeedsCompilation) %>%
    mutate(prop = n/sum(n))
```

    ## # A tibble: 3 x 3
    ##   NeedsCompilation     n   prop
    ##   <chr>            <int>  <dbl>
    ## 1 no                  62 0.431 
    ## 2 yes                 77 0.535 
    ## 3 <NA>                 5 0.0347

``` r
  ##   * how break down re: version of R they were built on
  pack %>% count(Built)
```

    ## # A tibble: 4 x 2
    ##   Built     n
    ##   <chr> <int>
    ## 1 3.4.0    57
    ## 2 3.4.1    12
    ## 3 3.4.2    18
    ## 4 3.4.3    57

``` r
  #' Reflections
### Is there something in this that tells you if they need to be updated? 
  
  ## reflect on ^^ and make a few notes to yourself; inspiration
  ##   * does the number of base + recommended packages make sense to you?
  ##   * how does the result of .libPaths() relate to the result of .Library?
  
  
  #' Going further
  #' 
  # For handling file paths
  library(fs)
  path_real(.Library) # What does this do? 
```

    ## /Library/Frameworks/R.framework/Versions/3.4/Resources/library

``` r
  ## if you have time to do more ...
  
  ## is every package in .Library either base or recommended?
  ## study package naming style (all lower case, contains '.', etc)
  pack %>% 
    select(Package)
```

    ## # A tibble: 144 x 1
    ##    Package   
    ##    <chr>     
    ##  1 abind     
    ##  2 assertthat
    ##  3 backports 
    ##  4 base      
    ##  5 base64enc 
    ##  6 BH        
    ##  7 bindr     
    ##  8 bindrcpp  
    ##  9 bitops    
    ## 10 boot      
    ## # ... with 134 more rows

``` r
  ## use `fields` argument to installed.packages() to get more info and use it!
```
