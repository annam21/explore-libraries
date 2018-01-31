  # What They Forgot to Teach You About R
  # Anna Moeller
  # 1/31/2018

  # rstd.io/forgot
  # Paper: Good enough practices in scientific computing

  # Installing packages example
  library(devtools)
  # Owner or Organization / package name
  devtools:install_github("tidyverse/dplyr")

  # Where are packages?
  .Library
  .libPaths()
  installed.packages()

  # Exercise 1
  install.packages("usethis")
  library(usethis)
  use_course("rstd.io/forgot_1")

  ########################################
  # R projects

  # Suggestion: in tools > global options, uncheck Restore .RData into workspace
   # Save workspace on exit Never
  ### HOORAY!!!!
  # Suggestion: restart R whenever clearing workspace
  # Resets packages, non-default options

  # Making a new project (new folder or existing work)
  # usethis::create_project("~")

  # Safe paths
  # NOT paste(), strsplit, etc.
  # USE normalizePath, file.path, ...
  # file.path("~", ...), fs::path_home, here::here
  # system.file(..., package = "thingy")

  library(usethis)
  use_course("rstd.io/forgot_2",
             destdir = "/Users/annamoeller/GitHub/School/JennyBC workshop")

#################################
  # Git
  # VC alternatives to Github = GitLab, BitBucket
  # Git built for development of Linux - we're using it "off label"

  # Using Git
  # Delta = diff

  # For downloading Git
  #' happygitwithr.com
  #' Install SourceTree or GitKraken
  #' Feel free to use a Git Client to start
  #'

