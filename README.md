# A History of Major League Baseball's Active Franchises

This repository contains all of the code and data necessary to create this shiny web app for comparing regular season statistics for Major League Baseball franchises: https://areevesman.shinyapps.io/history/

* Python scripts (jupyter notebooks) that were used to scrape data from [baseball-reference.com](http://www.baseball-reference.com) 
* An R script that contains user-defined functions for interacting with and manipulating the data
* An R script that defines and runs the shiny app


## What the application does

Some general instructions are included in the header of the app. 

![instructions](https://raw.githubusercontent.com/areevesman/mlb_history_web_app/master/images/instructions.png)

Once the user selects a team, year, and statistic, a plot will render that displays game number in the season on the x-axis and the statistic on the y-axis for the given team and year.

![select_team](https://raw.githubusercontent.com/areevesman/mlb_history_web_app/master/images/select_team.png)

![select_year](https://raw.githubusercontent.com/areevesman/mlb_history_web_app/master/images/select_year.png)

![select_stat](https://raw.githubusercontent.com/areevesman/mlb_history_web_app/master/images/select_stat.png)

The plot comes with some cool features. It allows users to zoom in and out, adjust the axes, and more. When the user hovers over a data point, information about the date, teams, score, and winner of the game appears.

![hover](https://raw.githubusercontent.com/areevesman/mlb_history_web_app/master/images/hover.png)

![autoscale](https://raw.githubusercontent.com/areevesman/mlb_history_web_app/master/images/autoscale.png)

## How the application was created

### Step 1: Finding data

The application relies on data from [baseball-reference.com](http://www.baseball-reference.com). The Team ID's table, located here: https://www.baseball-reference.com/about/team_IDs.shtml, was used to determine all necessary IDs and years so that the Team Game-by-Game Schedule tables could be used for all current franchises between their first year in Major League Baseball and 2017. These tables are found on pages with URLs such as https://www.baseball-reference.com/teams/STL/1960-schedule-scores.shtml, where "STL" and "1960" are replaced with the appropriate team ID and year.

### Step 2: Web scraping

Two python scripts (in ipynb format) were created to scrape the data. They utilize the `bs4` (BeautifulSoup) module, which is explained in more detail and used for a similar purpose in this [youtube tutorial](https://www.youtube.com/watch?v=BCJ4afDX4L4).
