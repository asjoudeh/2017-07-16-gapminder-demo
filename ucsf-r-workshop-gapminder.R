# Sunday afternoon script
# Ammar Joudeh ammar.joudeh@ucsf.edu
# July 16, 2017

  gapminder <- read.table(file = "output/combined_gapMinder.tsv", sep = "\t", header = T)

# understanding your data

  str(gapminder) # data structures in frame
  typeof(gapminder$year) # data type of vector (column)
  length(gapminder) # number of columns
  ncol(gapminder) # number of columns
  nrow(gapminder) # number of rows
  dim(gapminder) # dimension
  colnames(gapminder) # column names
  head(gapminder) # top few lines
  tail(gapminder) # bottom few lines

# subsetting

  head(gapminder[3]) # by index
  head(gapminder[["lifeExp"]]) # by name
  head(gapminder$year) # by $
  head(gapminder[gapminder$continent == "Africa", "gdpPercap"]) # gdp per cap for forst few Africa entries
  head(gapminder[gapminder$continent == "Africa", ]) # all cols for forst few Africa entries
  africa <- gapminder[gapminder$continent == "Africa", ] # assign all africa data to new data frame
  
  # challenge

  head(gapminder[gapminder$year %in% c(2002,2007)]) #is same as
  head(gapminder[gapminder$year == 2002 | gapminder$year == 2007])
    
# write table
    
  write.table(africa, 
              file = "africa.txt", 
              sep = ",", 
              quote = F, 
              row.names = F)
  #csv, chars not in quotes [careful when strings have commas] row #s not printed

# subsetting by dplyr
    
  install.packages("dplyr")
  library("dplyr")
  year_country_gdp <- select(gapminder, year, country, gdpPercap)
  year_country_gdp2 <- gapminder %>% select(year, country, gdpPercap)
  
  year_country_gdp_euro <- gapminder %>%
                           filter(continent == "Europe") %>%
                           select(year, country, gdpPercap)
  
  year_country_lifeExp_Africa <- gapminder %>%
                                  filter(continent == "Africa") %>%
                                  select(lifeExp, country, year)
  
  gapminder_by_continent <- gapminder %>% group_by(continent)
  str(gapminder_by_continent)
  
  gdp_by_continent <- gapminder %>%
                      group_by(continent) %>%
                      summarize(mean_gdpPercap=mean(gdpPercap))
                      
# conditions 
  
  x <- 4 == 4
  if(x){
    "4 equals 3"
  }
  
  yr2012 <- gapminder %>% filter(year == 2012)
  yr2002 <- gapminder %>% filter(year == 2002)
  
  if (nrow(yr2002) >= 1) {
    "Records from 2002 exist"
  } else{
    "Records from 2002 do not exist"
  }
  
  if (nrow(yr2012) >= 1) {
    "Records from 2012 exist"
  } else {
    "There are no records from 2012"
  }
  
# loops
  
  output_vector <- matrix(nrow = 5, ncol = 5) # define size for efficiency
  
  for (i in 1:5) {
    print(i)
  }
  
  for (i in 1:5) {
    for (j in c("a","b","c","d","e")) {
      temp_vector <- paste(i,j)
      output_vector[i,j] <- temp_vector
    }
  }
  
  output_vector
  
  