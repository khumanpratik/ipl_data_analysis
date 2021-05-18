---- Cleaning Data from table(matches): 


--- Renaming the Teams: 

-- Team Rising Pune Supergiant:
update ipl..matches
set home_team = 'Rising Pune Supergiant'
where home_team = 'Rising Pune Supergiants'

update ipl..matches
set away_team = 'Rising Pune Supergiant'
where away_team = 'Rising Pune Supergiants'

update ipl..matches
set toss_winner = 'Rising Pune Supergiant'
where toss_winner = 'Rising Pune Supergiants'

update ipl..matches
set winning_team = 'Rising Pune Supergiant'
where winning_team = 'Rising Pune Supergiants'

update ipl..matches
set losing_team = 'Rising Pune Supergiant'
where losing_team = 'Rising Pune Supergiants'


-- Team Sunrisers Hyderabad: 
update ipl..matches
set home_team = 'Sunrisers Hyderabad'
where home_team = 'Deccan Chargers'

update ipl..matches
set away_team = 'Sunrisers Hyderabad'
where away_team = 'Deccan Chargers'

update ipl..matches
set toss_winner = 'Sunrisers Hyderabad'
where toss_winner = 'Deccan Chargers'

update ipl..matches
set winning_team = 'Sunrisers Hyderabad'
where winning_team = 'Deccan Chargers'

update ipl..matches
set losing_team = 'Sunrisers Hyderabad'
where losing_team = 'Deccan Chargers'


-- Team Delhi Capitals:
update ipl..matches
set home_team = 'Delhi Capitals'
where home_team = 'Delhi Daredevils'

update ipl..matches
set away_team = 'Delhi Capitals'
where away_team = 'Delhi Daredevils'

update ipl..matches
set toss_winner = 'Delhi Capitals'
where toss_winner = 'Delhi Daredevils'

update ipl..matches
set winning_team = 'Delhi Capitals'
where winning_team = 'Delhi Daredevils'

update ipl..matches
set losing_team = 'Delhi Capitals'
where losing_team = 'Delhi Daredevils'



--- Updating the venue:

update ipl..matches
set venue = 'M Chinnaswamy Stadium'
where venue = 'M.Chinnaswamy Stadium'

update ipl..matches
set venue = 'Punjab Cricket Association IS Bindra Stadium, Mohali'
where venue = 'Punjab Cricket Association Stadium, Mohali'



--- Updating the city:

update ipl..matches
set city = 'Dubai'
where venue = 'Dubai International Cricket Stadium'

update ipl..matches
set city = 'Sharjah'
where venue = 'Sharjah Cricket Stadium'

update ipl..matches
set city = 'Bangalore'
where city = 'Bengaluru'




---- Cleaning Data from table(ball_by_ball): 


--- Renaming the Teams:

-- Team Rising Pune Supergiant:
update ipl..ball_by_ball
set batting_team = 'Rising Pune Supergiant'
where batting_team = 'Rising Pune Supergiants'

update ipl..ball_by_ball
set bowling_team = 'Rising Pune Supergiant'
where bowling_team = 'Rising Pune Supergiants'


-- Team Sunrisers Hyderabad: 
update ipl..ball_by_ball
set batting_team= 'Sunrisers Hyderabad'
where batting_team = 'Deccan Chargers'

update ipl..ball_by_ball
set bowling_team = 'Sunrisers Hyderabad'
where bowling_team = 'Deccan Chargers'


-- Team Delhi Capitals:
update ipl..ball_by_ball
set batting_team = 'Delhi Capitals'
where batting_team = 'Delhi Daredevils'

update ipl..ball_by_ball
set bowling_team = 'Delhi Capitals'
where bowling_team = 'Delhi Daredevils'



--- Filling the missing values in the column(bowling_team) :
update ipl..ball_by_ball 
set bowling_team = case
					 when b.batting_team = m.home_team then m.away_team
					 else m.home_team
                   end
from ipl..ball_by_ball as b
join ipl..matches as m 
on b.id = m.id
where b.bowling_team = 'NA'
