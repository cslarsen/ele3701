data <- read.csv("mottakere-alarm-oslo.csv")
print(data)
summary(data)
plot(data, type="l", main="Mottakere av trygghetsalarmer i Oslo")
