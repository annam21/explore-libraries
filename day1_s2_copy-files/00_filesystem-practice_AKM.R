  ## Sketch of how I would copy the .R files from, e.g.,
  ## ~/Desktop/day1_s1_explore-libraries
  ## to the current project

  # First, make an Rproject
  usethis::create_project("~/GitHub/School/JennyBC workshop")

  # Find desktop files
  tomove <- file.path("/Users/annamoeller/Desktop/day1_s1_explore-libraries")

  # Name the R files in that directory
  from_files <- list.files(tomove,
                           pattern = "\\.R$",
                           full.names = T)

  ## form the new file names, based on existing file names
  to_files <- basename(from_files)
### COOL!

  #
  file.path("day1_s1_explore-libraries")

  ## copy the files from there to here
  file.copy(from_files, to_files)

  ## list the files here (and look in file browser) to verify success

  ## Done already? Ideas to keep you going:
  ## Can you make your code cleaner, tighter, more readable, more robust? DO IT.
  ## Try again, now using the fs package.
  ## Can you figure out why Jenny names projects and files the way she does?
  ## Can you make a nice data frame of metadata, with one row per file or project?
