# E-Commerce Customer Segmentation and Sales Forecasting

## Project Overview

This project analyzes transaction data from an online retail business to understand sales trends, customer behavior, and key revenue drivers. The goal is to use data analytics techniques to turn raw transaction data into business insights that could help a retailer better understand its customers and improve decision-making.

The project includes:

* data cleaning
* exploratory data analysis
* customer segmentation
* sales trend analysis
* basic sales forecasting
* SQL analysis
* dashboarding

## Executive Summary

This project analyzed online retail transaction data to understand sales performance, customer behavior, product trends, and future revenue patterns. The analysis found that revenue is concentrated among a small group of customers, products, and countries. The United Kingdom generated the majority of sales, while a few high-performing products and customers contributed a large share of revenue.

Customer segmentation using RFM analysis showed that customers can be grouped into meaningful business segments, including High Value, Mid Value, Low Value, and At Risk customers. These segments can help the business create more targeted marketing and retention strategies.

The forecasting analysis showed that a simple naive forecast performed better than exponential smoothing on this dataset. This suggests that the limited time range and revenue volatility make future sales difficult to predict using more complex models.

Overall, the project demonstrates how Python, SQL, and Tableau can be used together to clean data, analyze business performance, segment customers, forecast sales, and present insights through a dashboard.


## Business Problem

Online retailers generate large amounts of transaction data, but raw data alone does not explain how the business is performing. This project is designed to answer practical business questions such as:

* Which customers generate the most value?
* Which products and countries drive the most revenue?
* How do purchasing patterns change over time?
* Can customers be grouped into meaningful segments?
* Can future sales trends be estimated from historical data?

## Dataset

Dataset name: Online Retail

Source: UCI Machine Learning Repository

File used: `Online Retail.xlsx`

The dataset contains transaction-level records from a UK-based online retail business. Key columns include:

* `InvoiceNo`
* `StockCode`
* `Description`
* `Quantity`
* `InvoiceDate`
* `UnitPrice`
* `CustomerID`
* `Country`

## Tools Used

* Python
* pandas
* Jupyter notebooks
* VS Code
* MySQL
* Tableau
* matplotlib
* seaborn
* scikit-learn
* statsmodels

## Project Structure

```text
online-retail-analysis/
│
├── data/
│   ├── raw/
│   └── cleaned/
├── notebooks/
├── sql/
├── tableau/
└── README.md
```

## Cleaned Data Output

The cleaned dataset was saved as:

`data/cleaned/online_retail_cleaned.csv`

## Cleaning Summary

Before starting the analysis, the raw transaction data was cleaned to make it more reliable for business insights.

The following cleaning steps were completed:

* Removed rows with missing `CustomerID` values because customer-level analysis and segmentation require a valid customer identifier.
* Removed rows with missing `Description` values to make product-level analysis clearer and easier to interpret.
* Removed canceled transactions by identifying invoice numbers that start with `C`.
* Removed rows with non-positive `Quantity` values because they do not represent valid completed sales.
* Removed rows with non-positive `UnitPrice` values because they would distort revenue calculations.
* Converted `InvoiceDate` to datetime format for easier time-based analysis.
* Created new columns to support later analysis:

  * `Revenue` = `Quantity * UnitPrice`
  * `InvoiceMonth`
  * `InvoiceDay`
  * `InvoiceHour`
  * `Weekday`

These cleaning steps were used to create a more consistent dataset for analyzing revenue trends, customer behavior, product performance, and customer segments.

## Exploratory Data Analysis Summary

After cleaning the dataset, the next stage of the project focused on exploratory data analysis to better understand overall business performance, revenue patterns, customer behavior, and product performance.

The analysis includes:

* overall business summary metrics
* monthly revenue trends
* top countries by revenue
* top products by revenue
* top products by quantity sold
* top customers by revenue

### Current Findings

#### Overall Business Overview

* The dataset represents 18,532 unique transactions.
* The dataset includes 4,338 unique customers.
* Total revenue in the cleaned dataset is 8,911,407.90.

#### Revenue Over Time

* Monthly revenue was analyzed to identify trends and possible seasonality.
* Revenue appears to peak in certain months, especially during the holiday season.
* A noticeable spike appears in October and November, which suggests seasonal demand.

#### Country Analysis

* Revenue is concentrated in a small number of countries.
* The top country by revenue is the United Kingdom.
* Other high-performing countries include the Netherlands, EIRE, and Germany, but the majority of sales were in the UK.
* This suggests that the retailer’s sales are domestically concentrated.

#### Product Analysis

* The highest-revenue products include Paper Craft, Little Birdie; Regency Cakestand 3 Tier; and White Hanging Heart T-Light Holder.
* The highest-quantity products include Paper Craft, Little Birdie; Medium Ceramic Top Storage Jar; and World War 2 Gliders Asstd Designs.
* Comparing revenue and quantity suggests that some products are strong volume drivers, while others contribute more revenue per sale.
* Paper Craft, Little Birdie topped the charts in both categories, making it the strongest overall item for the retailer.

#### Customer Analysis

