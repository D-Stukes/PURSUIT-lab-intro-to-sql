-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code

--
-- Write your code below each prompt

--
\echo Create a table called gifts
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- value - integer
-- previously_regifted boolean

CREATE TABLE gifts(id serial, gift TEXT, giver VARCHAR(30), value INT, previously_regifted BOOL);
-- 
\echo See details of the table you created
-- 
\d gifts;

-- 
\echo Alter the table so that the column price is changed to VALUES 
-- 
ALTER TABLE gifts RENAME value to price;
ALTER TABLE gifts RENAME price to value;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
INSERT INTO gifts (gift, value) VALUES ('peach candle', 9);

--
\echo Query for all the columns in your gifts table
-- 
SELECT * FROM gifts;

--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('peach candle', 'Santa', '9', TRUE),
('cinnamon candle', 'Nick', '19', TRUE),
('soap on a rope', 'Rudolf', '29', FALSE),
('potpurri', 'Elf on the Shelf', '39', TRUE),
('mango candle', 'The Boss', '49', FALSE)
;

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('raspberry candle', 'MaryAnn', 25, FALSE),
('peppermint bath set', 'Peter', 32, FALSE),
('antique radio-clock', 'Suzy', 60, TRUE),
('mother of pearl', 'Brian', 100, FALSE),
('gold necklace','Kevin', 200, TRUE);
--
\echo Query for gifts with a price greater than or equal to 20
--
SELECT * FROM houses WHERE price >= 200;

--
\echo Query for every gift that has the word candle in it, only show the gift column
--
SELECT * FROM houses WHERE gift LIKE '%candle%';

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
SELECT * FROM houses WHERE giver = 'Santa' OR value > 30;

--
\echo Query for every gift whose giver is NOT Santa
--
SELECT * FROM houses WHERE giver != 'Santa';

--
\echo Update the second gift to have a value of 2999
-- 
UPDATE houses SET value = 2999 WHERE id = 2;

--
\echo Query for the updated item
--
SELECT * FROM houses WHERE value = 2999;

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--
DELETE * FROM houses WHERE giver = 'Santa' RETURNING value, gift;

--
\echo Query for all the columns in your gifts table one more time
--
SELECT * FROM houses;



-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 
SELECT COUNT(*) FROM houses WHERE gift LIKE %candle% 

--
\echo Get the AVEREAGE value from all the gifts
--
SELECT AVG(value) FROM houses

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
SELECT * FROM houses LIMIT 3 OFFSET 2 ORDER BY value DESC
--
-- finish
--
DROP TABLE IF EXISTS gifts;
DROP TABLE gifts
