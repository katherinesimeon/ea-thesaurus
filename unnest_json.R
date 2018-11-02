## Script for looking at the Edinburgh Associative Thesaurus 

# Load packages
library(tidyverse)
library(rjson)
library(DT) 

json_data <- fromJSON(file='ea-thesaurus.json')

head(json_data)

json_df <- as.data.frame(json_data)
dim(json_df) # one giant row!
head(json_df) # ugh.

# Unlist the fromJSON() output
json_unlisted <- lapply(json_data, 
                        function(x) {
                          x[sapply(x, is.null)] <- NA
                          unlist(x)
                        })

# Combine our dissected parts of the json file and make it a dataframe
EAT <- as.data.frame(do.call("rbind", json_unlisted))

dim(EAT) # 78 rows, 8210 columns

EAT_tbl <- as.tibble(EAT)
EAT_tbl
