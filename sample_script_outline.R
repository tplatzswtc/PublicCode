###=================================================================================###
### title: example script for airum: average credits by gender and fiscal year (data request id #156)
### author: tyler platz
### date: 2024-11-06
### r-version: 4.1.3
### notes: this is an example script that shows how to create a script header,
###        outline sections using comment blocks, and organize code to make
###        collaborating with others easier. this sample script:
###        1. loads student data from our sis (duplicated by program)
###        2. aggregates student credits across program by student and fiscal year
###        3. computes the average credit load per student by gender and fiscal year as a summary table
###        4. exports that table as a csv to send to financial aid
###=================================================================================###

  # clear environment
  rm(list = ls(all.names = TRUE)); gc()
  
  # clear console
  shell("cls")
  
  # print the current r version
  print(R.version.string)

###=================================================================================###
### 1. library packages
###=================================================================================###

  # library packages
  library(data.table)
  library(readxl)
  
  # source functions
  source("Z:/test_folder/functions/sheet_reader_fun.R")
  
###=================================================================================###
### 2. set parameters
###=================================================================================###

  # set timestamp
  p_timestamp <- Sys.Date()
  
  # set input directory
  p_dir_in <- "Z:/test_folder/testing_data/input_data/"
  
  # set output directory
  p_dir_out <- "Z:/test_folder/testing_data/output/input_data"
  
  # set export toggle
  p_opt_export <- FALSE
  
###=================================================================================###
### 3. load data
###=================================================================================###

  # load in student data file, keeping as text to preserve leading zeros
  in_student_data <- data.table(sheet_reader_fun(paste0(p_dir_in, "StudentCreditData.xlsx"), col_types = "text"))
  
###=================================================================================###
### 4. clean data
###=================================================================================###

  # student data is duplicated across program within fiscal year: aggregate across programs by student to get student-level credit load
  student_data <- in_student_data[!is.na(StudentID), .(Gender  = unique(Gender),
                                                       Credits = sum(as.numeric(CreditsTaken), na.rm = TRUE)), by = c("StudentID", "FiscalYear")]
  
  # we need student-level credit load by fiscal year and gender: aggregate student-level data by fiscal year and gender
  summary_data <- student_data[ , .(Credits = mean(Credits)), by = c("FiscalYear", "Gender")]
  
###=================================================================================###
### 5. export
###=================================================================================###

  # export toggle
  if(p_opt_export){
  
    # create results file
    fwrite(x    = summary_data,
    file = paste0(p_dir_out, "GenderCreditLoadSummary-", p_timestamp, ".csv"))
    
  }
