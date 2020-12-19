library(shiny)
library(shinythemes)
library(tidyverse)
library(readxl)

race <- read_csv('data/race.csv')
sex_by_age <- read_csv('data/sex_by_age.csv')
education <- read_csv('data/acs_education_final.csv')
