#something like #4


mod1 <- glm(data=tidy,
            formula=USMR ~ Year)
mod2 <- glm(data=tidy,
            formula=USMR ~ Year + continent)
mod3 <- glm(data=tidy,
            formula=USMR ~ Year * continent * countryname)

#Side note:
mod3 <- glm(data=tidy,
            formula=USMR ~ Year * continent)

gather_predictions(tidy,mod1,mod2,mod3)

pipe to ggplot aes x=year, y=pred, color = continent)) +
  geom_smooth()
method="glm)"
facet wrap(~model)


bon

ND <- data.frame(Country ="Ecuador", Year=2020,Continent="Americas")

predict(mod3,ND)


  