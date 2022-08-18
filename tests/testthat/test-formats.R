test_format <- function(name, output_options = NULL, skip = NULL) {

  # don't run on CRAN due to complicated dependencies (Pandoc/LaTeX packages)
  if (!identical(Sys.getenv("NOT_CRAN"), "true")) return()
  # skip if requested
  if (!is.null(skip) && isTRUE(skip)) return()

  journal <- if (hasName(output_options, "journal")) {
    output_options[["journal"]]
  } else {
    "CUP"
  }

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
    "Rendering the ", journal, " format..."
  )

  output_file <- rmarkdown::render(testdoc, output_options = output_options, quiet = TRUE)

  return(file.exists(output_file))
}

#####

for (journal in CUPrticles::journals()) {
  options <- list(journal = journal, manuscript = "note", keep_tex = FALSE)
  result <- test_format("cup", output_options = options)
  test_that(paste(journal, "renders..."), {
    expect_true(result)
  })
}
