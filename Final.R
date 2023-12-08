library(ggplot2)
library(dplyr)

data <- read.csv("/Users/cartersmotherman/Downloads/world_data_cleaned.csv")
colnames(data)
#Convert to numeric
data$Year <- as.numeric(as.character(data$Year))

#Find top 16 coutries in 2021
top_16_countries_pc <- head(arrange(subset(data, Year == 2021), desc(GDPperCapita)), 16)
data_top_16_pc <- subset(data, Country %in% top_16_countries$Country)

#Plotting
ggplot(data_top_16_pc, aes(x = Year, y = GDPperCapita, group = Country)) +
  geom_line() +
  facet_wrap(~ Country, nrow = 4, ncol = 4, scales = "free_y") +
  labs(title = "GDP (pc) Trends of Top 16 Countries (in 2021) Over the Years", x = "Year", y = "GDP") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_x_continuous(breaks = c(2000, 2005, 2010, 2015,2020))


#Find top 16 coutries in 2021
top_16_countries <- head(arrange(subset(data, Year == 2021), desc(GDP)), 16)
data_top_16 <- subset(data, Country %in% top_16_countries$Country)

#Plotting
ggplot(data_top_16, aes(x = Year, y = GDPperCapita, group = Country)) +
  geom_line() +
  facet_wrap(~ Country, nrow = 4, ncol = 4, scales = "free_y") +
  labs(title = "GDP Trends of Top 16 Countries (in 2021) Over the Years", x = "Year", y = "GDP") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_x_continuous(breaks = c(2000, 2005, 2010, 2015,2020))


