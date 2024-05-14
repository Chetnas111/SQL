Alter table amazon 
ADD COLUMN Time_of_day varchar(15);

SET SQL_SAFE_UPDATES = 0;


UPDATE amazon
SET Time_of_day = CASE
   When hour(amazon.Time) >= 0 and hour(amazon.Time) < 12 Then "Morning"
   When hour(amazon.Time) >= 12 and hour(amazon.Time) < 10 Then "Afternoon"
   Else "Evening"
End;
-- Adding column named dayname that contains extracted day of the week on which the given transaction took plave
alter table amazon 
ADD column day_name varchar(50);

UPDATE amazon
SET day_name = DATE_FORMAT(amazon.Date, "%a");

-- Adding a column name monthname that contains the extracted months of the year on which the given transaction took place

alter table amazon 
ADD column month_name varchar(50);

ALTER TABLE amazon 
ADD COLUMN month_name VARCHAR(50);

UPDATE amazon
SET month_name = DATE_FORMAT(Date, "%M"); 

