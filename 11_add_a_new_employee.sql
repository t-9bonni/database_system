USE www;
INSERT INTO employee
VALUES (DEFAULT, 
		'Patrick L.', 
		'Patterson', 
        'Pat', 
        '847-555-9706', 
        NULL, 
        'All Saturdays and Sundays in June, July, and August');

INSERT INTO plays_role
VALUES ((SELECT employee_id 
			FROM employee 
				WHERE first_name = 'Patrick L.' AND last_name = 'Patterson'), (SELECT role_code FROM role WHERE role_name = 'Guide'));

INSERT INTO plays_role
VALUES ((SELECT employee_id 
			FROM employee 
				WHERE first_name = 'Patrick L.' AND last_name = 'Patterson'), (SELECT role_code FROM role WHERE role_name = 'Gear'));



INSERT INTO can_guide
VALUES ((SELECT employee_id 
			FROM employee 
				WHERE first_name = 'Patrick L.' AND last_name = 'Patterson'), (SELECT trip_type_code FROM trip_type WHERE trip_type_name = 'Kayak'));

INSERT INTO can_guide
VALUES ((SELECT employee_id 
			FROM employee 
				WHERE first_name = 'Patrick L.' AND last_name = 'Patterson'), (SELECT trip_type_code FROM trip_type WHERE trip_type_name = 'Canoe'));
                
INSERT INTO can_guide
VALUES ((SELECT employee_id 
			FROM employee 
				WHERE first_name = 'Patrick L.' AND last_name = 'Patterson'), (SELECT trip_type_code FROM trip_type WHERE trip_type_name = 'Raft'));


