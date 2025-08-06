Mitron-Bank-Credit-Card-Analytics💳

# Mitron Bank Credit Card Strategy: A Data-Driven Analysis

## 📌 Project Overview
This project focuses on **leveraging customer demographic and spending data** to provide actionable insights and strategic recommendations for Mitron Bank's new credit card launch. The goal was to identify key customer segments, understand their spending behaviors, and propose tailored credit card features to maximize adoption and usage.

## Problem Statement
Mitron Bank aims to diversify its product line by introducing a new range of credit cards. This analysis, performed as a pilot project for AtliQ Data Services, uses a sample dataset of 4,000 customers across five Indian cities to guide the bank's strategy team in tailoring credit card offerings to customer preferences and market trends.

## Project Pipeline & Technologies Used
This project follows a comprehensive data analysis pipeline:

1.  **Data Extraction & Transformation (ETL):**
    * **Tool:** Python (Pandas, NumPy)
    * **Process:** Loaded raw CSV data (`dim_customers.csv`, `fact_spends.csv`), performed data cleaning, merged datasets, and derived key metrics such as 'Total Spends per Customer' and 'Average Income Utilization %'.
    * **Script:** [`product_strategy.ipynb`](product_strategy.ipynb)

2.  **Data Loading & Storage:**
    * **Tool:** MySQL
    * **Process:** Created a relational database schema to store processed customer and spending data. Data was loaded from Python into MySQL tables.
    * **Schema & Loading Script:** [`Product_Analytics.sql`](Product_Analytics.sql) (for table creation) and integrated into `data_preparation.py` for loading.

3.  **Data Visualization & Dashboarding:**
    * **Tool:** Microsoft Power BI
    * **Process:** Connected to the MySQL database, built a dynamic and interactive dashboard with drill-down capabilities to visualize key performance indicators (KPIs), demographic breakdowns, spending patterns, and income utilization.
      
 * 📊 [**Explore the Live Power BI Dashboard**](https://app.powerbi.com/groups/me/reports/e103926e-c59b-4556-a7a4-fc3e088bcb04/03ac8bcc40120d11b37f?experience=power-bi)
   
 * **Dashboard Screenshots:** 
        * <img width="1201" height="678" alt="image" src="https://github.com/user-attachments/assets/8d651b57-8ef4-4c34-aa4c-7c6b7018cf7f" />
        * <img width="1211" height="688" alt="image" src="https://github.com/user-attachments/assets/6f743ff5-db48-4c45-a986-813299805016" />
        * <img width="1212" height="679" alt="image" src="https://github.com/user-attachments/assets/d56a0f5f-199a-4178-9b15-9baa50cf02d4" />
        * <img width="1214" height="683" alt="image" src="https://github.com/user-attachments/assets/d68df927-c6f5-4230-88b8-a1d8e33ddc07" />
        * <img width="1215" height="684" alt="image" src="https://github.com/user-attachments/assets/232a26dd-e6b3-47ea-bbf9-316c385ba477" />


4.  **Insight Generation & Recommendations:**
    * **Methodology:** Analyzed trends and patterns across various dimensions (age, gender, occupation, city, spending category, payment type) to identify high-value customer segments and unmet needs.
    * **Outcome:** Formulated data-driven recommendations for credit card features designed to resonate with target customers and improve usage likelihood.

## Key Insights
* **Demographic Focus:** Our core customer base is predominantly **male (65%)**, **married (78%)**, and falls within the **25-45 age group**. Key urban markets include **Mumbai, Delhi NCR, and Bengaluru**.
* **Spending Habits:** **Credit Card (41%) and UPI (27%)** are the most favored payment methods. Major spending categories are **Bills, Groceries, and Electronics**.
* **Income & Utilization:** **Business Owners** and **Salaried IT Employees** have the highest average incomes. **Salaried IT Employees (51%) and Freelancers (46%)** show the highest income utilization, indicating active spending relative to their income.
* **Market Leadership:** **Mumbai** is our flagship market, leading across all financial indicators (income, spend, and utilization).

## Credit Card Feature Recommendations
Based on our analysis, we recommend the following key features for Mitron Bank's new credit card:

1.  **Personalized Rewards for Essential Spending:**
    * Offer tiered cashback/points for `Bills` and `Groceries` (e.g., 3X on groceries, 2X on utilities).
    * Provide flexible redemption options (statement credits, travel, gift cards).

2.  **Seamless UPI Integration & Rewards:**
    * Design the new RuPay credit card for easy linking with major UPI platforms (PhonePe, Google Pay).
    * Offer bonus rewards for UPI transactions made via the credit card.

3.  **Exclusive Benefits for High-Value Segments:**
    * Develop a "premium" tier targeting high-earning professionals (`Business Owners`, `Salaried IT Employees`).
    * Include benefits like complimentary airport lounge access, exclusive discounts on `Travel` and `Electronics`, and higher initial credit limits.

## Presentation
A detailed presentation outlining the project, insights, and recommendations can be found here:
* [Link to Presentation PDF]https://www.canva.com/design/DAGu59mE6_A/H69VOgHjjhIJIM7_1apIvA/edit?ui=e30
* [Link to Video Presentation (YouTube/Vimeo)](https://www.youtube.com/your-video-link-here) - *Update this link once your video is uploaded!*


---
**Connect with me:** https://www.linkedin.com/in/mayank-sharma-95a93a104/

```
