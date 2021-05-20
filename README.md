# IPL Data Analysis using SQL



## Objective : 
To Extract some interesting Analysis/Insights from the IPL Dataset



## Data Source :
#### Kaggle: [Indian Premier League (Cricket)](https://www.kaggle.com/patrickb1912/ipl-complete-dataset-20082020 "https://www.kaggle.com")



## Technologies used :
**Programming Language:** T-SQL (MS SQL Server)

**Software used:** Microsoft Excel & Microsoft SQL Server Management Studio 18



## Data Cleaning Process : 

### In Microsoft Excel:
- Added a Season column using the **YEAR()** function on the Date column
- Added a Losing_team column with the help of **IF condition** 
- Added a Match_type column **(i.e 'Groupstage', 'Qualifier1', 'Final' etc)** by using some external data source

### In Microsoft SQL Server:
- Updated/renamed different Team names according to their present names **(e.g. "Delhi Daredevils" --> "Delhi Capitals" etc)**  
- Updated/renamed different Venue names according to their present names **(e.g. "Punjab Cricket Association Stadium, Mohali" --> "Punjab Cricket Association IS Bindra Stadium,Mohali" etc)**
- Filled the missing values in the City column by taking reference from the Venues column
- Filled the missing values in the Bowling_Team column
 
 **More information here -->** [IPL Data Cleaning](https://github.com/khumanpratik/ipl_data_analysis-using-SQL/blob/main/cleaning_the_data.sql "cleaning_the_data.sql")
 
 
 
 ## Exploratory Data Analysis Process :
 
### Conducted the Analysis in various parts for better understanding:

 
 - **Basic Analysis** (e.g. Total number of matches played in IPL, Matches played in each season etc)
 
 - **Teams Analysis** (e.g. Most wins by a team, Most number of loses by a team etc)
 
 - **Batsman Analysis** (e.g. Highest run Scorer, Highest Individual score by a batsman in a match etc)
 
 - **Bowler Analysis** (e.g. Most wickets taken by a bowler, Bowlers who have taken 5+ wickets in a match etc)
 
 - **Player Analysis** (e.g. Most number of catches by a fielder/wicketkeeper, Most number of man of the match etc)
 
 - **Venue Analysis** (e.g. Venue which hosted most matches from knockout stage, Number of boundaries scored in a particular venue etc)
 
 **More information here -->** [IPL EDA Process](https://github.com/khumanpratik/ipl_data_analysis-using-SQL/blob/main/exploratory_data_analysis.sql "exploratory_data_analysis.sql")



## Data visualization :

**Tableau Public Profile** --> [Pratik Khuman](https://public.tableau.com/profile/pratik.khuman#!/ "https://public.tableau.com")



