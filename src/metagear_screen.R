# Literature Review - 2024-2025
# Nell Pates
# Title and abstracts extracted from multiple online databases and saved in a single .csv document for screening
# This code creates an interface to screen each entry, with keywords highlighted
# (Can also add more people to team <- () to distribute effort)
# 26 March 2024

# Set up to use metagear: 

library(BiocManager)
library("metagear")
citation("metagear")

# download Excel or .csv of search string results from each repository used. 
# Compile results with 2 columns only: TITLE and ABSTRACT
# Remove duplicates in Excel (Data --> Remove duplicates (by TITLE)) 
# Add missing abstracts manually if required

getwd()
setwd("Documents/code/lit-review")

# Read in saved .csv with duplicates removed
data <- read.csv("raw-data/full-screen.csv")

# data needs to be initialized and effort distributed to run the screener:
 
screen <- effort_initialize(data)
team <- c("Nell")

# This line creates a new file in wd (effort_Nell.csv) - CHECK, because if one is already
# saved it will save as effort_Nell1.csv, effort_Nell2.csv etc.
screen <- effort_distribute(screen, initialize = TRUE, reviewers = "Nell", save_split = TRUE)

# load the abstract screener
abstract_screener("effort_Nell.csv", aReviewer = "Nell", 
                  fontSize = 15, windowWidth = 100, windowHeight = 20, buttonSize = 20,
                  highlightColor = "powderblue", highlightKeywords = c("rewilding",
                                                                       "rewild",
                                                                       "monitor",
                                                                       "monitoring",
                                                                       "monitored",
                                                                       "evaluate",
                                                                       "evaluated",
                                                                       "progress",
                                                                       "success",
                                                                       "restoration",
                                                                       "regeneration",
                                                                       "reforestation"))


# Produces output data set which can be subset by INCLUDE (YES, NO, maybe)

sorted_data <- read.csv("effort_Nell.csv")
yes <- subset(sorted_data, INCLUDE == "YES")
maybe <- subset(sorted_data, INCLUDE == "maybe")
no <- subset(sorted_data, INCLUDE == "NO")
first_round <- subset(sorted_data, INCLUDE != "NO")

write.csv(first_round, file = "first_round.csv")
