#### Preamble ####
# Purpose: to downlaod the grocery data
# Author: Shreya Sakura Noskor, Khushaal Nandwani, Prankit Bhardwaj, Veyasan Ragulan
# Date: 14 November 2024


#### Workspace setup ####
library(tidyverse)
set.seed(853) 


#### Simulate data ####

# Helper function to generate random UPC and SKU without stringi
generate_upc <- function() {
  paste0(sample(0:9, 12, replace = TRUE), collapse = "")
}

generate_sku <- function() {
  paste0(sample(letters, 10, replace = TRUE), collapse = "")
}

# Simulating the 'product' table
product_data <- data.frame(
  id = 1:20,  # 20 example products
  concatted = paste0("Product_", 1:20),  # Concatenated name
  vendor = sample(c("VendorA", "VendorB", "VendorC", "VendorD"), 20, replace = TRUE),
  product_name = c(
    "Organic Banana", "Whole Wheat Bread", "Almond Milk", "Eggs", 
    "Chicken Breast", "Rice", "Spinach", "Tomato", "Cheddar Cheese", 
    "Apple", "Frozen Peas", "Greek Yogurt", "Oatmeal", "Avocado", 
    "Granola Bars", "Canned Tuna", "Coconut Oil", "Olive Oil", 
    "Organic Carrots", "Soy Sauce"
  ),
  units = sample(c("lb", "oz", "g", "kg", "bottle", "box", "can"), 20, replace = TRUE),
  brand = sample(c("BrandA", "BrandB", "BrandC", "BrandD"), 20, replace = TRUE),
  detail_url = paste0("http://example.com/product_", 1:20),  # Mock URL
  sku = sapply(1:20, function(x) generate_sku()),  # Random SKU for each product
  upc = sapply(1:20, function(x) generate_upc()),  # Random UPC for each product
  stringsAsFactors = FALSE
)

# Display the product data
head(product_data, 10)  # Displaying first 10 rows

# Simulating the 'raw' table (corresponding product_id)
raw_data <- data.frame(
  nowtime = Sys.time() + seq(0, by = 3600, length.out = 20),  # 20 different times
  current_price = round(runif(20, 1, 20), 2),  # Random current price between 1 and 20
  old_price = round(runif(20, 1, 20), 2),  # Random old price between 1 and 20
  price_per_unit = round(runif(20, 0.5, 5), 2),  # Random price per unit
  other = sample(c("On Sale", "Limited Time Offer", "Discounted", "None"), 20, replace = TRUE),
  product_id = sample(1:20, 20, replace = TRUE),  # Random product IDs matching the product table
  stringsAsFactors = FALSE
)

# Display the raw data
print(raw_data)


#### Save data ####
write_csv(raw_data, "data/00-simulated_data/simulated_price_data.csv")
write_csv(product_data, "data/00-simulated_data/simulated_product_data.csv")
