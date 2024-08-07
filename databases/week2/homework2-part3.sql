-- Active: 1719747438964@@127.0.0.1@3306@test
-- Get all the tasks assigned to users whose email ends in @spotify.com

SELECT * FROM task
JOIN user ON user.id = task.user_id
WHERE user.email LIKE "%@spotify.com"

--Get all the tasks for 'Pren Goldsworthy' with status 'Not started'
SELECT * FROM task
JOIN user on user.id = task.user_id
JOIN status on status.id = task.status_id
WHERE user.name = "Pren GOldsworthy" AND status.name = "Not started"

--Get all the tasks for 'Maryrose Meadows' that were created in september (hint: month(created)=month_number)
SELECT * FROM task
JOIN user on user.id = task.user_id
WHERE user.name = "Maryrose Meadows" AND month(created) = 9

--Find how many tasks where created in each month, e.g. how many tasks were created in october, how many tasks were created in november, etc. (hint: use group by)

SELECT COUNT(*) AS amount,month(created) AS month FROM task
GROUP BY month(created)





