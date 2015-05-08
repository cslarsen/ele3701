data <- read.csv("ssb.alarm.csv", encoding="UTF-8")
print(data)
summary(data)
pdf("alarmer-land.pdf")
plot(data, type="b",
     main="Mottakere av trygghetsalarmer i Norge")
