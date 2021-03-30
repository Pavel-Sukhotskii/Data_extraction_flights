SELECT
    week_number,
    ticket_amount,
    festival_week,
    festival_name
FROM
    (SELECT
        EXTRACT(WEEK FROM arrival_time) AS week_number,
        COUNT(ticket_no) AS ticket_amount
    FROM
        airports
        INNER JOIN flights ON flights.arrival_airport = airports.airport_code
        INNER JOIN ticket_flights ON ticket_flights.flight_id = flights.flight_id
    WHERE
        departure_time::date BETWEEN '2018-07-23' AND '2018-09-30'
        AND city='Москва'
    GROUP BY
        week_number) AS fir
        
LEFT JOIN
    (SELECT
    festival_name,
    festival_city,
    EXTRACT(WEEK FROM festival_date) AS festival_week
FROM
    festivals
WHERE
    festival_date BETWEEN '2018-07-23' AND '2018-09-30'
    AND festival_city='Москва') AS sec ON sec.festival_week=fir.week_number
