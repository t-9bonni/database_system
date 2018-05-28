USE www;
SELECT 
    destination_name,
    trip_type_name,
    t.trip_number,
    trip_date,
	CONCAT(e.first_name, ' ', e.last_name) AS guide_name,
    CONCAT(g.first_name, ' ', g.last_name) AS guest_name,
    experience_name,
    age,
    weight,
    isSwimmer,
    g.mobile_phone AS guest_mobile_phone
FROM
    destination
        JOIN
    trip t ON destination.destination_code = t.destination_code
        JOIN
    reservation ON t.trip_number = reservation.trip_number
        JOIN
    guest g ON reservation.guest_id = g.guest_id
        JOIN
    experience ON g.experience_code = experience.experience_code
        JOIN
    trip_type ON t.trip_type_code = trip_type.trip_type_code
        JOIN
    employee e ON t.guide_employee_id = e.employee_id
ORDER BY destination_name , trip_type_name , trip_date , guest_name
