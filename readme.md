This repository contains SQL scripts and schema design for building a simplified Facebook-like system using **Microsoft SQL Server**.

---

## Folder Structure
```
facebook-sql-db/
├── table_creation.sql      -- Contains all CREATE TABLE statements
├── insert_data.sql      -- Contains sample data for testing
└── README.md       -- Project overview and instructions
```

---

## Database & Schema
- **Database**: `Week2`
- **Schema**: `facebook`

### Tables Created
| Table Name          | Purpose                                   |
|---------------------|--------------------------------------------|
| Users               | Store user profile data                   |
| Friendships         | Manage friend relationships               |
| Posts               | User-generated posts with tags            |
| Comments            | Comments on posts                         |
| Likes               | Likes on posts or comments                |
| Groups              | User-created groups                       |
| GroupMembers        | Membership data for groups                |
| Messages            | Personal messages between users           |

---

## Sample Data
The `Insert.sql` file populates the tables with:
- 5 users
- Posts with tags and media
- Comments, likes, friendships, groups
- Personal messages between some users

---

## Technologies Used
- Microsoft SQL Server (T-SQL syntax)
- Git for version control

## Author
Pranav K N
