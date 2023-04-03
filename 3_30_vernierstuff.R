read_vernier <- function(path){
  txt <- readLines(path)
  starts <- grep("Vernier",txt)
  
  # seems like "Vernier" is followed by 6 useless lines, then the data, then an empty line
  # the word "Vernier" should mark the end of each run output by the computer ...
  # well, the beginning of a run actually
  
  # build vector of skip values:
  skips <- starts+6
  # remove last one because it *seems* to always be empty
  skips <- skips[1:length(skips)-1]
  # define empty list
  df_list <- list()
  # i <- 1
  # define function to read in each as a new item in the empty list
  for(i in seq_along(skips)){
    run <- read_delim(file=path,
                      col_names = FALSE,
                      delim = "\t",
                      skip = skips[i],
    )
    run$X4 <- NULL # remove empty column
    names(run) <- c("volume","pH","temp_c")# rename columns
    run$run <- paste0("run_",i) # add run name column
    max_n <- min(grep("Vernier",run$volume)) - 1 # find last line before first instance of "Vernier"
    # run[1:(max_n),] %>% View
    
    run <- run[1:(max_n),]# subset to remove everything after that
    run <- run %>%
      mutate(volume = as.numeric(volume),
             pH = as.numeric(pH),
             temp_c = as.numeric(temp_c))# convert to numeric
    df_list[[i]] <- run # add to list of data frames
  }
  # df_list
  # combine all items from list into new data frame
  df_all <- reduce(df_list,full_join)
  return(df_all)
}


#making function:
  

myfunction <- function(x){
  y <- x*2
  return(y)
}
myfunction("a")

myfunction <- function(x,y){
  z <- x*y
  return(z)
}
myfunction(2,6)

myfunction <- function(x,y=10){
  z <- x*y
  return(z)
}
myfunction(2,2) #(default y=10, can be overwwritten)
