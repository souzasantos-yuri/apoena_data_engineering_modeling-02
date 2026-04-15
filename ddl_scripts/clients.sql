DROP TABLE IF EXISTS oltp.clients CASCADE;

CREATE TABLE oltp.clients (
    client_id    SERIAL PRIMARY KEY,
    name          VARCHAR(200) NOT NULL,
    email         VARCHAR(200),
    phone      VARCHAR(20),
    city        VARCHAR(100),
    state        CHAR(2),
    sign_up_date DATE DEFAULT CURRENT_DATE,
    is_active         BOOLEAN DEFAULT TRUE
);

INSERT INTO oltp.clients (name, email, phone, city, state, sign_up_date, is_active) VALUES
    ('  Ana Silva    ',        'ANA.SILVA@EMAIL.COM',   '11 99999-0001', 'são paulo',    'SP', '2023-01-15', TRUE),
    ('Carlos Mendes',          'carlos@gmail.com',       '21 98888-0002', 'Rio de Janeiro','RJ', '2023-02-20', TRUE),
    ('FERNANDA COSTA',         'FERNANDA@HOTMAIL.COM',   '31 97777-0003', 'belo horizonte','MG', '2023-03-10', TRUE),
    ('Roberto Lima',           'roberto.lima@email.com', '41 96666-0004', 'Curitiba',      'PR', '2023-04-05', TRUE),
    ('Juliana Pereira',        'ju.pereira@gmail.com',   '51 95555-0005', 'porto alegre',  'RS', '2023-05-22', TRUE),
    ('Marcos Oliveira',        'marcos@email.com',       '85 94444-0006', 'Fortaleza',     'CE', '2023-06-18', FALSE);