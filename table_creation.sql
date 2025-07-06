CREATE DATABASE Week2;
GO

USE Week2;
GO

CREATE SCHEMA facebook;
GO

-- USERS TABLE
CREATE TABLE facebook.Users (
    UserID INT IDENTITY(1000,1) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    DOB DATE,
    ProfilePicUrl VARCHAR(255),
    CreatedAt DATETIME2 DEFAULT SYSDATETIME(),
    LastLogin DATETIME2,
    IsActive BIT DEFAULT 1
);

-- FRIENDSHIPS TABLE
CREATE TABLE facebook.Friendships (
    UserID1 INT NOT NULL,
    UserID2 INT NOT NULL,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('pending', 'accepted', 'blocked')),
    RequestedAt DATETIME2 DEFAULT SYSDATETIME(),
    PRIMARY KEY (UserID1, UserID2),
    FOREIGN KEY (UserID1) REFERENCES facebook.Users(UserID),
    FOREIGN KEY (UserID2) REFERENCES facebook.Users(UserID),
    CHECK (UserID1 <> UserID2)
);

-- POSTS TABLE
CREATE TABLE facebook.Posts (
    PostID INT IDENTITY(2000,1) PRIMARY KEY,
    UserID INT NOT NULL,
    Content NVARCHAR(MAX),
    MediaURL VARCHAR(255),
    Tags VARCHAR(255),
    CreatedAt DATETIME2 DEFAULT SYSDATETIME(),
    FOREIGN KEY (UserID) REFERENCES facebook.Users(UserID)
);

-- COMMENTS TABLE
CREATE TABLE facebook.Comments (
    CommentID INT IDENTITY(3000,1) PRIMARY KEY,
    PostID INT NOT NULL,
    UserID INT NOT NULL,
    Content NVARCHAR(MAX) NOT NULL,
    CreatedAt DATETIME2 DEFAULT SYSDATETIME(),
    FOREIGN KEY (PostID) REFERENCES facebook.Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES facebook.Users(UserID)
);

-- LIKES TABLE
CREATE TABLE facebook.Likes (
    LikeID INT IDENTITY(4000,1) PRIMARY KEY,
    UserID INT NOT NULL,
    PostID INT NULL,
    CommentID INT NULL,
    CreatedAt DATETIME2 DEFAULT SYSDATETIME(),
    FOREIGN KEY (UserID) REFERENCES facebook.Users(UserID),
    FOREIGN KEY (PostID) REFERENCES facebook.Posts(PostID),
    FOREIGN KEY (CommentID) REFERENCES facebook.Comments(CommentID),
    CHECK (
        (PostID IS NOT NULL AND CommentID IS NULL) OR
        (PostID IS NULL AND CommentID IS NOT NULL)
    )
);

-- GROUPS TABLE
CREATE TABLE facebook.Groups (
    GroupID INT IDENTITY(5000,1) PRIMARY KEY,
    GroupName VARCHAR(100) NOT NULL,
    CreatedBy INT NOT NULL,
    CreatedAt DATETIME2 DEFAULT SYSDATETIME(),
    FOREIGN KEY (CreatedBy) REFERENCES facebook.Users(UserID)
);

-- GROUP MEMBERS TABLE
CREATE TABLE facebook.GroupMembers (
    GroupID INT NOT NULL,
    UserID INT NOT NULL,
    JoinedAt DATETIME2 DEFAULT SYSDATETIME(),
    PRIMARY KEY (GroupID, UserID),
    FOREIGN KEY (GroupID) REFERENCES facebook.Groups(GroupID),
    FOREIGN KEY (UserID) REFERENCES facebook.Users(UserID)
);

-- MESSAGES TABLE
CREATE TABLE facebook.Messages (
    MessageID INT IDENTITY(6000,1) PRIMARY KEY,
    SenderID INT NOT NULL,
    ReceiverID INT NOT NULL,
    MessageText NVARCHAR(MAX) NOT NULL,
    SentAt DATETIME2 DEFAULT SYSDATETIME(),
    IsRead BIT DEFAULT 0,
    FOREIGN KEY (SenderID) REFERENCES facebook.Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES facebook.Users(UserID),
    CHECK (SenderID <> ReceiverID)
);
