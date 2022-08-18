#' R Markdown output formats for Cambridge University Press journals.
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
#' * `pasa`: Publications of the Astronomical Society of Australia.
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
#' ...,number_sections,keep_tex,latex_engine,highlight,fig_caption,md_extensions,template,pandoc_args
#' Arguments passed to [rmarkdown::pdf_document()].
#'
#' @export
cup_article <- function(journal = c("default", "aog", "jog", "bjps", "psrm", "jpup", "jjps", "pasa"),
                        manuscript = c("article", "communication", "letter", "note", "review", "suppinfo",  "research-paper"),
                        keep_tex = TRUE,
                        md_extensions = c(
                          "-autolink_bare_uris" # disables automatic links
                        ), pandoc_args = NULL, ...) {

  journal <- match.arg(journal)
  manuscript <- match.arg(manuscript)

  pasa <- journal == "pasa"
  citation_package <- if (pasa) { "natbib" } else { "biblatex" }

  args <- c(
    "journal" = journal,
    "manuscript" = manuscript,
    "pasa" = pasa
  )

  message(pasa)

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
