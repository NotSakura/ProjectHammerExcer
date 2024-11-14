#### Preamble ####
# Purpose: to downlaod the grocery data
# Author: Shreya Sakura Noskor, Khushaal Nandwani, Prankit Bhardwaj, Veyasan Ragulan
# Date: 14 November 2024


#### Workspace setup ####
library(tidyverse)
# Load necessary libraries
library(validate)

set.seed(123)  # For reproducibility

# Simulating the 'product' table (20 products)
generate_upc <- function() {
  paste0(sample(0:9, 12, replace = TRUE), collapse = "")
}

generate_sku <- function() {
  paste0(sample(letters, 10, replace = TRUE), collapse = "")
}

product_data <- data.frame(
  id = 1:20,
  concatted = paste0("Product_", 1:20),
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
  detail_url = paste0("http://example.com/product_", 1:20),
  sku = sapply(1:20, function(x) generate_sku()),
  upc = sapply(1:20, function(x) generate_upc()),
  stringsAsFactors = FALSE
)

# Simulating the 'raw' table (20 rows, product_id linked to product_data)
raw_data <- data.frame(
  nowtime = Sys.time() + seq(0, by = 3600, length.out = 20),
  current_price = round(runif(20, 1, 20), 2),
  old_price = round(runif(20, 1, 20), 2),
  price_per_unit = round(runif(20, 0.5, 5), 2),
  other = sample(c("On Sale", "Limited Time Offer", "Discounted", "None"), 20, replace = TRUE),
  product_id = sample(1:20, 20, replace = TRUE),
  stringsAsFactors = FALSE
)

# Validation Rules using `validate` package

# Define validation rules
rules <- validator(
  # Product Data Validation Rules
  product_id_exists = all(product_data$id %in% raw_data$product_id),  # Ensure all product_ids in raw_data exist in product_data
  product_name_not_empty = all(nchar(product_data$product_name) > 0),  # Ensure product names are not empty
  vendor_not_empty = all(nchar(product_data$vendor) > 0),  # Ensure vendor names are not empty
  brand_valid = all(product_data$brand %in% c("BrandA", "BrandB", "BrandC", "BrandD")),  # Ensure valid brands
  valid_sku_length = all(nchar(product_data$sku) == 10),  # SKU should be 10 characters
  valid_upc_length = all(nchar(product_data$upc) == 12),  # UPC should be 12 digits
  
  # Raw Data Validation Rules
  price_non_negative = all(raw_data$current_price >= 0),  # Ensure current price is non-negative
  price_per_unit_positive = all(raw_data$price_per_unit > 0),  # Ensure price per unit is positive
  price_changed = all(raw_data$current_price != raw_data$old_price),  # Ensure price change
  product_id_exists_in_product = all(raw_data$product_id %in% product_data$id),  # Ensure raw_data.product_id exists in product_data.id
  other_value_check = all(raw_data$other %in% c("On Sale", "Limited Time Offer", "Discounted", "None"))  # Check "other" field values
)

# Validate the data
validation_results <- confront(product_data, rules)

# Print validation results
summary(validation_results)

  
  