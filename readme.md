This repository contains SQL scripts and schema design for building a simplified Facebook-like system using **Microsoft SQL Server**.

---

## 📂 Folder Structure
```
facebook-sql-db/
├── Create.sql      -- Contains all CREATE TABLE statements
├── Insert.sql      -- Contains sample data for testing
├── Queries.sql     -- (Optional) SELECT queries for user and analytics scenarios
└── README.md       -- Project overview and instructions
```

---

## 🗄️ Database & Schema
- **Database**: `Week2`
- **Schema**: `facebook`

### 📌 Tables Created
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

## 🧪 Sample Data
The `Insert.sql` file populates the tables with:
- 5 users
- 8 Posts with rich tags and media
- Comments, likes, friendships, groups
- Personal messages between some users

---

## 💻 Technologies Used
- Microsoft SQL Server (T-SQL syntax)
- Git for version control

---
## 🔗 GitHub Branches
- `main`: Final stable version for submission
- `development`: Working version with ongoing edits

---

## 🧾 Author
Pranav K N  
Built as part of Week 2 assignment submission.
