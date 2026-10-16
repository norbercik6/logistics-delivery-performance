-- Project 1: Logistics & Delivery Performance
-- Synthetic data table: Orders
SELECT
    Carrier,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN Delivery_Status = 'Late' THEN 1 ELSE 0 END) AS late_orders,
    1.0 * SUM(CASE WHEN Delivery_Status = 'On Time' THEN 1 ELSE 0 END) / COUNT(*) AS on_time_rate,
    AVG(Delay_Days * 1.0) AS avg_delay_days,
    AVG(Transport_Cost_PLN) AS avg_transport_cost_pln
FROM Orders
GROUP BY Carrier
ORDER BY on_time_rate ASC;

-- Identify high-cost late deliveries
SELECT Order_ID, Carrier, Region, Distance_km, Transport_Cost_PLN, Delay_Days
FROM Orders
WHERE Delivery_Status = 'Late'
ORDER BY Transport_Cost_PLN DESC, Delay_Days DESC;
