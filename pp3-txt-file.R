CENSUS_KEY=26fef66358b5e4b77e4aa7d7ae9502596b475bf7

get_decennial(geography = "state",
              variables = "P013001",
              year = 2010) %>%
    view()
# NB: GEOID TN is 47 and davidson 037


test_census_api <- getCensus(key = "26fef66358b5e4b77e4aa7d7ae9502596b475bf7",
          name = "timeseries/healthins/sahie",
          vars = c("NAME", "IPRCAT", "IPR_DESC", "PCTUI_PT"),
          region = "state:01",
          time = 2017)

test_census_api %>% as_tibble() # to make the data as a dataframe

getCensus(key = "26fef66358b5e4b77e4aa7d7ae9502596b475bf7",
          name = "timeseries/healthins/sahie",
          vars = c("NAME", "IPRCAT", "IPR_DESC", "PCTUI_PT", "AGE_DESC", "RACECAT", "RACE_DESC")


getCensus(key = "26fef66358b5e4b77e4aa7d7ae9502596b475bf7",
          name = "timeseries/qwi",
          vars = c("agegrp", "EarnHirAS","EarnHirNS", "EarnS", "education", "ethnicity",  "for","geo_level", "geography","race", "sex",  "year"),
          region = "state:47")

getCensus(key = "26fef66358b5e4b77e4aa7d7ae9502596b475bf7",
          name = "timeseries/qwi/sa",
          vars = c("agegrp"),
          region = "county:*",
          regionin = "state:01",
          time = 2017)

getCensus(key = "26fef66358b5e4b77e4aa7d7ae9502596b475bf7",
          name = "timeseries/qwi/sa",
          vars = c("agegrp", "EarnS", "education", "race", "sex",  "year"),
          region = "county:037",
          regionin = "state:47",
          time = 2017)

