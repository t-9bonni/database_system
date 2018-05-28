USE www;
INSERT INTO guest 
VALUES (DEFAULT, 'Lilly', 'Ludsen', 25, 120, 1, NULL, 4);

INSERT INTO reservation
VALUES (562, (SELECT guest_id FROM guest WHERE first_name = 'Lilly' AND last_name = 'Ludsen'));