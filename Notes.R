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
  # Git(Hub)
  # VC alternatives to Github = GitLab, BitBucket
  # Git built for development of Linux - we're using it "off label"

  # Using Git
  # Delta = diff

  # For downloading Git
  #' happygitwithr.com
  #' Install SourceTree or GitKraken
  #' Feel free to use a Git Client to start
  #'

  # Resources
  # ProGit book
  # Git in Practice book

  # Search Github: resources on Happy Git with R
  # YUCK.
  # Need *language:r extension:r* to get any results
  # MAKE SURE YOU CLICK "CODE"
  # Can install package lookup (use lookup() and lookup_usage())

  # Can do version control on .pngs
  # Can look at .csvs in GitHub online
  # Render the "flow" of the analysis (table)
##########################################
  # Rendering reports
  # You can put yaml in R code!
  #' ---
  #' output: github_document
  #' ---
  # Multiple outputs: github_document; word_document
  # OH MY GOD. You can't have spaces at the beginnings of lines in yaml

  #' In Rmarkdown: render = ball of yarn
  #' In R: render = spiral notebook
  #'
  #' In R: use #' to write in prose. This prints as part of the document
  #' instead of inside the code as a comment.
  #'
  #' global chunks
  #' knitr::opts_chunk$set(
  #' collapse = T,
  #' comment = "#>",
  #' out.width = "100%"
  #' )

  # Put sessionInfo() at the end of your document, so when you render it,
  #   you have a record of your versions (R, packages, etc.)

  #' Emojis
  #' https://gist.github.com/rxaviers/7360908

  #########################################################
  # Map
  # Pull out a thing from each element of the list, and put it into a dataframe
  map_dfr(minis, '[', c("pants", "torso", "head"))

  ## map(YOUR_LIST, YOUR_FUNCTION)
  ## map(YOUR_LIST, STRING)
  ## map(YOUR_LIST, INTEGER)

  # pmap for iterating over each row of a dataframe
  # unnest for changing list column to long dataframe (?)

  #####################################################
  # Miscellaneous
  # R Startup files
  #' .Rprofile - read on forgot repo
  #'

  # Packages
  # Hadley package "strict" - choose which function you want to win
  # reprex - package for making you write a self-contained example of your
  #   problem. Formats it so you can put it on GitHub
  # jimhester/autoinst reinstall pacakges when you update R
  #' Rvest, httr for webscraping

  #' Webscraping examples on JennyBC: fattest cat, O Rly covers

  # Put in stopifnots for yourself when you autopilot run an analysis 10 times

  # git mv (move) to rename a file (shell)
  # Or, you may be able to rename it in Finder as long as it's the only
  # diff in the commit

  #########################################
  #' Questions
  #' Working on multiple OSs - file head and end
  #' --- clone or fork? Clone. Fork is a GitHub-specific verb that basically clones
  #' and sets up some plumbing to talk to the "original". If yours is the original
  #' Then you're fine.
  #' Windows: google git autocrlf.
  #' In git bash: git config --global core.autocrlf input set to True
  #'
  #'
