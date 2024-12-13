% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/initialize_project.R
\name{initialize_project}
\alias{initialize_project}
\title{Initialize R Project}
\usage{
initialize_project(
  project_path = ".",
  subfolders = c("R", "tests", "vignettes"),
  overwrite_gitignore = FALSE
)
}
\arguments{
\item{project_path}{Path to the project root directory, default is current directory.}

\item{subfolders}{A character vector of subfolder names to create, default is c("R", "tests", "vignettes").}

\item{overwrite_gitignore}{Logical, whether to overwrite existing .gitignore file, default is FALSE.}
}
\value{
Logical value indicating if the initialization was successful.
}
\description{
Initialize an R project folder with standard subfolders and a .gitignore file.
}
\examples{
\dontrun{
# Initialize project folders and .gitignore in the current directory
initialize_project()

# Initialize project folders and .gitignore in a specified directory
initialize_project("/path/to/your/project")

# Initialize project folders with custom subfolders and overwrite existing .gitignore file
initialize_project(
  project_path = "/path/to/your/project",
  subfolders = c("R", "data", "docs"),
  overwrite_gitignore = TRUE
)
}
}
