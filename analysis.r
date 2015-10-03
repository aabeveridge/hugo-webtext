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
country_choropleth(df, title="Participant Countries", legend="", num_colors=1, zoom=NULL)
dev.off()

####################################
# Barplot of participant countries
####################################

country.freq <- table(d$country)
country.freq <- rev(country.freq)
png("~/hugo-webtext/images/country-bar.png", 750, 800)
  #Set margin sizes and window size for plot
  par(mar=c(1, 40, 13, 1), pin=c(5.5, 7.5))
  #Barplot
  barplot(country.freq, las=2, main="Participant Countries", width=6, space=0.2, ylim=c(0, 250), 
          horiz=TRUE, axes=FALSE)
  #Add bottom axis and set numeric range
	axis(1, at=seq(0, 110, 5))
dev.off()

##############################################
# Barplot of "Are the Hugos an American Award?"
##############################################

png("~/hugo-webtext/images/american-bar.png", 750, 250)
  par(mar=c(4, 6, 4, 1), pin=c(5.5, 1.5))
  barplot(table(d$american), main="Are the Hugos an American Award?", las=2, horiz=TRUE, axes=FALSE, 
          width=6, space=0.2, ylim=c(0, 50))
  axis(1, at=seq(0, 220, 10))
dev.off()

##############################################################
# Barplot of "How did the participants hear about the Hugos?"
##############################################################

png("~/hugo-webtext/images/hear-bar.png", 750, 600)
  par(mar=c(1, 4, 1, 1), pin=c(5.5, 6))
  barplot(table(d$hear), main="How did the Participants Hear About the Hugos?", las=2, horiz=TRUE, axes=FALSE, 
          width=6, space=0.2, ylim=c(0, 170))
  axis(1, at=seq(0, 220, 10))
dev.off()



