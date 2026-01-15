-- ===========================================
-- INVENTORY MANAGEMENT SYSTEM - FULL SAMPLE
-- ===========================================

-- ===========================================
-- STEP 1: CREATE TABLES
-- ===========================================

CREATE TABLE suppliers (id INT PRIMARY KEY, name VARCHAR,contact_person VARCHAR,email VARCHAR UNIQUE);

CREATE TABLE products (id INT PRIMARY KEY,cname VARCHAR, description VARCHAR, price FLOAT, supplier_id INT FOREIGN KEY REFERENCES suppliers(id));


CREATE TABLE inventory (id INT PRIMARY KEY, product_id INT FOREIGN KEY REFERENCES products(id), quantity INT, warehouse_location VARCHAR, last_updated VARCHAR);

-- ===========================================
-- STEP 2: INSERT SUPPLIERS
-- ===========================================

INSERT INTO suppliers VALUES(1, 'TechSupply Inc', 'John Doe', 'john@techsupply.com');

INSERT INTO suppliers VALUES(2, 'Global Electronics', 'Jane Smith', 'jane@globalelec.com');

INSERT INTO suppliers VALUES(3, 'Office Essentials Ltd', 'Bob Johnson', 'bob@officeess.com');

-- ===========================================
-- STEP 3: INSERT PRODUCTS
-- ===========================================

INSERT INTO products VALUES(1, 'Laptop Dell XPS', 'High-performance laptop', 1200.50, 1);

INSERT INTO products VALUES(2, 'Mouse Logitech', 'Wireless mouse', 25.99, 1);

INSERT INTO products VALUES(3, 'Monitor Samsung', '27-inch 4K monitor', 350.00, 2);

INSERT INTO products VALUES(4, 'Keyboard Mechanical', 'RGB gaming keyboard', 89.99, 2);

INSERT INTO products VALUES(5, 'Office Chair', 'Ergonomic office chair', 199.99, 3);

INSERT INTO products VALUES(6, 'Desk Lamp LED', 'Adjustable LED lamp', 45.00, 3);

-- ===========================================
-- STEP 4: INSERT INVENTORY RECORDS
-- ===========================================

INSERT INTO inventory VALUES(1, 1, 15, 'Warehouse A', '2026-01-12');

INSERT INTO inventory VALUES(2, 2, 50, 'Warehouse A', '2026-01-12');

INSERT INTO inventory VALUES(3, 3, 8, 'Warehouse B', '2026-01-11');

INSERT INTO inventory VALUES(4, 4, 30, 'Warehouse A', '2026-01-10');

INSERT INTO inventory VALUES(5, 5, 5, 'Warehouse C', '2026-01-09');

INSERT INTO inventory VALUES(6, 6, 20, 'Warehouse B', '2026-01-12');

-- ===========================================
-- STEP 5: SHOW & DESCRIBE TABLES
-- ===========================================

SHOW TABLES;

DESCRIBE suppliers;
DESCRIBE products;
DESCRIBE inventory;

-- ===========================================
-- STEP 6: CREATE INDEXES (FREQUENTLY ACCESSED)
-- ===========================================

-- Primary lookup & joins
CREATE INDEX idx_suppliers_id ON suppliers(id);
CREATE INDEX idx_products_supplier_id ON products(supplier_id);
CREATE INDEX idx_inventory_product_id ON inventory(product_id);

-- Frequent WHERE filtering
CREATE INDEX idx_inventory_quantity ON inventory(quantity);
CREATE INDEX idx_products_price ON products(price);

-- ===========================================
-- CRUD EXAMPLES
-- ===========================================

-- ----- INSERT -----
INSERT INTO suppliers VALUES (4, 'New Supplier Ltd', 'Alice Green', 'alice@newsupplier.com');
INSERT INTO products VALUES (7, 'Webcam HD', '1080p webcam', 79.99, 4);
INSERT INTO inventory VALUES (7, 7, 25, 'Warehouse D', '2026-01-14');

-- ----- UPDATE -----
UPDATE suppliers SET email = 'john.doe@techsupply.com' WHERE id = 1;
UPDATE products SET price = 1300.00 WHERE id = 1;
UPDATE inventory SET quantity = 10 WHERE product_id = 3;

-- ----- DELETE -----
DELETE FROM inventory WHERE id = 6;
DELETE FROM products WHERE id = 6;
DELETE FROM suppliers WHERE id = 3;

-- ===========================================
-- TEST QUERIES
-- ===========================================

-- 1. List all suppliers
SELECT * FROM suppliers;

-- 2. List all products
SELECT * FROM products;

-- 3. Inventory with low stock
SELECT * FROM inventory WHERE quantity < 10;

-- 4. Find specific product
SELECT * FROM products WHERE id = 1;

-- 5. Products from a specific supplier
SELECT * FROM products WHERE supplier_id = 1;

-- 6. Inventory for specific product
SELECT * FROM inventory WHERE product_id = 3;

-- ===========================================
-- ADVANCED QUERIES (JOINS)
-- ===========================================

-- Products with supplier info
SELECT products.name, products.price, suppliers.name FROM products JOIN suppliers ON products.supplier_id = suppliers.id;

-- Inventory with product names
SELECT inventory.quantity, inventory.warehouse_location, products.name FROM inventory JOIN products ON inventory.product_id = products.id;

-- Inventory + Products + Suppliers
SELECT inventory.quantity, products.name, suppliers.name FROM inventory JOIN products ON inventory.product_id = products.id  JOIN suppliers ON products.supplier_id = suppliers.id;
