import pyodbc

conn_str = (
    "Driver={ODBC Driver 17 for SQL Server};"
    "Server=localhost;"      
    "Database=Week2;"
    "Trusted_Connection=yes;"
)

try:
    # Connect to SQL Server
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()

    # SQL INSERT query
    insert_query = """
    INSERT INTO facebook.Comments (PostID, UserID, Content, ParentID)
    VALUES (2000, 1002, 'Replying to root comment', 3000);
    """

    cursor.execute(insert_query)
    conn.commit()

    print("Query run successfully")

except Exception as e:
    print("Error:", e)

finally:
    if conn:
        conn.close()
