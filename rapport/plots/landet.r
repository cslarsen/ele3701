total <- read.csv("ssb.alarm.csv")
#total <- total[3:7,]
nye <- read.csv("ssb.nye.csv")
gjstr <- read.csv("ssb.gjstr.csv")
utv <- read.csv("ssb.utv2.csv")

summary(total)
summary(nye)
summary(gjstr)

pdf("alarmer-land.pdf")

par(mfrow=c(2,2))

plot(total$År, total$Personer / 1000, xlab="År", ylab="Personer
     (tusen)", type="b", main="Mottakere hele året", pch=21)

plot(nye$År, nye$Personer / 1000, xlab="År", ylab="Personer (tusen)",
     type="b", main="Nye mottakere", pch=21)

plot(gjstr$År, gjstr$Personer / 1000, xlab="År", ylab="Personer (tusen)",
     type="b", pch=21, main="Mottakere hele eller deler av året")

#pie(c(5361,68070),labels=c("Yngre enn 67 år\n7%", "67 år og eldre\n93%"), main="Mottakere i 2013",col=c("lightgray","darkgray"))

y <- utv$X0..66
o <- utv$X67..
yl = c(min(min(y), min(o)), max(max(y), max(o)))
yl = yl / 1000
plot(utv$År, y / 1000, type="b", ylim=yl, ylab="Personer (tusen)", xlab="År",
     main="Aldersfordeling alle hjemmetjenester", pch=21)
lines(utv$År, o / 1000, type="b", ylim=yl, pch=24)
legend(2010,105,c("Over 66 år", "Under 67 år"), pch=c(24,21))
