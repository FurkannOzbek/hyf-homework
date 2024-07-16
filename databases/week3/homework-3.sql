-- Active: 1719747438964@@127.0.0.1@3306@mealShare

DROP TABLE meal, reservation, review

CREATE TABLE meal (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    `when` DATETIME NOT NULL,
    max_reservation INT NOT NULL,
    price DECIMAL NOT NULL,
    created_date DATE NOT NULL
);

CREATE TABLE reservation(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    number_of_guests INT NOT NULL,
    meal_id INT NOT NULL,
    created_date DATE NOT NULL,
    contact_phonenumber CHAR(10),
    contact_name VARCHAR(255),
    contact_email VARCHAR(255),
    FOREIGN KEY(meal_id) REFERENCES meal(id)
);

CREATE TABLE review(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    meal_id INT NOT NULL,
    stars INT NOT NULL,
    created_date DATE NOT NULL,
    FOREIGN KEY(meal_id) REFERENCES meal(id)
);
--Get all meals

Select * from meal

--Add a new meal
INSERT INTO meal(title,description,location,`when`,max_reservation,price,created_date)
VALUES 
("Penne Arabiata","Penne with chili sauce","Italy","2024-06-12",5, 24.00,"2024-06-09"),
("Kebab","Kebab with french fries","Turkey","2024-07-19",3, 12.00,"2024-06-09"),
("Eggplant Dish","Eggplant stuff filled","Bosnia","2024-06-19",3, 8.00,"2024-04-09"),
("Pizza","Pizza with french fries","USA","2024-04-19",3, 7.00,"2024-03-09")

INSERT INTO meal(title,description,location,`when`,max_reservation,price,created_date)
VALUES 
("Strange dish","Who knows what is it","Unknown","2024-04-12",10,100,"2024-03-12")

--Get a meal with any id, fx 1
SELECT * from meal WHERE id = 1

--Update a meal with any id, fx 1. Update any attribute fx the title or multiple attributes
UPDATE meal 
SET max_reservation = 6
WHERE id = 1

--Delete a meal with any id, fx 1
DELETE FROM meal where id = 1
--I got an foreign key error while tried to delete because I created other table before and connected them with a foreign KEY


--Get all reservations
SELECT * from reservation

--Add a new reservation
INSERT INTO reservation(number_of_guests,meal_id,created_date,contact_phonenumber,contact_name,contact_email) VALUES 
(5,1,"2024-05-12",41414141,"James","jamesat@xmail.com"),
(3,2,"2024-06-10",51515151,"Nicol","nicolwest@xmail.com"),
(7,3,"2024-07-10",61515151,"Nicol","nicolwest@xmail.com"),
(2,4,"2024-09-10",71515151,"Nicol","nicolwest@xmail.com")

INSERT INTO reservation(number_of_guests,meal_id,created_date,contact_phonenumber,contact_name,contact_email) VALUES 
(3,1,"2024-12-12",41414141,"Mikkel","mikkel@xmail.com")

--Get a reservation with any id, fx 1
SELECT * from reservation where id=1

--Update a reservation with any id, fx 1. Update any attribute fx the title or multiple attributes
UPDATE reservation
SET contact_name = "Jame"
where id = 1

--Delete a reservation with any id, fx 1
DELETE FROM reservation where id = 2

--Get all reviews
select * from review

--Add a new review
INSERT INTO review(title,description,meal_id,stars,created_date) VALUES 
("Perfect","Amazing food experience",1,5,"2024-10-10"),
("Avarage","Food was delicious but the chef was a bit rude",2,3,"2024-08-10"),
("Amazing","Very good food but could be more hygenic",3,4,"2024-12-10"),
("Better than nothing","Taste was okay compared to price",4,3,"2024-11-10")

--Get a review with any id, fx 1
SELECT * from review where id =1

--Update a review with any id, fx 1. Update any attribute fx the title or multiple attributes
UPDATE review 
SET title = "Super"
where id = 1

--Delete a review with any id, fx 1
DELETE FROM review where id = 2


--Get meals that has a price smaller than a specific price fx 9
SELECT * from meal WHERE price < 9

--Get meals that still has available reservations
SELECT * from meal LEFT JOIN reservation on reservation.meal_id = meal.id
WHERE reservation.id IS NULL

--Get meals that partially match a title.Egg plant will point out eggplant dish

SELECT * from meal WHERE title LIKE "Eggplant%"

--Get meals that has been created between two dates
select * from meal where created_date BETWEEN "2024-04-09" AND "2024-05-09"

--Get only specific number of meals fx return only 3 meals
select * from meal
LIMIT 3

--Get the meals that have good reviews
select * from meal JOIN review ON meal.id = review.meal_id
WHERE review.stars > 3


select * from reservation


--Get reservations for a specific meal sorted by created_date
select * from reservation JOIN meal on reservation.meal_id = meal.id
where meal.id = 1
ORDER BY reservation.created_date

--Sort all meals by average number of stars in the reviews
SELECT meal.id, meal.title, meal.description, meal.location, meal.`when`, meal.max_reservation, meal.price, meal.created_date, AVG(review.stars) AS average_stars
FROM meal
LEFT JOIN review ON meal.id = review.meal_id
GROUP BY meal.id, meal.title, meal.description, meal.location, meal.`when`, meal.max_reservation, meal.price, meal.created_date
ORDER BY average_stars DESC;
