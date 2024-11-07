###=================================================================================###
### title: airum workshop presentation
### author: tyler platz
### date: 2024-11-07
###=================================================================================###
###=================================================================================###
### slide 1: a scary scenario (comments primer)
###=================================================================================###

  # scenario: you completed a data request (or required reporting task) several months
  #           ago. a colleague approaches you and asks for the same report using updated
  #           data. are you:
  #             a. trying to remember how you did the request
  #             b. trying to remember where you saved that report
  #             c. filled with terror
  #             d. all of the above




###=================================================================================###
### slide 2: context and example script
###=================================================================================###

  # i have to imagine that this happens very often in institutional research.
  # the work we do in ir is:
  #   1. very complex
  #   2. fast paced
  #   3. high stakes

  # one way r can help is by being a written novel of each analysis you do:
  # (please jump to sample_script_outline.R)




###=================================================================================###
### slide 3: reflecting
###=================================================================================###

  # things to note about sample_script_outline.R:
  #   1. the file header
  #   2. the comment section blocks
  #   3. comments on EACH line of code
  #   4. the use of timestamps in the results file name
  #   5. indentation for organization


  # we can leverage the written nature of code to create a written log of:
  #   1. the data we use (files, locations, dates of extraction)
  #   2. the data cleaning processes we use
  #   3. the time the analysis was performed
  #   4. the data we create


  ##examples##

  # timestamp it!
  p_timestamp <- Sys.Date()
  
  ###=================================================================================###
  ### a. this is a comment section block
  ###=================================================================================###
  
    ###=================================================================================###
    ### b. this is a comment sub-section (indented)
    ###=================================================================================###

      # and here's another example of indentation to show how multiple lines are linked
      # to the same chunk of code:
      a_data_table <- a_source_table[ , .(student_id  = `Student ID`,
                                          fiscal_year = `Fiscal Year`,
                                          gender_male = ifelse(Gender == "M", 1, 0),
                                          age         = as.numeric(`Student Age (Years)`))]

      
      
  
###=================================================================================###
### slide 4: ######## comment comment comment ########
###=================================================================================###

  # while code itself is useful for documentation, we need to COMMENT our code
  # to maximize its effectiveness.

  # how do we code? see this entire document!
  #   1. single line commenting
  #   2. multi-
  #      line
  #      comments
  #      are
  #      possible!
  #   3. we can't comment at the start of code lines     list_item_3 <- rnorm(100, mean = 0, sd = 1)
  list_item_4 <- rnorm(100, mean = 0, sd = 1) # but we can comment at the end of code!
  
  # (we'll get to comment section blocks in a minute)
      
  
      
  
###=================================================================================###
### slide 5: snippets to make life easier
###=================================================================================###

  # but tyler, copying and pasting that comment block every time is going to take forever!
  
  # yes, it will! so use snippets instead! let's open tplatz_snippets.txt
      
  # these are snippets, or code shortcuts. to install these snippets:
  #   1. go to the rstudio menu and select 'tools'
  #   2. select 'global options'
  #   3. in the left panel, select 'code'
  #   4. at the bottom, click the 'edit snippets' button
  #   5. copy and paste the contents of tplatz_snippets.txt at the bottom of the snippets editor (or create your own!)
  #   6. click 'save'
  #   7. click 'apply'
  #   8. exit the window
      
  # to use a snippet, simply type the shortcut you created. the snippets in this file include:
      
      beg
      
      com
      
      export
      
      gplots
      
  
  # snippets can save you tons of time in organizing your code and standardize code
  # organization across your ir team
      
    
        
      
###=================================================================================###
### slide 6: functional functions
###=================================================================================###

  # let's look back at sample_script_outline.R: what the heck is sheet_reader_fun? that's not in any R package
      
  # correct! it is a custom function i wrote to make reading in multi-sheet excel workbooks easier,
  # which is something i do a lot of.
      
  # custom functions are just like functions in r packages we libary: they short-cut processes
  # that we do a lot of. some people call these 'wrappers'
      
  # functions help with:
  #   1. not writing the same code over and over again (saves time)
  #   2. ensuring you're using the same process when you want to
  #   3. organizing techniques across a team
  #   4. making your code easier to read
     
       

      
###=================================================================================###
### slide 7: writing, sourcing, and using functions
###=================================================================================###

  # to write a function, let's look at sheet_reader_fun.R
      
  # notice this is a simple r script. when writing functions, we want the script to:
  #   1. tell us what the function does (using comments!)
  #   2. have written code that executes the function
  #   3. be self-contained (no extra data processing outside of the function)
  #   4. as often as possible, not reference external packages/libraries
  #   5. use the :: operator to access packages whenever we absolutely have to
  #   6. be named in a manner which makes understanding its contents easy
      
  # to source a pacakge, just point r to the location of the r file:
  source("Z:/test_folder/functions/sheet_reader_fun.R")
      
  # to use your function, just write the name! once sourced, we can call it just like:
      
      mean()
      median()
      grepl()
      sheet_reader_fun()
      
  # bonus tip: specify the ... to allow access to internal function options (like col_types in readxl::read_excel)

  # q: why not just write our own package instead of a bunch of loosely managed functions?
  # a: go for it! functions are the short-cut, packages can be much more powerful (although more complex to start)
      
  # for a fantastic resource on functions and more: https://r4ds.had.co.nz/functions.html

      

      
