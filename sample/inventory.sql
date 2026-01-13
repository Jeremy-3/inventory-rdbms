-- ===========================================
-- INVENTORY MANAGEMENT SYSTEM - SAMPLE DATA
-- ===========================================

-- Step 1: Create all tables
CREATE TABLE suppliers (id INT PRIMARY KEY, name VARCHAR, contact_person VARCHAR, email VARCHAR UNIQUE, phone VARCHAR, address VARCHAR);

CREATE TABLE products (id INT PRIMARY KEY, name VARCHAR, description VARCHAR, price FLOAT, supplier_id INT);

CREATE TABLE inventory (id INT PRIMARY KEY, product_id INT, quantity INT, warehouse_location VARCHAR, last_updated VARCHAR);

-- Step 2: Insert Suppliers
INSERT INTO suppliers VALUES (1, 'TechSupply Inc', 'John Doe', 'john@techsupply.com', '+254712345678', 'Nairobi, Kenya');

INSERT INTO suppliers VALUES (2, 'Global Electronics', 'Jane Smith', 'jane@globalelec.com', '+254722334455', 'Mombasa, Kenya');

INSERT INTO suppliers VALUES (3, 'Office Essentials Ltd', 'Bob Johnson', 'bob@officeess.com', '+254733445566', 'Kisumu, Kenya');

-- Step 3: Insert Products
INSERT INTO products VALUES (1, 'Laptop Dell XPS', 'High-performance laptop', 1200.50, 1);

INSERT INTO products VALUES (2, 'Mouse Logitech', 'Wireless mouse', 25.99, 1);

INSERT INTO products VALUES (3, 'Monitor Samsung', '27-inch 4K monitor', 350.00, 2);

INSERT INTO products VALUES (4, 'Keyboard Mechanical', 'RGB gaming keyboard', 89.99, 2);

INSERT INTO products VALUES (5, 'Office Chair', 'Ergonomic office chair', 199.99, 3);

INSERT INTO products VALUES (6, 'Desk Lamp LED', 'Adjustable LED lamp', 45.00, 3);

-- Step 4: Insert Inventory Records
INSERT INTO inventory VALUES (1, 1, 15, 'Warehouse A', '2026-01-12');

INSERT INTO inventory VALUES (2, 2, 50, 'Warehouse A', '2026-01-12');

INSERT INTO inventory VALUES (3, 3, 8, 'Warehouse B', '2026-01-11');

INSERT INTO inventory VALUES (4, 4, 30, 'Warehouse A', '2026-01-10');

INSERT INTO inventory VALUES (5, 5, 5, 'Warehouse C', '2026-01-09');

INSERT INTO inventory VALUES (6, 6, 20, 'Warehouse B', '2026-01-12');

-- ===========================================
-- TEST QUERIES
-- ===========================================

-- Query 1: List all suppliers
SELECT * FROM suppliers;

-- Query 2: List all products
SELECT * FROM products;

-- Query 3: List inventory with low stock (quantity < 10)
SELECT * FROM inventory WHERE quantity < 10;

-- Query 4: Find specific product
SELECT * FROM products WHERE id = 1;

-- Query 5: Get products from specific supplier
SELECT * FROM products WHERE supplier_id = 1;

-- Query 6: Check inventory for specific product
SELECT * FROM inventory WHERE product_id = 3;

-- ===========================================
-- ADVANCED QUERIES (For later - JOINs)
-- ===========================================

-- Join products with suppliers
SELECT products.name, products.price, suppliers.name FROM products JOIN suppliers ON products.supplier_id = suppliers.id;

-- Join inventory with products
SELECT inventory.quantity, inventory.warehouse_location, products.name FROM inventory JOIN products ON inventory.product_id = products.id;

-- Full join: inventory + products + suppliers
SELECT inventory.quantity, products.name, suppliers.name FROM inventory JOIN products ON inventory.product_id = products.id JOIN suppliers ON products.supplier_id = suppliers.id;