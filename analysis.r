#######################
# Hugo Survey Analysis
#######################

library(choroplethr)

## Read in data from the survey
d <- read.csv("~/hugo-webtext/ha-survey1.csv")

##############################
# Survey Participant Summary
##############################

# Choropleth map of participant countries
# Create new data frame
df <- as.data.frame(table(d$country))

# Set column names to defaults for Choropleth package
colnames(df) <- c("region", "value")

# Set country names to lowercase
df$region <- tolower(df$region)

# Map country level choropleth of participant data
png("~/hugo-webtext/images/country-map.png", 750, 600)
country_choropleth(df, title="", legend="", num_colors=1, zoom=NULL)
dev.off()

# Use country.regions to map countries




#Graph of participant countries
country.freq <- table(d$country)
country.freq <- rev(country.freq)
png("~/hugo-webtext/images/country-bar.png", 750, 800)
  #Set margin sizes and window size for plot
  par(mar=c(0, 20, 13, 4), pin=c(7, 8))
  #Barplot
  barplot(country.freq, las=2, main="Participant Countries", width=6, space=0.2, ylim=c(0, 250), horiz=TRUE, 
          axes=FALSE)
  #Add bottom axis and set numeric range
	axis(1, at=seq(0, 110, 5))
dev.off()


# Graph of how participants became fans

#############################

