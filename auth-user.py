import pyodbc
import hashlib

def hash_password(password):
    return hashlib.sha256(password.encode()).hexdigest()

def authenticate_user(email, password):
    # Hash the password entered by the user
    hashed_input_pw = hash_password(password)

    # SQL Server connection
    conn_str = (
        "Driver={ODBC Driver 17 for SQL Server};"
        "Server=localhost;"  # Change to your instance name
        "Database=Week2;"
        "Trusted_Connection=yes;"
    )

    try:
        conn = pyodbc.connect(conn_str)
        cursor = conn.cursor()

        # Fetch the stored hash for the user
        query = f"""
        SELECT UserID, FullName, PasswordHash
        FROM facebook.Users
        WHERE Email = '{email}' AND IsActive = 1;
        """

        cursor.execute(query)
        user = cursor.fetchone()

        if user:
            stored_hash = user.PasswordHash

            if stored_hash == hashed_input_pw:
                print(f"{user.FullName} logged in.")
            else:
                print("Login failed: Incorrect password.")
        else:
            print("Login failed: User not found.")

    except Exception as e:
        print("Error:", e)

    finally:
        if conn:
            conn.close()

# 🧪 Example interaction
if __name__ == "__main__":
    email = input("Enter Email: ")
    password = input("Enter Password: ")
    authenticate_user(email, password)
