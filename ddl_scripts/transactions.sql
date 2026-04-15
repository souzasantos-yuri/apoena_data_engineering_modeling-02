DROP TABLE IF EXISTS oltp.transactions CASCADE;

CREATE TABLE oltp.transactions (
    transaction_id    SERIAL PRIMARY KEY,
    client_id   INT REFERENCES oltp.clients(client_id),
    vendor_id  INT REFERENCES oltp.vendors(vendor_id),
    transaction_date  TIMESTAMP NOT NULL,
    status       VARCHAR(20) DEFAULT 'pending',  -- pendente, enviado, entregue, cancelado
    transaction_revenue  NUMERIC(10,2)
);
