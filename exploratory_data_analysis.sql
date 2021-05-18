------ Analyzing the Dataset

---Basic Analysis:


--- Total number of matches played in IPL (overall) :

select Count(id) as Total_matches_played from ipl..matches


--- Matches played in each season :

select Season, count(season) as matches_played
from ipl..matches
group by season
order by season asc


-------- Toss Desicions as per each season 

----Bat_first:

select year(date) as Season, count(toss_decision) as Bat_first
from ipl..matches
where toss_decision = 'bat'
group by year(date)
order by year(date) asc

--go

----Bowl_first:

select year(date) as Season, count(toss_decision) as Bowl_first
from ipl..matches
where toss_decision = 'field'
group by year(date)
order by year(date) asc




---- Teams Analysis

--- Total matches played by each team (overall) :

select batting_team as Team_name, count(distinct(id)) as Total_matches_played
from ipl..ball_by_ball
group by batting_team
order by count(distinct(id)) desc


--- Most wins by a team (overall):

select winning_team as Team_name, count(winning_team) as Total_wins
from ipl..matches
group by winning_team
order by Total_wins desc


--- Teams win in each season :

select season, winning_team as Team_name, count(winning_team) as Wins
from ipl..matches
group by season, winning_team
order by season, Wins desc


----- Highest victory margin by runs

select top 10 winning_team as Team_name , result_margin , result 
from ipl..matches
where result = 'runs' 
order by result_margin desc


--- Most number of loses by a team (overall) :

select losing_team as Team_name, count(losing_team) as Total_loses
from ipl..matches
group by losing_team
order by Total_loses desc


----- Highest team total (overall) (only Top 10) :

select top 10 b.id as match_id, m.season as Season, b.batting_team as Team_name, sum(b.total_runs) as Total_runs, b.bowling_team as against
from ipl..ball_by_ball as b
join ipl..matches as m
on b.id=m.id
group by b.id, m.season, b.batting_team, b.bowling_team
order by sum(b.total_runs) desc


----- Lowest team total (overall) (only Top 10) :

select top 10 b.id as match_id, m.season as Season, b.batting_team as Team_name, sum(b.total_runs) as Total_runs, b.bowling_team as against
from ipl..ball_by_ball as b
join ipl..matches as m
on b.id=m.id
where winning_team <> 'NA' and method <> 'D/L'
group by b.id, m.season, b.batting_team, b.bowling_team
order by sum(b.total_runs) asc


----- Number of boundaries scored by teams (overall) :

select batting_team as Team_name, count(batsman_runs) as Boundaries_scored
from ipl..ball_by_ball
where batsman_runs in ('4','6')
group by batting_team
order by COUNT(batsman_runs) desc


--- Teams which have taken most number of wickets (overall) :

select top 10 bowling_team as Team_name , count(wicket_ball) as Wickets
from ipl..ball_by_ball
where wicket_ball = '1' 
group by bowling_team
order by count(wicket_ball) desc




---- Batsman Analysis:


------ Highest run Scorer (overall) (only Top 10) :

select top 10 batsman as Batsman_name, sum(batsman_runs) as Total_runs_scored
from ipl..ball_by_ball
group by batsman
order by sum(batsman_runs) desc


-- Most runs by any batsman in a single season (overall) (only Top 10) :

SELECT top 10 m.season as Season, b.batsman as Batsman_name, SUM(b.batsman_runs) AS Total_runs
FROM ipl..ball_by_ball as b
INNER JOIN ipl..matches as m
ON b.id = m.id
GROUP BY m.season, b.batsman
ORDER BY total_runs DESC;


--- Batsman with highest runs in each season (Orange Cap winners) :

WITH orange_cap (season, batsman, total_runs, row_num) 
AS
(SELECT m.season, b.batsman, SUM(b.batsman_runs) AS total_runs, ROW_NUMBER() OVER (PARTITION BY season ORDER BY SUM(b.batsman_runs) DESC) AS row_num
FROM ipl..ball_by_ball as b
INNER JOIN ipl..matches as m
ON b.id = m.id
GROUP BY m.season, b.batsman)

SELECT season as Season, batsman as Batsman_name, total_runs	
FROM orange_cap
WHERE row_num = 1
order by Season;


--------- Most runs scored by boundaries (i.e only 4s & 6s) (only Top 10) :

select top 10 batsman as Batsman_name, sum(batsman_runs) as Runs_scored_by_boundaries
from ipl..ball_by_ball
where batsman_runs in ('4','6')
group by batsman
order by sum(batsman_runs) desc 


--------- Most runs scored from running (i.e only 1s, 2s & 3s ) (only Top 10) :

select top 10 batsman as Batsman_name, sum(batsman_runs) as Total_runs
from ipl..ball_by_ball
where batsman_runs in ('1','2','3')
group by batsman
order by sum(batsman_runs) desc


-------- Most runs scored by batsman in each innings (only Top 10) :

----1st Innings:

select top 10 batsman as Batsman_name, sum(batsman_runs) as Total_runs
from ipl..ball_by_ball
where inning = '1'
group by batsman
order by sum(batsman_runs) desc

--go 

----2nd Innings:

select top 10 batsman as Batsman_name, sum(batsman_runs) as Total_runs
from ipl..ball_by_ball
where inning = '2'
group by batsman
order by sum(batsman_runs) desc


