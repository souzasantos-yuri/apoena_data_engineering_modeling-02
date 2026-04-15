DROP TABLE IF EXISTS oltp.categories CASCADE;

CREATE TABLE oltp.categories (
    category_id   SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description      TEXT
);

INSERT INTO oltp.categories (category_name, description) VALUES
    ('Notebooks',      'Portable computers'),
    ('Smartphones',    'Mobile phones'),
    ('Accessories',    'Peripherals and various accessories');