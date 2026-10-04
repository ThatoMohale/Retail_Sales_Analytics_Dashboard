                        -- Exploratory Data Analysis --

select * from `nexafrica`.`default`.`superstore` limit 100;

DESCRIBE `nexafrica`.`default`.`superstore`;

SELECT COUNT(*) AS total_rows
FROM `nexafrica`.`default`.`superstore`;

SELECT
       COUNT(*) AS total_rows,
       COUNT(DISTINCT `order_id`) AS total_orders,
       COUNT(DISTINCT `customer_id`) AS total_customers,
       COUNT(DISTINCT `product_id`) AS total_products
FROM `nexafrica`.`default`.`superstore`;

                        -- Checking The Date Range --
SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM `nexafrica`.`default`.`superstore`;

                        -- Checking Total Sales --

SELECT
    SUM(sales) AS total_sales
FROM `nexafrica`.`default`.`superstore`;

SELECT
    SUM(profit) AS total_profit
FROM `nexafrica`.`default`.`superstore`;

SELECT
    SUM(quantity) AS total_quantity
FROM `nexafrica`.`default`.`superstore`;


                                -- QUESTION 1 --
                                    
                    --WHICH CATEGORY GENERATES THE MOST SALES--
SELECT
    category,
    SUM(sales) AS total_sales
FROM `nexafrica`.`default`.`superstore`
GROUP BY category
ORDER BY total_sales DESC;

-- Finding 1 — Category Sales: Technology was the highest-performing category by total sales, generating $836,154.03. Furniture generated $741,999.80, while Office Supplies generated $719,047.03. --

                                -- QUESTION 2--

                    --WHICH CATEGORY IS THE MOST PROFITABLE--
SELECT
    category,
    SUM(profit) AS total_profit
FROM `nexafrica`.`default`.`superstore`
GROUP BY category
ORDER BY total_profit DESC;

-- Finding 2 — Category Profitability: Technology was the most profitable category, generating $145,454.95 in total profit, followed by Office Supplies at $122,490.80. Furniture generated only $18,451.27, indicating substantially lower profitability despite having significant sales. --

                                -- QUESTION 3--

                    -- WHICH REGION GENERATES THE MOST SALES--
SELECT
    region,
    SUM(sales) AS total_sales
FROM `nexafrica`.`default`.`superstore`
GROUP BY region
ORDER BY total_sales DESC;

-- Finding 3 — Regional Sales: The West region recorded the highest total sales at $725,457.82, followed by the East region at $678,781.24. The South region recorded the lowest sales at $391,721.91, indicating a substantial difference in sales performance across regions. --

                                -- QUESTION 4--

                    -- WHICH REGION GENERATES THE MOST PROFIT--

SELECT
    region,
    SUM(profit) AS total_profit
FROM `nexafrica`.`default`.`superstore`
GROUP BY region
ORDER BY total_profit DESC;

-- Finding 4 — Regional Profitability: The West region generated the highest total profit at $108,418.45, followed by the East at $91,522.78. Although South generated lower sales than Central, it produced higher total profit ($46,749.43 vs. $39,706.36), indicating differences in profitability across regions.

                                -- QUESTION 5--

                     -- WHAT ARE THE TOP 10 PRODUCTS BY SALES --

SELECT
    product_name,
    SUM(sales) AS total_sales
FROM `nexafrica`.`default`.`superstore`
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- Finding 5 — Top-Selling Products: The Canon imageCLASS 2200 Advanced Copier was the highest-selling product, generating $61,599.82 in sales. It was followed by the Fellowes PB500 Electric Punch at $27,453.38 and the Cisco TelePresence System EX90 at $22,638.48. The leading product generated more than twice the sales of the second-highest product.

                                -- QUESTION 6--

                    -- WHAT ARE THE 10 LEAST PROFITABLE PRODUCTS --

SELECT
    product_name,
    SUM(profit) AS total_profit
FROM `nexafrica`.`default`.`superstore`
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;


-- Finding 6 — Loss-Making Products: The analysis identified 10 products with negative total profit. The Cubify CubeX 3D Printer Double Head Print recorded the largest loss at -$8,879.97, followed by the Lexmark MX611dhe Monochrome Laser Printer at -$4,589.97. Notably, the Cisco TelePresence System EX90 Videoconferencing Unit generated $22,638.48 in sales but recorded a loss of -$1,811.08, demonstrating that strong sales do not necessarily translate into profitability.

                                -- QUESTION 7--
                                
                -- WHICH SUB-CATEGORY GENERATES THE MOST SALES -- 

SELECT
    `sub-category`,
    SUM(sales) AS total_sales
FROM `nexafrica`.`default`.`superstore`
GROUP BY `sub-category`
ORDER BY total_sales DESC;

-- Finding 7 — Sub-Category Sales: Phones generated the highest sub-category sales at $330,007.05, closely followed by Chairs at $328,449.10. Storage, Tables, and Binders were also among the stronger-performing sub-categories. In contrast, Fasteners recorded the lowest sales at $3,024.28, followed by Labels and Envelopes.

                                -- QUESTION 2--

SELECT
    `sub-category`,
    SUM(profit) AS total_profit
FROM `nexafrica`.`default`.`superstore`
GROUP BY `sub-category`
ORDER BY total_profit DESC;

-- Finding 8 — Sub-Category Profitability: Copiers were the most profitable sub-category, generating $55,617.82, followed by Phones at $44,515.73 and Accessories at $41,936.64. Three sub-categories generated negative profit: Tables (-$17,725.48), Bookcases (-$3,472.56), and Supplies (-$1,189.10). Tables are particularly notable because they generated $206,965.53 in sales while recording a loss, indicating a potential profitability issue requiring further investigation.

                                -----------------
                            -- CUSTOMER ANALYSIS --
                                -----------------
