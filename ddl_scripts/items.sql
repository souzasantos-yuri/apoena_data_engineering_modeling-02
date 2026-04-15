DROP TABLE IF EXISTS oltp.items CASCADE;

CREATE TABLE oltp.items (
    item_id        SERIAL PRIMARY KEY,
    transaction_id      INT REFERENCES oltp.transactions(transaction_id),
    product_id     INT REFERENCES oltp.products(product_id),
    quantity     INT NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    total_revenue       NUMERIC(10,2) GENERATED ALWAYS AS (quantity * price) STORED
);