This repository contains SQL scripts, sample data, and authentication code for building a simplified Facebook-like system using **Microsoft SQL Server**.

---

## Folder Structure
```
facebook-sql-db/
├── table_creation.sql      -- Contains all CREATE TABLE statements
├── insert_data.sql         -- Contains sample data for testing
├── auth_user.py            -- Authenticates user based on email and password
├── insert_user.py          -- Inserts a new user with hashed password
└── README.md               -- Project overview and instructions
```

---

## 🗄️ Database & Schema
- **Database**: `Week2`
- **Schema**: `facebook`

###  Tables Created
| Table Name      | Purpose                                    |
|-----------------|---------------------------------------------|
| Users           | Store user profile data                    |
| Friendships     | Manage friend relationships                |
| Posts           | User-generated posts with tags             |
| Comments        | Comments on posts (supports nesting)       |
| Likes           | Likes on posts or comments                 |
| Groups          | User-created groups                        |
| GroupMembers    | Membership data for groups                 |
| Messages        | Personal messages between users            |

---

## Sample Data
The `insert_data.sql` file populates the database with:
- 5 users
- Posts with tags.
- Friendships and nested comments
- Likes, personal messages, and group memberships

---

## Auth Simulation
- `insert_user.py` securely hashes passwords before inserting users
- `auth_user.py` authenticates users by matching input with stored hash

---

## Technologies Used
- Microsoft SQL Server (T-SQL)
- Git and GitHub
- Python (with `pyodbc` and `hashlib`)

---

## 👨‍💻 Author
**Pranav K N**  
