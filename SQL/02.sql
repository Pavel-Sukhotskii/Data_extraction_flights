SELECT
    CASE WHEN model LIKE '%Boeing%' THEN
        'Boeing'
    WHEN model LIKE '%Airbus%' THEN 
        'Airbus'
    ELSE
        'other'
    END AS flights_amount,
    COUNT(DISTINCT flight_id)
FROM
    aircrafts
    INNER JOIN flights ON flights.aircraft_code = aircrafts.aircraft_code
WHERE
    EXTRACT(MONTH FROM CAST(departure_time AS date)) = 09
GROUP BY
    flights_amount