###=================================================================================###
### slide 8: directory manipulation
###=================================================================================###

  # let's take a look at this snippet quick:
      
  export
  
  # q: we're creating a csv file in a directory... so can't we do more in that directory?
  
  # a: yes we can! there is an entire family of functions in base r for manipulating 
  # and exploring directory objects:
  
  ?dir.create
  ?dir.exists
  ?dirname
  ?list.files
  ?list.dirs
  ?file.access
  ?file.append
  ?file.copy
  ?file.create
  ?file.info
  # and more!

  # these function look in paths you provide to access, create, move, copy, and append
  # files in directories.
  
  # (WARNING: these functions are actually manipulating files! so always use caution when
  #           using directory functions, as you can create way too many, delete the wrong one,
  #           or max out your server's memory if incorrectly specified. it's pretty hard to
  #           do, but always take extra care to test your functions on small, limited
  #           areas (like your personal drive) if you're in doubt)
  

  
  
###=================================================================================###
### slide 9: a scenario - part 2
###=================================================================================###

  # scenario: each week, a snapshot of student credit load from your sis saved to a shared drive. 
  #           there are thousands of reports saved as excel files, and someone wants all that data
  #           combined and summarized. all the files are structured identically do you:
  #               a. spend the next three months copying + pasting data into one excel file
  #               b. tell them it is not possible
  #               c. use r directory functions to blow their mind and finish the task in two hours
  
  
  # it's actually very easy, even moreso if the files are named with a pattern. we can use:
  
  all_the_files <- list.files("Z:/credit_snapshots/", full.names = TRUE, recursive = TRUE)

  
  # to get a list of all the files in that directory path (recursive makes sure it checks sub-folders)
  # from here, we can use:
  
  all_the_real_files <- grep("CreditReportSSRS", all_the_files, value = TRUE)
  
  
  # to get just the ones with 'CreditReportSSRS' in the title, skipping all the other secondary files.
  # now using either a loop or an apply function, we can use:
  
  all_the_real_files_loaded <- data.table::rbindlist(lapply(all_the_real_files, function(x) read_excel(x)), use.names = TRUE)

  
  # to load and stack all those files into r. 3-months of work in three lines of code!
  
  
  
  
###=================================================================================###
### slide 10: a scenario - part 3
###=================================================================================###

  # scenario: now let's suppose we need to be the one making those snapshot reports.
  #           we have a single student credit file and each week we need to save a snapshot
  #           into a folder named the date the report was saved. we need to do this every
  #           monday morning, what can we do?
  #               a. block of an hour each monday morning to do this task
  #               b. write a word document outlining the steps and give the task to someone else
  #               c. use r directory functions again and save time + reduce errors
  

  # of course it's c again! not only can we read in data with directory functions,
  # we can also create directories. we can use:
  
  dir.create("ZZ:/reports/CreditReport 2024-11-07")
  
  
  # to create that folder. even better, because we're running this every monday, we can use:
  
  p_timestamp <- Sys.Date()
  p_directory <- "ZZ:/reports/"
  
  dir.create(paste0(p_directory, "Credit Report ", p_timestamp))
  
  
  # to create the directory using parameters! now we never need to type in a date again. going even
  # further, let's say we have a huge list of dates we need folders for:
  
  dates_list <- c("2024-11-07", "2024-11-08", "2024-11-09")
  
  
  # we can iteratively create all those dated folders using a loop (lapply may not always function properly):
  
  # initiate the loop
  for(i in 1:length(dates_list)){
    
    # create that directory! (using [i] to select each individual element of the list)
    dir.create(paste0(p_directory, "Credit Report ", dates_list[i]))
    
  }

  
  # that barely scratches the surface of directory functions, so read more here:
  # https://www.r-bloggers.com/2021/05/working-with-files-and-folders-in-r-ultimate-guide/
  
  
  
  
###=================================================================================###
### slide 11: excel!
###=================================================================================###

  # working with excel from r isn't always worth it, but sometimes you can automate
  # tasks such as:
  #     1. creating workbook templates
  #     2. appending rows

  # take for example this code below that i use as part of a function which creates
  # templates for data requests:
  
  # load workbook
  wb <- openxlsx::loadWorkbook(paste0(updated_base_dir, "/00_CE_Response/CE_Response_Workbook.xlsx"))
  
  # edit title
  openxlsx::writeData(wb, sheet = "Request Info", xy = c(2,3),  x = title)
  openxlsx::writeData(wb, sheet = "Request Info", xy = c(2,4),  x = priority)
  openxlsx::writeData(wb, sheet = "Request Info", xy = c(2,5),  x = requester)
  openxlsx::writeData(wb, sheet = "Request Info", xy = c(2,6),  x = date_submit)
  openxlsx::writeData(wb, sheet = "Request Info", xy = c(2,7),  x = due_date)
  openxlsx::writeData(wb, sheet = "Request Info", xy = c(2,8),  x = request_type)
  openxlsx::writeData(wb, sheet = "Request Info", xy = c(2,9),  x = assigned_to)
  openxlsx::writeData(wb, sheet = "Request Info", xy = c(2,10), x = description)
  
  # add the location
  openxlsx::writeData(wb, sheet = "Cover Page", xy = c(1, 2), x = updated_base_dir)
  
  # save the workbook
  openxlsx::saveWorkbook(wb, paste0(updated_base_dir, "/00_CE_Response/CE_Response_Workbook.xlsx"), overwrite = TRUE)

  
  
  # in this code, i am writing data from a data request into an excel workbook template.
  # instead of manually copying and pasting this info into the template every time i fill
  # out a data request, i use this code (that is within a function) to do it for me.
  
  # this is a little more complicated than i can fully cover here, so check out:
  # https://ycphs.github.io/openxlsx/articles/Introduction.html
  