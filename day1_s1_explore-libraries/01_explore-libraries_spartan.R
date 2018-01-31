  #' Which libraries does R search for packages?
  .Library
  .libPaths()
  
  #' Installed packages
  # Macintosh HD/Library/Frameworks/R.framework/Versions/3.4/Resources/library/rjags
  
  ## use installed.packages() to get all installed packages
  
  ## how many packages?
  pack <- installed.packages() %>%
    as_tibble
  dim(pack)
  # 143
  
  #' Exploring the packages
  
  ## count some things! inspiration
  ##   * tabulate by LibPath, Priority, or both
  pack %>% 
    count(LibPath, Priority)
  
  ##   * what proportion need compilation?
  pack %>% 
    count(NeedsCompilation) %>%
    mutate(prop = n/sum(n))
  
  ##   * how break down re: version of R they were built on
  pack %>% count(Built)
  
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
  
  ## if you have time to do more ...
  
  ## is every package in .Library either base or recommended?
  ## study package naming style (all lower case, contains '.', etc
  pack %>% 
    select(Package)
  ## use `fields` argument to installed.packages() to get more info and use it!
