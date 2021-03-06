#' @details This function requires having a character vector with one or more valid Report Suites specified.
#'
#' @description Get whether unique visitor variable is enabled for the specified report suites. 
#' 
#' @title Get Whether Unique Visitor Variable Enabled for a Report Suite(s)
#' 
#' @param reportsuite.ids Report suite id (or list of report suite ids)
#'
#' @importFrom jsonlite toJSON
#' @importFrom plyr rbind.fill
#'
#' @return Data frame
#'
#' @export
#'
#' @examples
#' \dontrun{
#' uniq <- GetUniqueVisitorVariable("your_report_suite")
#' 
#' uniq2 <- GetUniqueVisitorVariable(report_suites$rsid)
#' }

GetUniqueVisitorVariable <- function(reportsuite.ids) {
  
  request.body <- c()
  request.body$rsid_list <- reportsuite.ids
  
  response <- ApiRequest(body=toJSON(request.body),func.name="ReportSuite.GetUniqueVisitorVariable")
  
  #Don't even know if this is possible, holdover from GetSegments code
  if(length(response$unique_visitor_variable[[1]]) == 0) {
      return(print("Unique Visitor Variable Not Defined For This Report Suite"))
    }

  return(response)

}