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

![select_stat](https://raw.githubusercontent.com/areevesman/mlb_history_web_app/master/images/select_stat.png)

## How the application was created

### Step 1: Web scraping
