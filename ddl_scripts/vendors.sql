DROP TABLE IF EXISTS oltp.vendors CASCADE;

CREATE TABLE oltp.vendors (
    vendor_id   SERIAL PRIMARY KEY,
    name          VARCHAR(200) NOT NULL,
    email         VARCHAR(200),
    region        VARCHAR(50),
    hiring_date DATE
);

INSERT INTO oltp.vendors (name, email, region, hiring_date) VALUES
    ('Lucas Ferreira',   'lucas@techshop.com',    'Sudeste', '2022-01-10'),
    ('Mariana Santos',   'mariana@techshop.com',  'Sul',     '2022-03-15'),
    ('Paulo Rodrigues',  'paulo@techshop.com',    'Nordeste','2022-06-01');
