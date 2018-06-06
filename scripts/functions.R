library(RCurl)
library(plyr)
library(dplyr)
library(stringr)




get_data <- function(table_name, year = NULL, extention = "csv"){
  
  #get all urls to all table_name data on github
  year_data_url <- getURL(
    paste("https://raw.githubusercontent.com/areevesman/mlb_history_web_app/master/data/",
          table_name,
          as.character(year),
          ".",
          extention,
          sep = ""))
  
    if (extention == "csv"){
      
      year_data <- read.csv(text = year_data_url, stringsAsFactors = FALSE) %>%
        as_tibble() 
      
    }
  
  return(year_data)
  
}




add_columns <- function(original_team_data, year){

team_data <- original_team_data %>% 
  
  mutate(year = as.character(year)) %>%
  
  mutate(games_ahead = gsub(x = games_behind,
                            pattern = 'Tied',
                            replacement = '0')) %>%
  mutate(games_ahead = gsub(pattern = 'up',
                            replacement = '-',
                            x = games_ahead)) %>%
  mutate(games_ahead = gsub(pattern = ' ',
                            replacement = '',
                            x = games_ahead)) %>%
  mutate(games_ahead = -1*as.numeric(games_ahead)) %>%
  
  mutate(run_diff = runs - runs_allowed) %>%
  
  mutate(attendance = as.character(attendance)) %>%
  
  mutate(attendance = str_replace_all(attendance, ",", "")) %>%
  
  mutate(attendance = as.numeric(attendance)) %>%
  
  mutate(r_so_far = cumsum(runs)) %>%
  
  mutate(ra_so_far = cumsum(runs_allowed)) %>%
  
  mutate(rd_so_far = cumsum(run_diff)) %>%
  
  mutate(wins_so_far = cumsum(!grepl(x = win_or_loss, pattern='L'))) %>%
  
  mutate(losses_so_far = cumsum(!grepl(x = win_or_loss, pattern='W'))) %>%
  
  mutate(win_loss_differential = wins_so_far - losses_so_far) %>%
  
  mutate(record_so_far =  wins_so_far / (wins_so_far + losses_so_far)) %>%
  
  mutate(attendance_so_far = cumsum(attendance)) %>%
  
  mutate(who_and_where = ifelse(home_or_away == "@", 
                                paste(team, "@", opponent),
                                paste(opponent, "@", team))) %>%
  
  mutate(winner = ifelse(runs > runs_allowed, 
                                team,
                                opponent))

return(team_data)

}





combine_years <- function(team, num_years){
  
  #num_years is number of years team has existed
  #team_schedule_list will hold the teams schedule across all years
  team_schedule_list <- rep(list(data.frame()), times = num_years)
  
  for (j in 1:num_years){
    
    #team_schedule_list[[j]] will be teams schedule for just one year
    #will include all of the new stats defined in add columns
    #got rid of games_behind to avoid issues when binding
    year <- 2018 - num_years + (j - 1)
    original_data <- get_data(team, year)
    team_schedule_list[[j]] <- add_columns(original_data, year)
    
  }
  return(bind_rows(team_schedule_list))
}


