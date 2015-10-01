#######################
# Hugo Survey Analysis
#######################

## Read in data from the survey
d <- read.csv("~/hugo-webtext/ha-survey1.csv")

##############################
# Survey Participant Summary
##############################

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

