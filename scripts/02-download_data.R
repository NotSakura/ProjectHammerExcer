#### Preamble ####
# Purpose: to downlaod the grocery data
# Author: Shreya Sakura Noskor, Khushaal Nandwani
# Date: 14 November 2024
# Contact: sakura.noskor@mail.utoronto.ca
# Pre-requisite: Download the dataset from [https://jacobfilipp.com/hammer/](https://jacobfilipp.com/hammer/)


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
# [...UPDATE THIS...]

#### Download data ####
# [...ADD CODE HERE TO DOWNLOAD...]



#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "inputs/data/raw_data.csv") 

         
