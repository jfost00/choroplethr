install.packages("choroplethr")
install.packages("choroplethrMaps")
library(choroplethr)
library(choroplethrMaps)

#####

## Not run:
data(df_president_ts)
?df_president_ts # time series of all US presidential elections 1789-2012
# create a list of choropleths of presidential election results for each year
choropleths = list()
for (i in 2:(ncol(df_president_ts))) {
df = df_president_ts[, c(1, i)]
colnames(df) = c("region", "value")
title = paste0("Presidential Election Results: ", colnames(df_president_ts)[i])
choropleths[[i-1]] = state_choropleth(df, title=title)
}
# set working directory and animate
setwd("~/Desktop")
choroplethr_animate(choropleths)
## End(Not run)

# Thank you Ari Lamstein

# https://cran.r-project.org/web/packages/choroplethr/choroplethr.pdf
# https://github.com/arilamstein/choroplethr/
