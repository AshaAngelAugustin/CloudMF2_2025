-- File 8: Analytics and Reporting
CREATE PROCEDURE generate_sales_report(
    @start_date DATETIME,
    @end_date DATETIME
) AS
BEGIN
    SELECT 
        MONTH(order_date) as month,
        COUNT(*) as total_orders,
        SUM(total_amount) as total_revenue,
        AVG(total_amount) as avg_order_value
    FROM orders
    WHERE order_date BETWEEN @start_date AND @end_date
    GROUP BY MONTH(order_date)
    ORDER BY month;
END
