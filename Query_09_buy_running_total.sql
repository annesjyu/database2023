WITH daily_buys AS (
    SELECT
        transaction_date,
        SUM(total_amount) AS daily_buy_total
    FROM trading_transactions
    WHERE stock_id = 1
      AND transaction_type = 'BUY'
    GROUP BY transaction_date
)
SELECT
    transaction_date,
    daily_buy_total,
    SUM(daily_buy_total) OVER (
        ORDER BY transaction_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_buy_total
FROM daily_buys
ORDER BY transaction_date;
