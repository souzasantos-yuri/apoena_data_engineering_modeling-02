DROP TABLE IF EXISTS oltp.products CASCADE;

CREATE TABLE oltp.products (
    product_id    SERIAL PRIMARY KEY,
    product_name  VARCHAR(200) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    category_id  INT REFERENCES oltp.categories(category_id)
    available_items       INT DEFAULT 0,
    is_active         BOOLEAN DEFAULT TRUE
);

INSERT INTO oltp.products (product_name, price, category_id, available_items, is_active) VALUES
    ('Notebook Pro 15',       4500.00, 1, 30, TRUE),
    ('Notebook Air 13',       3200.00, 1, 45, TRUE),
    ('Notebook Gamer X',      7800.00, 1, 15, TRUE),
    ('Smartphone Galaxy S',   2800.00, 2, 60, TRUE),
    ('Smartphone iPhone 14',  6500.00, 2, 25, TRUE),
    ('Smartphone Moto G',      900.00, 2, 80, TRUE),
    ('Wireless Mouse',        150.00, 3, 120, TRUE),
    ('Mechanical Keyboard',    350.00, 3, 75, TRUE);