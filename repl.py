# repl.py

from my_db.database import Database

def print_welcome():
    """Print welcome banner"""
    print("=" * 60)
    print("  📦 INVENTORY MANAGEMENT SYSTEM - DATABASE REPL")
    print("=" * 60)
    print("  SQL-based Relational Database Management System")
    print("  Type 'help' for available commands")
    print("  Type 'exit' or 'quit' to leave")
    print("=" * 60)
    print()


def print_help():
    """Print available SQL commands"""
    help_text = """
Available SQL Commands:
-----------------------

TABLE OPERATIONS:
  CREATE TABLE tablename (col1 TYPE, col2 TYPE, ...);
    - Supported types: INT, VARCHAR, FLOAT
    - Example: CREATE TABLE products (id INT PRIMARY KEY, name VARCHAR, price FLOAT);

  SHOW TABLES;
    - List all tables in the database

  DESCRIBE tablename;
    - Show table structure

CRUD OPERATIONS:
  INSERT INTO tablename VALUES (val1, val2, ...);
    - Example: INSERT INTO products VALUES (1, 'Laptop', 999.99);

  SELECT * FROM tablename;
    - Example: SELECT * FROM products;

  SELECT col1, col2 FROM tablename;
    - Example: SELECT name, price FROM products;

  SELECT * FROM tablename WHERE column = value;
    - Example: SELECT * FROM products WHERE id = 1;

  UPDATE tablename SET column = value WHERE column = value;
    - Example: UPDATE products SET price = 899.99 WHERE id = 1;

  DELETE FROM tablename WHERE column = value;
    - Example: DELETE FROM products WHERE id = 1;

INDEXING:
  CREATE INDEX indexname ON tablename(column);
    - Example: CREATE INDEX idx_email ON suppliers(email);

JOINS (Advanced):
  SELECT * FROM table1 JOIN table2 ON table1.col = table2.col;
    - Example: SELECT * FROM products JOIN suppliers ON products.supplier_id = suppliers.id;

OTHER COMMANDS:
  SHOW TABLES - List all tables in the database
  
  help       - Show this help message
  exit/quit  - Exit the REPL
  clear      - Clear screen

Sample Workflow:
----------------
  1. CREATE TABLE suppliers (id INT PRIMARY KEY, name VARCHAR, email VARCHAR);
  2. INSERT INTO suppliers VALUES (1, 'TechSupply', 'tech@example.com');
  3. SELECT * FROM suppliers;
  4. SELECT * FROM suppliers WHERE id = 1;

For full sample data, see: examples/sample_data.sql
"""
    print(help_text)


def main():
    print_welcome()
    
    db = Database()
    
    while True:
        try:
            # Read command
            command = input("IMS> ").strip()
            
            # Skip empty commands
            if not command:
                continue
            
            # Handle special commands
            if command.lower() in ("exit", "quit", "exit()", "quit()"):
                print("\n👋 Goodbye! Thanks for using IMS Database!")
                break
            
            if command.lower() == "help":
                print_help()
                continue
            
            if command.lower() == "clear":
                import os
                os.system('clear' if os.name != 'nt' else 'cls')
                continue
            
            # Execute SQL command
            result = db.execute(command)
            
            if result:
                print(result)
                print()  # Empty line for readability
        
        except KeyboardInterrupt:
            print("\n\n👋 Interrupted. Goodbye!")
            break
        
        except Exception as e:
            print(f"❌ Error: {e}")
            print()


if __name__ == "__main__":
    main()