-- Analysing customer sales, Orders, Profit and Customer Behaviour.
                               
SELECT
    customer_id,
    customer_name,
    SUM(sales) AS total_sales
FROM `nexafrica`.`default`.`superstore`
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Finding 9 — Top Customers by Sales: Sean Miller was the highest-selling customer, generating $25,043.05 in total sales, followed by Tamara Chand at $19,052.22 and Raymond Buch at $15,117.34. The remaining customers in the top 10 generated between approximately $12,129 and $14,596 in sales.

SELECT
    customer_id,
    customer_name,
    SUM(profit) AS total_profit
FROM `nexafrica`.`default`.`superstore`
GROUP BY customer_id, customer_name
ORDER BY total_profit DESC
LIMIT 10;

-- Finding 10 — Customer Profitability: Tamara Chand generated the highest total profit at $8,981.32, followed by Raymond Buch at $6,976.10 and Sanjit Chand at $5,757.41. The customer with the highest sales, Sean Miller, did not appear among the top 10 customers by profit, indicating that high customer sales do not necessarily translate into the highest profitability. --

SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM `nexafrica`.`default`.`superstore`
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;

-- Finding 11 — Loss-Making Products: The analysis identified numerous products with negative total profit. The Cubify CubeX 3D Printer Double Head Print recorded the largest loss at -$8,879.97, despite generating $11,099.96 in sales. Several other products also generated substantial sales while recording losses, including the Cisco TelePresence System EX90, which generated $22,638.48 in sales but recorded -$1,811.08 in profit. This indicates that some high-sales products may require further investigation into pricing, discounts, or costs.

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM `nexafrica`.`default`.`superstore`
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- Finding 12 — Monthly Sales & Profit Trend

-- The data shows noticeable fluctuations in monthly sales and profitability across the four-year period. Sales were generally higher toward the end of each year, with November and December frequently recording strong sales. The highest monthly sales were recorded in December 2016 at $96,999.04, followed by November 2017 at $118,447.83, which is actually the overall highest monthly sales value in the dataset.

-- Profitability also varied considerably. December 2016 generated the highest monthly profit of $17,885.31, while some months recorded negative profit, such as July 2014 (-$841.48) and January 2015 (-$3,281.01).

-- Business insight: Sales and profit fluctuate significantly by month, suggesting that the business experiences periods of stronger and weaker performance throughout the year. The consistently strong sales toward the latter part of several years may indicate a seasonal sales pattern that could be investigated further.

SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM `nexafrica`.`default`.`superstore`
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM `nexafrica`.`default`.`superstore`
GROUP BY customer_id, customer_name
ORDER BY total_profit DESC
LIMIT 10;

SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(sales) / COUNT(DISTINCT order_id) AS average_order_value
FROM `nexafrica`.`default`.`superstore`
GROUP BY customer_id, customer_name
ORDER BY average_order_value DESC
LIMIT 10;

WITH customer_sales AS (
    SELECT
        customer_id,
        customer_name,
        SUM(sales) AS total_sales
    FROM `nexafrica`.`default`.`superstore`
    GROUP BY customer_id, customer_name
)

SELECT
    CASE
        WHEN total_sales >= 10000 THEN 'High Value'
        WHEN total_sales >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment,
    COUNT(*) AS customer_count,
    SUM(total_sales) AS segment_sales
FROM customer_sales
GROUP BY
    CASE
        WHEN total_sales >= 10000 THEN 'High Value'
        WHEN total_sales >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END
ORDER BY segment_sales DESC;

WITH customer_sales_profit AS (
    SELECT
        customer_id,
        customer_name,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM `nexafrica`.`default`.`superstore`
    GROUP BY customer_id, customer_name
)

SELECT
    CASE
        WHEN total_sales >= 10000 THEN 'High Value'
        WHEN total_sales >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment,
    COUNT(*) AS customer_count,
    SUM(total_sales) AS segment_sales,
    SUM(total_profit) AS segment_profit
FROM customer_sales_profit
GROUP BY
    CASE
        WHEN total_sales >= 10000 THEN 'High Value'
        WHEN total_sales >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END
ORDER BY segment_profit DESC;

WITH customer_sales_profit AS (
    SELECT
        customer_id,
        customer_name,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM `nexafrica`.`default`.`superstore`
    GROUP BY customer_id, customer_name
),

customer_segments AS (
    SELECT
        customer_id,
        total_sales,
        total_profit,
        CASE
            WHEN total_sales >= 10000 THEN 'High Value'
            WHEN total_sales >= 5000 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS customer_segment
    FROM customer_sales_profit
)

SELECT
    customer_segment,
    COUNT(*) AS customer_count,
    SUM(total_profit) AS segment_profit,
    SUM(total_profit) / COUNT(*) AS average_profit_per_customer
FROM customer_segments
GROUP BY customer_segment
ORDER BY average_profit_per_customer DESC;

SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(sales)) * 100 AS profit_margin
FROM `nexafrica`.`default`.`superstore`
GROUP BY customer_id, customer_name
HAVING SUM(sales) > 0
ORDER BY profit_margin DESC
LIMIT 10;

SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(sales)) * 100 AS profit_margin
FROM `nexafrica`.`default`.`superstore`
GROUP BY customer_id, customer_name
HAVING SUM(profit) < 0
ORDER BY total_sales DESC;

SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(sales)) * 100 AS profit_margin
FROM `nexafrica`.`default`.`superstore`
GROUP BY product_name
HAVING SUM(sales) > 0
ORDER BY total_profit DESC
LIMIT 10;

WITH first_purchase AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_purchase_date
    FROM `nexafrica`.`default`.`superstore`
    GROUP BY customer_id
)

