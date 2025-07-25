
import psycopg2

conn = psycopg2.connect(
    dbname="LibraryDb",
    user="postgres",
    password="4532",
    host="localhost",
    port="5432"
)

cur = conn.cursor()

cur.execute("SELECT * FROM Authors;")
rows = cur.fetchall()

print("\n--- All Authors ---")
for row in rows:
    print(row)

cur.close()
conn.close()
