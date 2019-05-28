PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows;

DROP TABLE IF EXISTS replies;

DROP TABLE IF EXISTS question_likes;

DROP TABLE IF EXISTS questions;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255)
);

CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT,
  ass_author INTEGER NOT NULL,
  FOREIGN KEY (ass_author) REFERENCES users(id)
);

CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT,
  subject VARCHAR(255) NOT NULL,
  
  FOREIGN KEY(question_id) REFERENCES questions(id)
  FOREIGN KEY(parent_reply_id) REFERENCES replies(id)
  FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users(fname, lname)
VALUES
  ('Rushil','Vig'),
  ('Kenny', 'Choi'),
  ('Eugene','IDK'),
  ('incognito', 'hackerone');
 
 INSERT INTO
  questions(title, body,ass_author)
VALUES
  ('How do you create databases','My partner and I are really struggline pls help',1),
  ('Can I has cheeseburger', 'PPLLEEASSEEEE',(SELECT id FROM users WHERE fname = 'Kenny')),
  ('Can you come here and right code for me','IDK',1);


 INSERT INTO
  question_follows(user_id,question_id)
VALUES
  (1,2),
  (1, 1),
  (2,3),
  (3, 1);


INSERT INTO
  replies(question_id, parent_reply_id,user_id,body,subject)
VALUES
  (1, NULL, 2, 'Magic', 'Think harder!'),
  (2, NULL, 1,'No you just ate', 'No.'),
  (3,NULL, 2,'No they don''t pay me enough to do that','no' ),
  (2, 2, 3, 'I just wanted to say something', 'I''m leaving');


INSERT INTO
  question_likes(user_id, question_id)
VALUES
  (1,3),
  (1,2),
  (2,1),
  (1,1),
  (3,2),
  (2,3),
  (3,1);


