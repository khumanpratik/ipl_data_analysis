--- Understanding the Data(i.e shape of the data) 


-- Total number of Columns in table(ball_by_ball):
Select count(COLUMN_NAME) as number_of_columns_in_ball_by_ball from information_schema.columns
Where table_name ='ball_by_ball';

-- Total number of Rows in table(ball_by_ball):
select count(*) as number_of_rows_in_ball_by_ball from ipl..ball_by_ball

--go

-- Total number of Columns in table(matches):
Select count(COLUMN_NAME) as number_of_columns_in_matches from information_schema.columns
Where table_name ='matches';

-- Total number of Rows in table(matches):
select count(*) as number_of_rows_in_matches from ipl..matches



-- Viewing the Data

-- Head of the table(matches):
select top 5 * from ipl..matches

-- Head of the table(ball_by_ball):
select top 5 * from ipl..ball_by_ball



