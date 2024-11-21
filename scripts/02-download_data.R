#### Preamble ####
# Purpose: to downlaod the grocery data
# Author: Shreya Sakura Noskor, Khushaal Nandwani, Prankit Bhardwaj, Veyasan Ragulan
# Date: 14 November 2024
# Pre-requiste: download the data from [https://jacobfilipp.com/hammer/](https://jacobfilipp.com/hammer/). It is the "Zipped CSV with full price data" button. 

library(httr)
library(DBI)
library(RSQLite)

# URL of the data source
url <- "https://jacobfilipp.com/hammerdata/hammer-3-compressed.zip"

# download the data
GET(url, write_disk("hammer-3-compressed.zip", overwrite = TRUE))

# extract zip
unzip("hammer-3-compressed.zip")

# delete zip file
file.remove("hammer-3-compressed.zip")

# move sqllite file to data/01-raw-data
if (!dir.exists("data/01-raw-data")) {
  dir.create("data/01-raw-data", recursive = TRUE)
}

file.rename("hammer-2-processed.sqlite", "data/01-raw-data/hammer-2-processed.sqlite")
