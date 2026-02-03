CREATE INDEX idx_orders_search_status_orderdate
ON orders(`order_id`, `order_date`);
