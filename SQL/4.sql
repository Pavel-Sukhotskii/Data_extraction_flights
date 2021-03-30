SELECT
    festival_name,
    EXTRACT(WEEK FROM festival_date) AS festival_week
FROM
    festivals
WHERE
    festival_date BETWEEN '2018-07-01' AND '2018-10-01'
    AND festival_city='Москва'
