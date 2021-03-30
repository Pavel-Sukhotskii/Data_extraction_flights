SELECT
    FIN.city,
    AVG(FIN.count) AS average_flights
FROM
    (
    SELECT
        city,
        COUNT(DISTINCT flight_id)
    FROM
        airports
        INNER JOIN flights ON flights.arrival_airport=airports.airport_code
    WHERE
        EXTRACT(MONTH FROM arrival_time:: date) = 08
    GROUP BY
        city,
        EXTRACT(DAY FROM arrival_time:: date)) AS FIN
GROUP BY
    FIN.city;
