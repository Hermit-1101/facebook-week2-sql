-- USERS
INSERT INTO Users (FullName, Email, PasswordHash, DOB, ProfilePicUrl)
VALUES 
('Aarav', 'aarav@example.com', 'hash1', '1998-05-12', 'img1.jpg'),
('Sneha', 'sneha@example.com', 'hash2', '1996-08-22', 'img2.jpg'),
('Rohan', 'rohan@example.com', 'hash3', '1999-01-15', 'img3.jpg'),
('Ananya', 'ananya@example.com', 'hash4', '1997-03-30', 'img4.jpg'),
('Vikram', 'vikram@example.com', 'hash5', '1995-12-10', 'img5.jpg');

-- FRIENDSHIPS
INSERT INTO Friendships (UserID1, UserID2, Status)
VALUES 
(1000, 1001, 'accepted'),
(1000, 1002, 'accepted'),
(1001, 1003, 'accepted'),
(1002, 1004, 'accepted');

-- POSTS
INSERT INTO Posts (UserID, Content, MediaURL, Tags)
VALUES 
(1000, 'Exploring Ladakh!', 'ladakh.jpg', 'travel,india,ladakh'),
(1001, 'Homemade Dosa recipe', 'dosa.jpg', 'food,recipe,southindian'),
(1002, 'Attending wedding in Jaipur', NULL, 'wedding,travel,jaipur'),
(1003, 'Rainy mornings in Bangalore ', NULL, 'weather,bangalore,life'),
(1000, 'My fitness transformation journey begins!', 'gym.jpg', 'fitness,health'),
(1004, 'Kedarnath memories with family', NULL, 'travel,kedarnath,family'),
(1002, 'Trying out Python for SQL!', NULL, 'tech,python,database'),
(1001, 'Learning Bharatnatyam again!', 'dance.jpg', 'dance,tradition,india');

-- COMMENTS
INSERT INTO Comments (PostID, UserID, Content)
VALUES 
(2000, 1001, 'Wow, looks amazing!'),
(2000, 1002, 'On my wishlist!'),
(2002, 1003, 'Jaipur weddings are fun!'),
(2001, 1004, 'I want the recipe!'),
(2004, 1001, 'Keep going!'),
(2005, 1000, 'Spiritual vibe!');

-- LIKES (only on posts for now)
INSERT INTO Likes (UserID, PostID)
VALUES 
(1001, 2000),
(1002, 2000),
(1003, 2001),
(1000, 2002),
(1004, 2000),
(1001, 2003),
(1002, 2003);

-- GROUPS
INSERT INTO Groups (GroupName, CreatedBy)
VALUES 
('Trekking Buddies', 1000),
('Foodies Club', 1001);

-- GROUP MEMBERS
INSERT INTO GroupMembers (GroupID, UserID)
VALUES 
(5000, 1000),
(5000, 1001),
(5000, 1002),
(5001, 1001),
(5001, 1003);

-- MESSAGES
INSERT INTO Messages (SenderID, ReceiverID, MessageText)
VALUES
(1000, 1001, 'Ready for the trek this weekend?'),
(1001, 1000, 'Absolutely! Packed and pumped 💪'),
(1002, 1000, 'Nice post on fitness bro!'),
(1003, 1001, 'Can you share that dosa recipe?'),
(1004, 1002, 'Your Kedarnath post made my day 🙏');
