SELECT * FROM task JOIN status on task.status_id=status.id

SELECT * FROM status

--Find out how many tasks are in the task table
SELECT COUNT(*) AS task_counter FROM task

--Find out how many tasks in the task table do not have a valid due date
SELECT COUNT(*) AS null_dates FROM task WHERE due_date is NULL

-- Find all the tasks that are marked as done
SELECT task.title AS done_tasks FROM task JOIN status ON task.status_id = status.id WHERE status.name ='done';

--Find all the tasks that are not marked as done
SELECT task.title as undone_tasks FROM task JOIN status ON task.status_id = status.id WHERE status.name != 'done'

--Get all the tasks, sorted with the most recently created first
SELECT * from task ORDER BY created DESC

--Get the single most recently created task
SELECT * FROM task ORDER BY created DESC LIMIT 1;

--Get the title and due date of all tasks where the title or description contains database
SELECT title, due_date FROM task WHERE title LIKE '%database%' OR description LIKE '%database%'


--Get the title and status (as text) of all tasks
SELECT title, status.name from task JOIN status ON task.status_id = status.id

--Get the name of each status, along with a count of how many tasks have that status
SELECT status.name, COUNT(*) as task_counter from task JOIN status ON task.status_id = status.id GROUP BY status.name;

--Get the names of all statuses, sorted by the status with most tasks first
SELECT status.name, COUNT(*) as task_counter from task JOIN status ON task.status_id = status.id GROUP BY status.name ORDER BY task_counter DESC;
