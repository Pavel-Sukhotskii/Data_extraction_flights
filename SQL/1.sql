SELECT
    model,
    COUNT(DISTINCT flight_id) AS flights_amount
FROM
    aircrafts
    INNER JOIN flights ON flights.aircraft_code = aircrafts.aircraft_code
WHERE
    EXTRACT(MONTH FROM flights.departure_time) = 09
GROUP BY
    model;