* A small group of customers appears to generate a large share of total revenue.
* The top customer by revenue is customer ID 14646.
* This suggests that customer value is unevenly distributed and supports the need for customer segmentation in the next stage of the project.

### Key Takeaways

* Revenue is not evenly distributed over time and may show seasonal patterns.
* A small number of countries contribute a large share of total sales.
* Product performance differs depending on whether it is measured by revenue or quantity sold.
* Customer spending appears concentrated among a relatively small number of high-value customers.
* These findings motivate the next stage of the project: RFM-based customer segmentation.

## Customer Segmentation Summary

After completing the exploratory analysis, the next stage of the project focused on customer segmentation using RFM analysis.

RFM stands for:

* Recency: how recently a customer made a purchase
* Frequency: how often a customer places orders
* Monetary: how much revenue a customer generates

The purpose of this stage was to better understand differences in customer value and purchasing behavior.

### Segmentation Methods Tested

Two segmentation approaches were explored:

1. RFM scoring
2. K-means clustering

The RFM scoring approach was used as the main segmentation method for business interpretation because it produced more balanced and easier-to-explain customer groups. K-means clustering was also tested as a comparison method.

### RFM Scoring Process

For each customer, the following metrics were calculated:

* Recency = days since most recent purchase
* Frequency = number of unique orders
* Monetary = total revenue generated by the customer

Customers were then assigned R, F, and M scores based on quartiles, and these scores were combined into a total RFM score. Based on the total score, customers were placed into four business-friendly segments:

* High Value
* Mid Value
* Low Value
* At Risk

### Segment Distribution

The segment count results showed:

* High Value: 1,268
* Mid Value: 1,275
* Low Value: 988
* At Risk: 807

This distribution suggests that the customer base includes a meaningful mix of high-value and mid-value customers, while also containing a smaller group of at-risk customers who may need re-engagement.

### K-means Clustering Comparison

K-means clustering was also applied to the RFM variables after scaling the data. This produced a different distribution of customer groups, with more uneven cluster sizes.

This difference is expected because:

* RFM scoring is based on predefined score ranges.
* K-means clustering groups customers based on mathematical similarity in the data.

Because the RFM scoring approach produced more interpretable results for business recommendations, it was selected as the primary segmentation method for the project.

### Key Findings

* Customer value is not evenly distributed across the customer base.
* A smaller portion of customers falls into the High Value segment and contributes disproportionately more revenue.
* The At Risk group represents customers with weaker recent engagement and may be important for retention strategies.
* The segmentation results support the idea that different customer groups should be targeted with different business actions.

### Business Recommendations

Based on the RFM segmentation results, the following actions are recommended:

* High Value customers should be targeted with loyalty rewards, exclusive promotions, and retention campaigns.
* Mid Value customers should be encouraged to purchase more frequently through upselling and cross-selling efforts.
* Low Value customers may respond to lower-cost promotional campaigns or introductory offers.
* At Risk customers should be targeted with win-back campaigns, discounts, or re-engagement emails.

### Why This Matters

This stage of the project moves beyond descriptive analysis by showing how customer transaction data can be used to create actionable business segments. These findings help connect the analysis to real-world decisions in customer retention, marketing, and revenue growth.

## Sales Forecasting Summary

The final stage of the project focused on forecasting future monthly revenue using the historical sales time series.

Monthly revenue was created by aggregating transaction-level revenue by month. A simple train-test split was used, with the final three months held out for evaluation.

Two forecasting methods were tested:

1. Naive forecast
2. Exponential smoothing

### Model Comparison

The naive forecast produced lower error on both evaluation metrics:

* Naive MAE: 243,368.33
* Naive RMSE: 282,882.70
* Exponential Smoothing MAE: 307,999.28
* Exponential Smoothing RMSE: 310,794.13

Because the naive model had lower MAE and RMSE, it was selected as the better-performing forecasting method for this dataset.

### Forecast Interpretation

The results suggest that a simple baseline forecast outperformed the more complex trend-based model. This likely reflects the short time span of the data and the volatility in monthly revenue, especially near the holiday period.

The forecasting analysis shows that:

* monthly revenue can be modeled as a time series
* baseline models are important for comparison
* more complex models do not always improve performance
* forecast results should be interpreted cautiously when historical data is limited

### Limitation

The forecasting stage is limited by the short time horizon of the dataset. Since the available data covers only about one year of monthly sales, the models may not fully capture repeating seasonal behavior.

## SQL Analysis Summary

As part of the project, the cleaned retail dataset was imported into MySQL to perform business-focused SQL analysis. This step was used to show how SQL can be applied to answer the same kinds of questions explored earlier in Python, but directly through database queries.

### SQL Setup

* Created a MySQL database for the project
* Created a transaction table for the cleaned retail data
* Imported the cleaned CSV file into MySQL
* Verified the data load with row count and sample queries

### SQL Analysis Completed

The following business questions were answered using SQL:

* total revenue
* total unique customers
* total unique transactions
* monthly revenue trends
* top countries by revenue
* top products by revenue
* top products by quantity sold
* top customers by revenue
* orders per customer
* revenue by weekday
* revenue by hour

