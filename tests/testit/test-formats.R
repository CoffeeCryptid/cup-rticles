test_format <- function(name, output_options = NULL, skip = NULL) {

  # don't run on CRAN due to complicated dependencies (Pandoc/LaTeX packages)
  if (!identical(Sys.getenv("NOT_CRAN"), "true")) return()
  # skip if requested
  if (!is.null(skip) && isTRUE(skip)) return()

  # work in a temp directory
  dir <- tempfile()
  dir.create(dir)
  oldwd <- setwd(dir)
  on.exit(setwd(oldwd), add = TRUE)

  # create a draft of the format
  testdoc <- paste0(name, "_article", ".Rmd")
  rmarkdown::draft(
    testdoc, pkg_file_template(name),
    create_dir = FALSE, edit = FALSE
  )

  message(
    "Rendering the ", name, " format...",
    if (!is.null(output_options)) " (with output options)"
  )
  output_file <- rmarkdown::render(testdoc, output_options = output_options, quiet = TRUE)
  assert(paste(name, "format works"), {
    file.exists(output_file)
  })
}

#--- NOTE to contributors ------------------------------------------------------
# Please order these tests by formats alphabetically.
#-------------------------------------------------------------------------------

test_format("cup")
test_format("pasa")
