initialize_project <- function(project_path = ".") {
  #' Initialize an R project folder with standard subfolders and a .gitignore file.
  #'
  #' @param project_path Path to the project root directory, default is current directory.
  #'
  #' @return Logical value indicating if the initialization was successful.
  #' @examples
  #' # Initialize project folders and .gitignore in the current directory
  #' initialize_project()
  #'
  #' # Initialize project folders and .gitignore in a specified directory
  #' initialize_project("/path/to/your/project")

  # Define subfolders
  subfolders <- c("R", "tests", "vignettes")

  # Create the subfolders if they do not exist
  for (folder in subfolders) {
    folder_path <- file.path(project_path, folder)
    if (!dir.exists(folder_path)) {
      dir.create(folder_path, recursive = TRUE)
      message("Created folder: ", folder_path)
    } else {
      message("Folder already exists: ", folder_path)
    }
  }

  # Define .gitignore content
  gitignore_content <- "
# Project folders
data
tests

# Mac files
.DS_Store

# R Markdown files
*.docx
*.html

# History files
.Rhistory
.Rapp.history

# Session Data files
.RData
.RDataTmp

# User-specific files
.Ruserdata

# Example code in package build process
*-Ex.R

# Output files from R CMD build
/*.tar.gz

# Output files from R CMD check
/*.Rcheck/

# RStudio files
.Rproj.user/

# produced vignettes
vignettes/*.html
vignettes/*.pdf

# OAuth2 token, see https://github.com/hadley/httr/releases/tag/v0.3
.httr-oauth

# knitr and R markdown default cache directories
*_cache/
/cache/

# Temporary files created by R markdown
*.utf8.md
*.knit.md

# R Environment Variables
.Renviron

# pkgdown site
docs/

# translation temp files
po/*~

# RStudio Connect folder
rsconnect/

# local files
xc_local*
"

  # Path to .gitignore file
  gitignore_path <- file.path(project_path, ".gitignore")

  # Check if .gitignore file already exists
  if (!file.exists(gitignore_path)) {
    # Write .gitignore file to the project root
    writeLines(gitignore_content, con = gitignore_path)
    message("Created .gitignore file at: ", gitignore_path)
  } else {
    message(".gitignore file already exists at: ", gitignore_path)
  }

  return(TRUE)
}