### Why This Matters

This stage of the project demonstrates the ability to move from spreadsheet-style analysis into database-based analysis. It shows how SQL can be used to query, summarize, and analyze business data efficiently.

### Files Created

* `sql/session6_queries.sql`

### Key Takeaway

The SQL portion of the project reinforced the same major findings from the Python analysis, including revenue concentration across a small number of countries, uneven customer value, and strong differences in product performance depending on whether performance is measured by revenue or quantity sold.

## Dashboard Summary

An interactive Tableau dashboard was created to summarize the main findings from the analysis.

The dashboard includes:

* Total revenue
* Total number of customers
* Total transactions
* Monthly revenue trend
* Top countries by revenue
* Top products by revenue
* Top products by quantity sold
* Customer segment distribution
* Revenue forecast

The goal of the dashboard is to present the main business insights in a clear and easy-to-read format.

### Dashboard Preview

![Online Retail Dashboard](../Tableau/online_retail_dashboard.png)

## Key Business Insights

### 1. Revenue is concentrated in the United Kingdom

The United Kingdom generated the majority of total revenue in the dataset. Other countries such as the Netherlands, EIRE, and Germany also contributed revenue, but at a much smaller scale. This shows that the business is heavily dependent on its domestic market.

### 2. A small number of products drive major revenue

Product performance was not evenly distributed. A few products, such as Paper Craft, Little Birdie and Regency Cakestand 3 Tier, generated a large share of revenue. Some products performed strongly by quantity sold, while others performed better by revenue.

### 3. Product pricing may create profit maximization opportunities

The difference between top products by quantity sold and top products by revenue suggests that some products sell in high volume but do not generate as much revenue per item. These products may have room for careful price increases. Even if a small price increase causes a slight drop in quantity sold, the product could still generate more total revenue overall.

On the other hand, products with high revenue but lower quantity sold may already have strong pricing power or higher unit prices. For these items, the business could test whether small discounts or bundles increase quantity sold enough to raise total revenue.

This shows that product performance should not only be judged by quantity sold or total revenue alone. Both metrics should be compared together to identify better pricing and promotion strategies.

### 4. Customer value is unevenly distributed

The customer analysis showed that a small group of customers generated a large portion of total revenue. The top customer by revenue was customer ID 14646. This supports the importance of customer segmentation and retention strategies.

### 5. RFM segmentation creates useful customer groups

RFM analysis separated customers into High Value, Mid Value, Low Value, and At Risk segments. These segments make it easier to understand customer behavior and create targeted marketing actions.

### 6. Simple forecasting performed better than a complex model

The naive forecast had lower error than exponential smoothing. This suggests that the dataset’s short time period and monthly revenue volatility made it difficult for a more complex model to improve performance.

## Business Recommendations

### 1. Focus retention efforts on High Value customers

High Value customers should be prioritized because they generate a meaningful share of revenue. The business could offer loyalty rewards, early access to promotions, or exclusive discounts to encourage repeat purchases.

### 2. Re-engage At Risk customers

At Risk customers have weaker recent engagement and may be close to leaving. The business could target them with win-back emails, limited-time discounts, or personalized product recommendations.

### 3. Promote top-performing products more strategically

Products that perform well by both revenue and quantity should be featured more often in marketing campaigns. These products may also be useful for bundles, seasonal promotions, or homepage placement.

### 4. Test pricing strategies for high-volume and high-revenue products

The business should compare products by both quantity sold and total revenue to identify pricing opportunities. For high-quantity but lower-revenue products, small price increases could help increase total revenue even if the number of units sold decreases slightly.

For high-revenue but lower-quantity products, the business could test promotions, bundles, or small discounts to see whether increased sales volume improves overall revenue. These pricing tests should be done carefully so the business can find the best balance between price, demand, and total revenue.

### 5. Reduce overdependence on one market

Since most revenue comes from the United Kingdom, the business may want to explore growth opportunities in other high-performing countries such as the Netherlands, EIRE, and Germany.

### 6. Use forecasting as a planning tool, not a perfect prediction

The forecast should be used as a rough planning guide rather than an exact prediction. More historical data would be needed to create a stronger forecasting model.

## Limitations

* The dataset covers only about one year of transactions, which limits the strength of the forecasting analysis.
* Some rows were removed during cleaning because they had missing customer IDs, missing descriptions, canceled invoices, or invalid quantities and prices.
* The analysis is based only on transaction data and does not include customer demographics, marketing campaign data, website activity, inventory data, or profit margin data.
* The pricing recommendations are based on revenue and quantity patterns, not actual cost or margin data.
* The forecasting models were limited to simple baseline methods, so more advanced models could be tested in the future.

## Future Improvements

Future improvements could include:

* testing more advanced forecasting models
* adding customer demographic or marketing campaign data
* adding product cost and profit margin data
* calculating profit instead of only revenue
* testing price elasticity for high-volume products
* creating product recommendation analysis
* analyzing customer churn risk
* building a more interactive Tableau dashboard with filters
* comparing customer segments across different countries
* analyzing seasonal product demand in more detail

