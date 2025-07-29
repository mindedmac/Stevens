import psycopg2

# DB connection settings
conn = psycopg2.connect(
    dbname="librarydb",
    user="your_username",
    password="your_password",
    host="localhost",
    port="5432"
)
cur = conn.cursor()

# Read and execute SQL file
with open("schema.sql", "r", encoding="utf-8") as file:
    sql = file.read()

# Split and execute each statement
for statement in sql.strip().split(';'):
    if statement.strip():
        cur.execute(statement + ';')

# Finalize
conn.commit()
cur.close()
conn.close()

print("Database setup and population completed successfully.")
