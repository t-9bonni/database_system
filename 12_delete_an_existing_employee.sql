USE www;

DELETE FROM can_guide
WHERE employee_id = (SELECT employee_id FROM employee WHERE nickname = 'Summer');

DELETE FROM plays_role
WHERE employee_id = (SELECT employee_id FROM employee WHERE nickname = 'Summer');

DELETE FROM employee
WHERE employee_id = 6;
