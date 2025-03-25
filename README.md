# Mint Classics Inventory Optimization Project

## Overview

This project addresses a common business challenge: inventory optimization. I worked as a data analyst for a fictional company called Mint Classics, a retailer of classic model cars, to help them analyze their inventory and make recommendations to reduce storage costs by closing one of their warehouses. The goal was to provide data-driven insights that support business decisions, while maintaining excellent customer service.

## Project Goals

*   **Reduce Storage Costs:** Help Mint Classics identify opportunities to reduce their inventory footprint and close a storage facility.
*   **Maintain Customer Service:** Ensure that any inventory reductions don't negatively impact order fulfillment times or customer satisfaction.
*   **Improve Inventory Efficiency:** Optimize inventory levels to minimize holding costs while meeting customer demand.

## Skills Demonstrated

This project demonstrates the following skills:

*   **SQL Querying:** Writing complex SQL queries to extract, transform, and analyze data from a MySQL database.
*   **Data Visualization:** Creating an interactive and informative dashboard using Power BI to visualize key metrics and trends.
*   **Data Analysis:** Identifying patterns, anomalies, and opportunities for improvement within the data.
*   **Business Communication:** Translating data insights into clear, concise recommendations for business stakeholders.
*   **Database Knowledge**: Deep understanding of data models to gain access and manage required data

## Data Sources

The data for this project comes from a MySQL database provided by Mint Classics. The key tables include:

*   **Products:** Contains information about each product (product code, name, description, quantity in stock, warehouse code, etc.).
*   **OrderDetails:** Contains information about the items included in each order (product code, quantity ordered, price, etc.).
*   **Warehouses:** Contains information about the storage facilities (warehouse code, name, location, capacity, etc.).

[You can find a Data Dictionary in this repository that explains all fields for each of the tables.](https://github.com/yourusername/mint-classics-inventory/blob/main/DATA_DICTIONARY.md)

## SQL Queries
[Each SQL query includes extensive commentary within to further explain it's purposes for helping non-SQL literate analysts to follow along!](https://github.com/yourusername/mint-classics-inventory/blob/main/SQL_SCRIPTS.md)

## Analysis and Key Findings

The following steps was implemented to come to a better outcome for the company

1. Inventory Review to identify the volume within our storage unit (The most efficient was Bar Chart to display volume by storage locations.

*Image of warehouse volumetrics would show and describe the key insight here.*
1. Identify products which don't turnover efficiently (The most useful was creating a scatter-plot to help find relationships for better visualization.)

*Image of products without turning would show and describe the key insight here.*

Through my analysis, I found the following:

*   **Warehouse Imbalance:**  One warehouse (South) has a significantly lower total inventory compared to the others. *Show bar chart*.
*   **Inventory Distribution:** The analysis found the different products assigned within the warehouses allowing to compare the product quantities for an even-er output. *Refer to distribution model of inventories.*
*   **Slow Moving Products** It showed those specific inventories, and why the location warehouse D must get consolidated and the volume can easily transfer to warehouse C which can better accommodate all other goods/assets. *Visualize as tabular chart.*

## The Power BI Dashboard

To provide an interactive and visual exploration of the data, I developed a Power BI dashboard with the following features:

*   **Warehouse Utilization:** A bar chart displaying the total inventory stored at each warehouse.
*   **Sales vs. Inventory:** A scatter plot showing the relationship between total sales and current inventory for each product.
*   **High Inventory/Low Sales:** A table highlighting products with high inventory levels but low sales, sorted by current inventory.
*   **Not Moving Products:** A table showing products that have not been sold at all (or very little) , listed with products listed by their location for inventory transference purposes.
*   **Inventory Turnover:** Each table includes an inventory volume that measures the efficiency in order processing for each good to compare the most critical items
*   **Filtering:** Slicers that allow users to filter the data by warehouse, product line, and date range.
   To provide quick analytics.

The Power BI dashboard `.pbix` file can be found within the directory to open and interactively engage

## Recommendations

Based on my analysis of the data, I recommend the following to Mint Classics:

1.  **Warehouse Consolidation** Warehouse D can fully transfer it's remaining quantities for warehouse to locations
2.  **Inventory Adjustment** Reducing inventory by shipping between location
3.  **Stop Carrying Out Non-Moving Inventory.** Items for non-sales, which have no sales volume in comparison need to get discontinue or removed

By applying these strategies we expect for warehouse D to shutdown

[Here's the actual recommendations and thought process that occurred during analysis.](linkToPDFIfYouMadeOne.PDF)

## Files in this Repository

*   `README.md`: This file.
*   `Mint_Classics_Inventory_Dashboard.pbix`: The Power BI dashboard file.
*   `/SQL_SCRIPTS/`: Directory containing the SQL queries used in this project.
*   `DATA_DICTIONARY.md`: A detailed data dictionary explaining the tables and fields.
*  `MIT_LICENSE.txt`: Describes all license to engage in

Feel free to connect for discussions and follow the insights in this project, any advice helps improve me!
