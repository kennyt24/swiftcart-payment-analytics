
-- Schema
CREATE TABLE transactions (
    id TEXT PRIMARY KEY,
    amount INTEGER,
    currency TEXT,
    status TEXT,
    description TEXT,
    created INTEGER
);

CREATE TABLE refunds (
    id TEXT PRIMARY KEY,
    charge_id TEXT,
    amount INTEGER,
    status TEXT,
    reason TEXT,
    created INTEGER
);

-- Query 1: Transaction success rate
SELECT 
    status,
    COUNT(*) as count,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 1) as percentage
FROM transactions
GROUP BY status;

-- Query 2: Revenue by currency
SELECT 
    currency,
    SUM(amount) / 100.0 as total_revenue,
    COUNT(*) as transaction_count
FROM transactions
WHERE status = 'succeeded'
GROUP BY currency
ORDER BY total_revenue DESC;

-- Query 3: Refund analysis
SELECT 
    t.id,
    t.description,
    t.amount / 100.0 as charged,
    t.status,
    COALESCE(r.amount / 100.0, 0) as refunded,
    CASE WHEN r.id IS NOT NULL THEN 'Yes' ELSE 'No' END as was_refunded
FROM transactions t
LEFT JOIN refunds r ON t.id = r.charge_id
ORDER BY t.created DESC;
