#' R Markdown output formats for Cambridge University Press journals.
#'
#' @param manuscript The argument `manuscript` accepts these types of journal contributions:
#' - article
#' - communication
#' - letter
#' - note
#' - review
#' - suppinfo
#' - research-paper
#'
#' @param
#' ...,number_sections,keep_tex,latex_engine,citation_package,highlight,fig_caption,md_extensions,template,pandoc_args
#' Arguments passed to [rmarkdown::pdf_document()].
#'
#' @section Details: You can find more details about each output format below.
#' @name cup_article
NULL

#' @section `cup_article`:  Cambridge University Press journals.
#' Adapted from
#' <https://www.overleaf.com/latex/templates/template-for-submission-to-political-science-research-and-methods/qytgqmgznvnh>.
#'
#' @param journal The argument `journal` accepts the acronym of any of these
#' Cambridge University Press journals:
#'
#' * `default`: Default journal style
#' * `aog`: Annals of Glaciology
#' * `jog`: Journal of Glaciology
#' * `bjps`: British Journal of Political Science
#' * `psrm`: Political Science and Research Methods
#' * `jpup`: Journal of Public Policy
#' * `jjps`: Japanese Journal of Political Science
#'
#' @rdname cup_article
#' @export
cup_article <- function(journal = c("default", "aog", "jog", "bjps", "psrm", "jpup", "jjps"),
                        manuscript = c("article", "communication", "letter", "note", "review", "suppinfo",  "research-paper"),
                        keep_tex = TRUE,
                        citation_package = "biblatex",
                        md_extensions = c(
                          "-autolink_bare_uris" # disables automatic links
                        ), pandoc_args = NULL, ...) {

  journal <- match.arg(journal)
  manuscript <- match.arg(manuscript)

  if (citation_package == "natbib") {
    stop("CUP template does not support `natbib` for citation processing.")
  }

  args <- c(
    "journal" = journal,
    "manuscript" = manuscript
  )

  # Convert to pandoc arguments
  pandoc_arg_list <- vec_to_pandoc_variable_args(args)

  pdf_document_format(
    "cup",
    keep_tex = keep_tex,
    citation_package = citation_package,
    md_extensions = md_extensions,
    pandoc_args = c(pandoc_arg_list, pandoc_args),
    ...
  )
}

#' @section `pasa_article`: Publications of the Astronomical Society of Australia.
#' Adapted from
#'   <https://www.overleaf.com/latex/templates/publications-of-the-astronomical-society-of-australia/nbjxzvhrrgbx>.
#' @rdname cup_article
#' @export
pasa_article <- function(
    manuscript = c("article", "communication", "letter", "note", "review", "suppinfo", "research-paper"),
    keep_tex = TRUE,
    md_extensions = c("-autolink_bare_uris"),
    citation_package = "natbib",
    pandoc_args = NULL, ...) {

  if (citation_package == "biblatex") {
    stop("PASA template does not support `biblatex` for citation processing.")
  }

  args <- c(
    "manuscript" = manuscript
  )

  # Convert to pandoc arguments
  pandoc_arg_list <- vec_to_pandoc_variable_args(args)

  pdf_document_format(
    "pasa",
    keep_tex = keep_tex,
    citation_package = citation_package,
    md_extensions = md_extensions,
    pandoc_args = c(pandoc_arg_list, pandoc_args),
    ...
  )
}
