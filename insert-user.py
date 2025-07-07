import pyodbc
import hashlib

# 🔐 Function to hash a password using SHA-256
def hash_password(password):
    return hashlib.sha256(password.encode()).hexdigest()

# 👤 Function to insert a new user with hashed password
def insert_user(fullname, email, password, dob, profile_pic_url):
    hashed_pw = hash_password(password)

    conn_str = (
        "Driver={ODBC Driver 17 for SQL Server};"
        "Server=localhost;"
        "Database=Week2;"
        "Trusted_Connection=yes;"
    )

    try:
        conn = pyodbc.connect(conn_str)
        cursor = conn.cursor()

        query = f"""
        INSERT INTO facebook.Users (FullName, Email, PasswordHash, DOB, ProfilePicUrl, CreatedAt, LastLogin, IsActive)
        VALUES ('{fullname}', '{email}', '{hashed_pw}', '{dob}', '{profile_pic_url}', GETDATE(), GETDATE(), 1);
        """

        cursor.execute(query)
        conn.commit()
        print("User inserted.")

    except Exception as e:
        print("Error:", e)

    finally:
        if conn:
            conn.close()

insert_user(
    fullname="Gowtham",
    email="gowtham@example.com",
    password="mysecretpassword123",
    dob="1999-08-15",
    profile_pic_url="http://example.com/profiles/gowtham.jpg"
)
