use www;
SELECT 
    destination_name,
    trip_type_name,
    trip_number,
    trip_date,
    CONCAT(first_name, ' ', last_name) AS guide_name,
    mobile_phone AS guide_mobile_phone,
    '414-555-1212' AS 'Wilma\'s Wild Wisconsin Office Phone',
    latest_guest_arrival_time,
    departure_time,
    estimated_return_time,
    gathering_point_description
FROM
    destination
        JOIN
    trip ON destination.destination_code = trip.destination_code
        JOIN
    gathering_point ON trip.gathering_point_id = gathering_point.gathering_point_id
        JOIN
    trip_type ON trip.trip_type_code = trip_type.trip_type_code
        JOIN
    employee ON trip.guide_employee_id = employee.employee_id
ORDER BY destination_name , trip_type_name , trip_date;