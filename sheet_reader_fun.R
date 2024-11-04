# function: sheet_reader_fun
# description: reads all sheets in an excel file and stacks them
# dependencies: readxl and data.table
# notes: assumes sheets are stackable. use read_excel options (use.names and fill) to adjust assumptions of stackability

# declare function name
sheet_reader_fun <- function(f_file, ...){
  
  # list the sheets in the file
  sheets <- readxl::excel_sheets(f_file)
  
  # read in all excel sheets found
  fun_data <- lapply(sheets, function(x) readxl::read_excel(f_file, sheet = x, ...))
  
  # stack sheets
  fun_data <- data.table::rbindlist(fun_data)
  
  # return data
  return(fun_data)
  
}