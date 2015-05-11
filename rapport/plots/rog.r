r <- read.csv("rogaland.csv")
pdf("rogaland.pdf")
plot(r$År, r$Mottakere, xlab="År", ylab="Personer",
     type="b", pch=16, main="Mottakere av trygghetsalarm i Rogaland")
