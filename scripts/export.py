""" This script exports the data from the SQLite database to a CSV file. 
This is run once all the sql scripts have been run and the data has been processed.
"""

import sqlite3
import csv

conn = sqlite3.connect("hammer-2-processed.sqlite")
cursor = conn.cursor()

# Query all data from the table
cursor.execute("SELECT * FROM ls")

# Fetch all rows and get column names
rows = cursor.fetchall()
column_names = [description[0] for description in cursor.description]

# Write data to CSV file
with open("../data/leeks.csv", "w", newline="") as csv_file:
    writer = csv.writer(csv_file)
    writer.writerow(column_names)  # Write header
    writer.writerows(rows)  # Write data

# Close the connection
conn.close()
