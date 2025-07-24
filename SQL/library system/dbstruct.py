from __init__ import *


# change for sql notation replace valueerrors with window popups no crashes**

# dbstruct.py
# This module defines the structure of a database for a library system.
class db:
    def __init__(self, name):
        self.name = name
        self.tables = {}

    def add_table(self, name, columns):
        if name not in self.tables:
            self.tables[name] = columns
        else:
            raise ValueError(f"Table {name} already exists.")

    def get_table(self, name):
        return self.tables.get(name, None)
    
    def remove_table(self, name):
        if name in self.tables: del self.tables[name]
        else: raise ValueError(f"Table {name} does not exist.")

    def __repr__(self):
        return f"Database({self.name}, Tables: {list(self.tables.keys())})"