-------- Highest total runs scored by a batsman at a particular venue (only Top 10) :

select top 10 b.batsman as Batsman_name, sum(b.batsman_runs) as Total_runs_scored, m.venue as venue_name
from ipl..ball_by_ball as b
join ipl..matches as m
on b.id = m.id
group by b.batsman, m.venue
order by sum(b.batsman_runs) desc


 --- Highest Individual score by a batsman in a match (overall) (only Top 10) :

select top 10 b.id as match_id, m.season as Season, b.batsman as Batsman_name, sum(b.batsman_runs) as Total_runs, b.bowling_team against
from ipl..ball_by_ball as b
join ipl..matches as m
on b.id=m.id
group by b.id, m.season, b.batsman, b.bowling_team
order by sum(batsman_runs) desc


------- Most number of dismissals for a batsman (overall) (only Top 10) :

select top 10 batsman as Player_name, count(dismissal_kind) as Number_of_dismissals 
from ipl..ball_by_ball
where dismissal_kind in ('bowled', 'caught', 'caught and bowled', 'lbw', 'stumped', 'hit wicket')
group by batsman
order by count(dismissal_kind) desc





---- Bowler Analysis:


-------- Most wickets taken by a bowler (overall) (only Top 10) :


select top 10 bowler as Bowler_name, count(wicket_ball) as Total_wickets
from ipl..ball_by_ball
where wicket_ball = '1' and dismissal_kind not in ('NA', 'obstructing the field', 'retired hurt', 'run out')
group by bowler
order by count(wicket_ball) desc


-- Bowlers with maximum wickets in each season (Purple Cap winners) :

WITH purple_cap (season, bowler, Total_wickets, row_num) 
AS
(SELECT season, bowler, COUNT(wicket_ball) AS Total_wickets, ROW_NUMBER() OVER (PARTITION BY season ORDER BY COUNT(wicket_ball) DESC) AS row_num
FROM ipl..ball_by_ball as b
INNER JOIN ipl..matches as m
ON b.id = m.id
where wicket_ball = '1' and  b.dismissal_kind not in ('NA', 'obstructing the field', 'retired hurt', 'run out')
group by season, bowler
)

SELECT season as Season, bowler as Bowler_name, Total_wickets
FROM purple_cap
WHERE row_num = 1
order by Season;


---- Bowlers with most number of boundaries scored against them (overall) (only top 10):

select top 10 bowler as Bowler_name, count(batsman_runs) as Boundaries_scored
from ipl..ball_by_ball
where batsman_runs in ('4','6')
group by bowler
order by COUNT(batsman_runs) desc


---- Bowlers with most number of runs in extras(i.e wides, noball etc) (overall) (only Top 10) :

select top 10 bowler as Bowler_name, sum(extra_runs) as Extra_runs
from ipl..ball_by_ball
group by bowler
order by Extra_runs desc


---- Bowlers who have taken 5+ wickets in a match (overall) :

select b.id as match_id, m.season as Season, b.bowler as Bowler_name, count(b.wicket_ball) as Total_wickets, b.batting_team as against
from ipl..ball_by_ball as b
join ipl..matches as m
on b.id=m.id
where b.wicket_ball = '1' and b.dismissal_kind not in ('NA', 'obstructing the field', 'retired hurt', 'run out')
group by b.id, m.season, b.bowler, b.batting_team
having count(wicket_ball) >= 5
order by count(wicket_ball) desc



---- Player Analysis:

------ Most number of catches by a fielder/wicketkeeper (overall) (only Top 10) :

select top 10 fielder as Player_name, count(fielder) as Total_catches
from ipl..ball_by_ball
where dismissal_kind in ('caught', 'caught and bowled') and fielder <> 'NA'
group by fielder 
order by count(fielder) desc


----- Most number of man of the match (overall) (only Top 10) :

select top 10 player_of_the_match as Player_name, COUNT(player_of_the_match) as Number_of_MOM
from ipl..matches
where player_of_the_match is not null
group by player_of_the_match
order by COUNT(player_of_the_match) desc 




--- Venue Analysis


--- Venue with most number of matches (overall) (only Top 10):

select top 10 city as City, venue as Venue, COUNT(venue) as Match_hosted
from ipl..matches
group by city, venue
order by Match_hosted desc


--- Venue which hosted most matches from knockout stage (overall) (only Top 10) :

select top 10 city as City, venue as Venue, COUNT(venue) as Match_hosted
from ipl..matches
where match_type not like '%groupstage%'
group by city, venue
order by Match_hosted desc


----- Number of boundaries scored in a particular venue (overall) (only Top 10) :

select top 10 m.venue as Venue_name, m.city as City, count(b.batsman_runs) as Boundaries_scored
from ipl..matches as m
join ipl..ball_by_ball as b
on m.id = b.id
group by m.venue, m.city
order by count(b.batsman_runs) desc


---- Number of wickets taken in a particular venue (overall) (only Top 10) :

select top 10 m.venue as Venue_name, m.city as City, count(b.wicket_ball) as Wickets
from ipl..matches as m
join ipl..ball_by_ball as b
on m.id = b.id
where b.wicket_ball = '1' 
group by m.venue, m.city
order by count(b.wicket_ball) desc




