-- Give "Red" the cat one of every toy the other cats have
-- Your code here

INSERT INTO toys (name, cat_id)
    SELECT DISTINCT name, (SELECT id FROM cats WHERE name = 'Red') FROM toys WHERE cat_id != (SELECT id FROM cats WHERE name = 'Red')
;
SELECT * FROM toys ORDER BY cat_id ;
-- Query spoiled cats reporting the most spoiled first
-- Your code here
SELECT 'Cat: ', cats.name, ' toys owned: ', count(toys.name) AS toys_num
    FROM cats LEFT JOIN toys ON (cats.id = cat_id) 
    GROUP BY cats.id
    ORDER BY toys_num DESC
;