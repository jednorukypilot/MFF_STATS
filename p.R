2 + (4 * 5)^2
var1 <- 2 + (4 * 5)^2
var1

vector <- c(1, 2, 3, 4, 5)
vector[1] ### zobrazi prvu zlozku vektora
vector[-c(2, 3)] ### rovnaky vystup, vektor bez druhej a tretej zlozky

m1 <- rbind(vector, vector * 2, vector * 3)
m1
m1[1:2, 1:2]

m2 <- diag(1, 4, 4, )
m2

# Diskrétne rozdelenia: rbinom(), rpois(), rgeom(), a ďalšie;
# Spojité rozdelenia: runif(), rexp(), rnorm(), a ďalšie;

help(rnorm)
?data.frame


# __________________________________________________________

## nagenerovane hodnoty nehodneho vyberu
print(x)
## výběrový průměr
mean(x)
## výběrový medián
median(x)
## výběrový rozptyl
var(x)

## minimum
min(x)
## maximum
max(x)

## summary
summary(x)

## usporadany nahodny vyber
sort(x)
## 22. pořádková statistika
sort(x)[22]
## vektor pořadí
rank(x)

# __________________________________________________________

x <- rnorm(n = 50000, mean = 0, sd = 1)
hist(x, freq = FALSE, xlim = c(-3.5, 3.5), ylim = c(0, 0.6), breaks = 40, col = "lightblue")
xpts <- seq(-3.5, 3.5, length = 500)
lines(xpts, dnorm(xpts, mean = 0, sd = 1), col = "red")
?rnorm


## Rozsah výběru 30
x <- rnorm(n = 30, mean = 0, sd = 1)

## Výpočet a malování empirické distribuční funkce
plot(ecdf(x))


# __________________________________________________________
# Nestarnnost a konzistence

number_of_simulations <- 1000
number_of_observation <- 100
matrix <- rnorm(number_of_simulations * number_of_observation, mean = 0, sd = 1)
matrix <- matrix(
  matrix,
  nrow = number_of_simulations,
  ncol = number_of_observation
)
dim(matrix)

?apply
variables <- apply(matrix, 2, var)
head(variables)
mean(variables)

# __________________________________________________________
# Quantilovy diagram
set.seed(1234)
generated_norm <- rnorm(50, 10, 2)
generated_exp <- rexp(50, 0.4)
par(mfrow = c(2, 2))
qqnorm(generated_norm)
qqline(generated_norm)
qqnorm(generated_exp)
qqline(generated_exp)

boxplot(generated_norm)
boxplot(generated_exp)

# __________________________________________________________
# datove souobory
load(url("http://msekce.karlin.mff.cuni.cz/~maciak/NMFM301/cv2.RData"))
head(cv2)
dim(cv2)
head(cv2[, 2])
head(cv2$pohl)
cv2$vyska[1:5]
cv2$vaha[cv2$vzdelani == "Elementary"]


# Několik užitočných funkcii, ktoré trochu zjednodušia prácu v programe R
# (napr. funkcie plotCI,plotmeans,ci.asym,ci.t,sign.test, ktoré využijeme nižšie)
#  načítame do programu R pomocou následujúceho príkazu:
load(url("http://msekce.karlin.mff.cuni.cz/~maciak/NMFM301/functions.RData"))
ls()
par(mfrow = c(1, 1))
qqnorm(cv2$vyska[cv2$vzdelani == "Elementary"])
qqline(cv2$vyska[cv2$vzdelani == "Elementary"])
mean(cv2$vyska[cv2$vzdelani == "Elementary"])
mean(cv2$vyska)
summary(cv2$pohl[cv2$vzdelani == "Elementary"])
summary(cv2$pohl)


# Nasimulujte náhodný výber o rozsahu 500 z normálneho rozdelenia a porovnajte príslušný QQ graf zo simulovaných dat s QQ grafom vyššie.
set.seed(1234)
generated_norm <- rnorm(500, mean(cv2$vyska), sd(cv2$vyska))
par(mfrow = c(1, 1))
qqnorm(cv2$vyska)
qqline(generated_norm)


# ci.t <- function(x, conf.level = 0.95) presny pro normalni rozdeleni, priblizny pro konecny druhy moment
smp <- rnorm(20, 2, 1)
prum <- mean(smp)
ci.t(smp)

# pro vice realizaci
number_of_observation <- 20
number_of_simulations <- 100
matrix <- matrix(
  rnorm(number_of_observation * number_of_simulations, mean = 2, sd = 1),
  nrow = number_of_observation,
  ncol = number_of_simulations
)

mean <- 2
vyberovy_confidence_interval <- apply(matrix, mean, ci.t)
vci_low <- vyberovy_confidence_interval[1, ]
vci_high <- vyberovy_confidence_interval[3, ]

pokryti <- sum(max(vci_low) < mean & mean < min(vci_high)) / number_of_simulations

plotCI(
  vyberovy_confidence_interval[2, ],
  uiw = vyberovy_confidence_interval[3, ] - vyberovy_confidence_interval[2, ],
  liw = vyberovy_confidence_interval[2, ] - vyberovy_confidence_interval[1, ],
  gap = 0.15, sfrac = 0.002,
  ylab = "Int. spol. pro stredni hodnotu",
  xlab = "MC Opakování",
  pch = 22, cex = 0.8,
  pt.bg = "gray"
)
abline(h = str.h, col = "red")


ci.t(cv2$vaha[cv2$pohl == "Male"])
