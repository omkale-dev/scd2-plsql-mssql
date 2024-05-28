# SCD Type 2 Basic Implementation PLSQL

This README provides instructions for setting up and running a Type 2 Slowly Changing Dimension (SCD) implementation script in SQL Server.

## Overview

This script demonstrates a basic implementation of SCD Type 2 using a staging table (`stg_customer_dim2`) and a target dimension table (`customer_dim2`). It tracks historical changes by creating new records for each change to a dimension attribute and updates the `is_active` flag accordingly.

## Usage

1. **Set Up SQL Server:**
   - Ensure you have Docker installed on your machine.
   - Spin up a SQL Server container using the provided Docker Compose template or any other method of your choice.

2. **Create Tables and Procedure:**
   - Execute the provided SQL script to create the staging and dimension tables.

3. **Load Data to Staging Table:**
   - Insert sample data into the `stg_customer_dim2` table using the provided INSERT statements.

4. **Execute SCD Type 2 Procedure:**
   - Execute the script to perform the SCD Type 2 operation on the `customer_dim2` table.

5. **View Results:**
   - View the updated records in the `customer_dim2` table to see the changes.
   - Optionally, you can also view the contents of the staging table (`stg_customer_dim2`) to verify the results.

## Note

This README is provided for reference. Please ensure you have a SQL Server environment set up and running before executing the SQL script.

---

This script is designed to help you understand and implement a basic SCD Type 2 process in SQL Server. 
Happy coding! 🚀