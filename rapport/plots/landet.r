total <- read.csv("ssb.alarm.csv", encoding="UTF-8")
nye <- read.csv("ssb.nye.csv", encoding="UTF-8")

summary(total)
summary(nye)

pdf("alarmer-land.pdf")

par(mfrow=c(2,2))
plot(total, type="b", main="Mottakere av trygghetsalarm i Norge")
plot(nye, type="b", main="Nye mottakere")
