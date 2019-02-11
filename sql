CREATE TABLE STORES_1       --creating table as stores_1
(store_id number not null,  -- defining table elements with their datatypes
city varchar(50)
)

INSERT INTO STORES_1        -- inserting values into the table
VALUES(1,'San Francisco');

INSERT INTO STORES_1
VALUES(2,'Italy');

INSERT INTO STORES_1
VALUES(3,'France');

INSERT INTO STORES_1
VALUES(4,'Boston');

INSERT INTO STORES_1
VALUES(3,'France');

INSERT INTO STORES_1
VALUES(4,'Boston');

select * from STORES_1       --to see the table elements

SELECT store_id,city,count(*)
from STORES_1
group by store_id,city
ORDER BY COUNT(*)            --Groups and then orders by store_id and the occurance of the city name corresponding to the store_id

select rowid,store_id,city   --using pseudo column(address for the rows)
from STORES_1

DELETE FROM STORES_1         --deleting duplicates    
where rowid NOT IN (               
select min(rowid)            --lowest rowid
from STORES_1
group by store_id,city)

ALTER TABLE STORES_1         -- to create primary key as store_id
ADD CONSTRAINT store_id_pl PRIMARY KEY(store_id)

--To create unique index which here is already created as there are 2 columns(optional in this case)
CREATE UNIQUE INDEX store_id_unique
ON STORES_1(store_id)
COMPUTE STATISTICS
