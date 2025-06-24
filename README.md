# Walmart Sales Data Analysis: Using Python + SQL + Power BI

## Project Overview

![Project Pipeline](https://github.com/rohitgadhi99/Walmart-Sales-Analysis/blob/main/Walmart%20dashboard%20page1.png)

This is an end-to-end data analysis project designed to extract critical business insights from Walmart sales data. We utilize Python for data processing and analysis, SQL for advanced querying, and structured problem-solving techniques to solve key business questions and eventually visualized the results using Power BI. The project helped me hone my skills in data manipulation, SQL querying, and data pipeline creation.

---

## Project Steps

### 1. Set Up the Environment
   - **Tools Used**: Google Colab, Power BI, SQL (MySQL)
   - **API Setup**: To download a Kaggle dataset using its API in Google Colab, you'll first need to install the Kaggle API, upload your Kaggle API token (kaggle.json), and then use the API to download the desired                      dataset. Obtain your Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to your profile settings and downloading the JSON file.
   - Download Walmart Sales Data **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)

### 2. Explore the Data
   - **Goal**: Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues.
   - **Analysis**: Use functions like `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.

### 3. Data Cleaning
   - **Remove Duplicates**: Identify and remove duplicate entries to avoid skewed results.
   - **Handle Missing Values**: Drop rows or columns with missing values if they are insignificant; fill values where essential.
   - **Fix Data Types**: Ensure all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
   - **Currency Formatting**: Use `.replace()` to handle and format currency values for analysis.
   - **Validation**: Check for any remaining inconsistencies and verify the cleaned data.

### 4. Feature Engineering
   - **Create New Columns**: Calculate the `Total Amount` for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.
   - **Enhance Dataset**: Adding this calculated field will streamline further SQL analysis and aggregation tasks.

### 5. Load Data into MySQL
   - **Set Up Connections**: Connect to MySQL using `pymysql` and `sqlalchemy` and load the cleaned data into the database.
   - **Table Creation**: Set up tables in both MySQL using Python SQLAlchemy to automate table creation and data insertion.
   - **Verification**: Run initial SQL queries to confirm that the data has been loaded accurately.

### 6. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Write and execute complex SQL queries to answer critical business questions, such as:
     - Revenue trends across branches and categories.
     - Identifying best-selling product categories.
     - Sales performance by time, city, and payment method.
     - Analyzing peak sales periods and customer buying patterns.
     - Profit margin analysis by branch and category.
    
### 7. Visualized the results in Power BI
   - Created a 3 page interactive dashboard analyzing Walmart's sales data, exploring various visuals, created DAX measures wherever required
   - The first page showing KPIs, total sales by various parameters and the average ratings by custmers.
   - The second page showing the time trends i.e. sales by hour, day, month and by category.
   - The third is profitability analysis showing profit with respect to different parameters.

     ![Project Pipeline](https://github.com/rohitgadhi99/Walmart-Sales-Analysis/blob/main/Walmart%20dashboard%20page2.png)

     ![Project Pipeline](https://github.com/rohitgadhi99/Walmart-Sales-Analysis/blob/main/Walmart%20dashboard%20page3.png)


## Results and Insights

- **Sales Insights**: The categories contributing to majority of sales are 'Fashion accessories' and  'Home and lifestyle' and customers most preferred Credit card as payment method
- **Profitability**: The above two were also the most profitable categories for walmart
- **Customer Behavior**: The peak profitable hours were 3 PM to 8 PM of the day where customers tend to shop more.


