import psycopg2

# DB connection settings
conn = psycopg2.connect(
    dbname="librarydb",
    user="postgres",
    password="4532",
    host="localhost",
    port="5432"
)
cur = conn.cursor()

# Read and execute SQL file
with open("db.sql", "r", encoding="utf-8") as file:
    sql = file.read()

# Clean execution per statement
for statement in sql.strip().split(';'):
    if statement.strip():
        cur.execute(statement)

# Finalize
conn.commit()
cur.close()
conn.close()

print("Database setup and population completed successfully.")
