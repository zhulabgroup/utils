create_symlink_turbo <- function(project_symlink, turbo_target) {
  #' Create a symbolic link in the project directory to UMich Turbo Research Storage.
  #'
  #' @param project_symlink Path relative to the project root where the symbolic link will be created.
  #' @param turbo_target Path relative to the Turbo mount point.
  #'
  #' @return Logical value indicating if the symbolic link was successfully created.
  #' @examples
  #' create_symlink_turbo("data", "project-folder")

  # Detect operating system
  os_name <- Sys.info()[["sysname"]]

  # Determine the mount point based on OS
  turbo_mount_point <- switch(os_name,
    Darwin = "/Volumes/seas-zhukai", # macOS
    Linux = "/nfs/turbo/seas-zhukai", # Linux
    Windows = "Z:\\", # Windows
    stop("Unsupported operating system: ", os_name)
  )

  # Construct target and symlink paths
  target <- file.path(turbo_mount_point, turbo_target)
  project_root <- here::here()
  symlink <- file.path(project_root, project_symlink)

  # Check if symlink already exists and is valid
  symlink_exists <- file.exists(symlink)
  valid_symlink <- FALSE
  
  if (symlink_exists) {
    if (os_name == "Windows") {
      valid_symlink <- symlink_exists
    } else {
      valid_symlink <- (Sys.readlink(symlink) == target)
    }
  }

  # Avoid recreating valid symlink
  if (valid_symlink) {
    message("Valid symbolic link already exists: ", symlink, " -> ", target)
    return(TRUE)
  }

  # Remove existing invalid symlink
  if (symlink_exists) {
    message("Removing existing symlink: ", symlink)
    unlink(symlink, recursive = TRUE)
  }

  # Create symbolic link based on OS
  success <- switch(os_name,
    Darwin = file.symlink(target, symlink), # macOS
    Linux = file.symlink(target, symlink), # Linux
    Windows = R.utils::createLink(symlink, target), # Windows
    stop("Unsupported operating system: ", os_name)
  )

  # Report success or failure
  if (!success) {
    warning("Failed to create symbolic link: ", symlink, " -> ", target)
    return(FALSE)
  } else {
    message("Symbolic link created: ", symlink, " -> ", target)
    return(TRUE)
  }
}
