-- Active: 1719747438964@@127.0.0.1@3306@social_media_website
CREATE DATABASE social_media_website

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY ,
    name VARCHAR(255) NOT NULL,
    email varchar(255) NOT NULL UNIQUE,
    password varchar(255) NOT NULL,
    registration DATETIME NOT NULL
);

CREATE TABLE post(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content VARCHAR(255) NOT NULL,
    creation DATETIME NOT NULL,
    `update` DATETIME NOT NULL,
    author_id INT NOT NULL,
    FOREIGN KEY(author_id) REFERENCES user(id)
);

CREATE TABLE comment(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    content VARCHAR(255) NOT NULL,
    creation_comment DATETIME NOT NULL,
    update_comment DATETIME NOT NULL,
    author_id INT NOT NULL,
    post_id INT NOT NULL,
    parent_id INT NOT NULL,
    FOREIGN KEY(author_id) REFERENCES user(id),
    FOREIGN KEY(post_id) REFERENCES post(id),
    FOREIGN KEY(parent_id) REFERENCES comment(id)
);

ALTER TABLE comment
MODIFY COLUMN parent_id INT

CREATE TABLE reaction(
    reaction_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    reaction_type ENUM("like","highfive","laugh","cry") NOT NULL,
    author_id INT NOT NULL,
    post_id INT NOT NULL,
    comment_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES user(id),
    FOREIGN KEY (post_id) REFERENCES post(id),
    FOREIGN KEY (comment_id) REFERENCES comment(id),
    CONSTRAINT unique_reaction_per_user UNIQUE (author_id, post_id, comment_id, reaction_type)
);

CREATE TABLE friendships(
    user1_id INT NOT NULL,
    user2_id INT NOT NULL,
    friendship_date DATETIME,
    PRIMARY KEY (user1_id,user2_id),
    FOREIGN KEY (user1_id) REFERENCES user(id),
    FOREIGN KEY (user2_id) REFERENCES user(id)
);


-- Sample data
INSERT INTO user (name, email, password,registration) VALUES
('John', 'john@xmail.com', 'password123',now()),
('Patricia', 'patricia@xmail.com', 'password456',now());

-- Sample data
INSERT INTO post (author_id, title, content,creation,`update`) VALUES
(1, 'Summer', 'This summer going to be great!',now(),now()),
(2, 'Winter', 'THis winter going to be cold one!',now(),now());

-- Sample data 
INSERT INTO comment (post_id, author_id,parent_id,content,creation_comment,update_comment) VALUES
(2, 1,null,'Gonna buy some thick clothes',now(),now());

INSERT INTO comment (post_id, author_id,parent_id,content,creation_comment,update_comment) VALUES
(2, 1,7, 'You should do that',now(),now());

-- Sample data 
INSERT INTO reaction (author_id, post_id,comment_id,reaction_type) VALUES
(1, 2,7, 'like'),
(2, 1,7,'highfive');

--Ssample data 
INSERT INTO friendships (user1_id, user2_id) VALUES
(1, 2);

SELECT * from friendships
