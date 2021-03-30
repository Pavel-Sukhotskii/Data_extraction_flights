
-- Найдите количество рейсов на каждой модели самолёта с вылетом в сентябре 2018 года. Назовите получившееся поле flights_amount и выведите его. Также напечатайте на экране поле model. Столбцы в таблице должны быть выведены в следующем порядке:
--model
--flights_amount

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
