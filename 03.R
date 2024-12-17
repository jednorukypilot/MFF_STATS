remove(list = ls()) # remove all variables

load(url("http://msekce.karlin.mff.cuni.cz/~maciak/NMFM301/cv3.RData"))
load(url("http://msekce.karlin.mff.cuni.cz/~maciak/NMFM301/functions.RData"))

head(miry)
head(tlak)
head(sex)
head(deti)

str(miry)
str(tlak)
str(sex)
str(deti)

summary(miry)
summary(tlak)
summary(sex)
summary(deti)

var(miry[, c("vaha", "vyska")])