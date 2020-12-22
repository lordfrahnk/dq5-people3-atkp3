library(tidyverse)
library(dplyr)
library(shiny)
library(shinydashboard)

# Map
#library(tigris)
#library(mapview)
#library(sf)

# To get rid of the scientific notation on the labels.
library(scales)


# Education csv file
acs5_education <-read_csv(('data/acs5_education_metro.csv'))


metro_choices <- sort(unique(acs5_education$metropolitan_area))