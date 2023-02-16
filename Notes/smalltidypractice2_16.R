library(tidyverse)
library(readxl)

names(run1) <- c("time_s","temp_c")
names(run2) <- c("time_s","temp_c")

#new column
run1$run <- "run_1"
run2$run <- "run_2"

#combine the two runs together into a tidy data frame
full_join(run1,run2)

read.delim()

grep("Vernier",)

  