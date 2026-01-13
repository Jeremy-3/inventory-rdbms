from my_db.sql_parser import parse
from my_db.query import execute_query

class Database:
    def __init__(self):
        # self.parser = Parser()
        self.tables = {}

    def execute(self, command:str):
        parsed_command = parse(command)
        return execute_query(parsed_command, self)
    
    def get_table(self, table_name):
        """Get table by name (case-insensitive)"""
        # Convert to lowercase for lookup
        table_name_lower = table_name.lower()
        
        # Search for table (case-insensitive)
        for name, table in self.tables.items():
            if name.lower() == table_name_lower:
                return table
        
        return None
    
    def table_exists(self, table_name):
        """Check if table exists (case-insensitive)"""
        return self.get_table(table_name) is not None
    
    def get_table_name(self, table_name):
        """Get the actual table name (with correct case)"""
        table_name_lower = table_name.lower()
        
        for name in self.tables.keys():
            if name.lower() == table_name_lower:
                return name
        
        return None