use www;
SELECT 
    destination.destination_name,
    trip.trip_number,
    trip_date,
    CONCAT(first_name, ' ', last_name) AS guide_name,
    capacity,
    (SELECT 
            COUNT(trip_number)
        FROM
            reservation
        WHERE
            trip_number = trip.trip_number) AS guests_booked,
    (capacity - ((SELECT 
            COUNT(trip_number)
        FROM
            reservation
        WHERE
            trip_number = trip.trip_number))) AS positions_available
FROM
    trip
        JOIN
    employee ON trip.guide_employee_id = employee.employee_id
        JOIN
    trip_type ON trip_type.trip_type_code = trip.trip_type_code
        JOIN
    destination ON trip.destination_code = destination.destination_code
GROUP BY trip_number
ORDER BY destination_name , trip_type_name , trip_date , trip_number;

