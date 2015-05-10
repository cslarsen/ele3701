# Plott eldrebølgen, vis at den er på vei
# Vis antall som har hjemmetjenester (= bra)
# Vis antall som bor på institusjon (= dårlig)
# Kan kanskje normalisere med total befolkningsmengde?

# Kilde: Tabell: 07459: Folkemengde, etter kjønn og ettårig alder. 1. januar (K)
require("sqldf") # to install: install.packages("sqldf")
#gamle <- read.csv("eldre")
gamle <- read.csv.sql("eldre.csv", "select År, Menn+Kvinner as Personer from file where År>=2007")

# brukere av hjemmetjenester, tabell 06969
hj <- read.csv.sql("hjemmetjenester.csv", "select År, x67x79 + x80x89 + x90 as Personer from file")

par(mfrow=c(2,1))
plot(gamle, type="l", main="Personer 67 år og eldre",
     xlab="År", ylab="Personer")
plot(hj, type="l", main="Brukere av pleie- og omsorgstjenester over 66 år",
     xlab="År", ylab="Personer")
