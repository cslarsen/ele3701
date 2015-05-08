total <- read.csv("ssb.alarm.csv")
nye <- read.csv("ssb.nye.csv")
gjstr <- read.csv("ssb.gjstr.csv")

summary(total)
summary(nye)
summary(gjstr)

pdf("alarmer-land.pdf")

par(mfrow=c(2,2))
plot(total, type="b", main="Mottakere hele året")
plot(nye, type="b", main="Nye mottakere")
plot(gjstr, type="b", main="Mottakere hele eller deler av året")
