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
plot(total, type="b", main="Mottakere hele året")
plot(nye, type="b", main="Nye mottakere")
plot(gjstr, type="b", main="Mottakere hele eller deler av året")
#pie(c(5361,68070),labels=c("Yngre enn 67 år\n7%", "67 år og eldre\n93%"), main="Mottakere i 2013",col=c("lightgray","darkgray"))

y <- utv$X0..66
o <- utv$X67..
yl = c(min(min(y), min(o)), max(max(y), max(o)))
plot(utv$År, y, type="b", ylim=yl, ylab="Personer", xlab="År",
     main="Aldersfordeling hjemmetjenester")
lines(utv$År, o, type="b", ylim=yl, pch=3)
print(yl)
