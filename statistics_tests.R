# V programe R je defaultne implementoványch niekoľko funkcii so 
# základnými štatistickými testami, napr. test parametru binomického 
# rozdelenia binom.test() (znamienkový test), alebo jedno/dvoj výberové 
# testy wilcox.test(), t.test(), ks.test(), fisher.test(), var.test(), 
# prípadne viacvýberové testy kruskal.test(), anova() a mnoho ďalších.

#* Nasteni testu
load(url("http://msekce.karlin.mff.cuni.cz/~maciak/NMFM301/functions.RData"))

#* Znamenkovy test
# asymptoticky test sign.test(vyber, hypoteticky_median)

vyber <- c(19, 15, 18, 16, 12, 12, 11, 13, 10, 18, 10, 17, 10, 15, 17, 20, 18, 6, 16, 16, 9, 12, 16, 16)
sign.test(vyber, 8)

#* T-test
# pro symetrickou distribuci a velke vzorky t.test(vyber, mu = hypoteticky_prumer)

#* Kolmogorovův-Smirnovův test
# ks.test(vyber, "pnorm", mean = hypoteticky_prumer, sd = hypoteticky_smerodatna_odchylka, exact = FALSE)
# testuje shodu s hypotetickou distribuci
load(url("http://msekce.karlin.mff.cuni.cz/~maciak/NMFM301/cv3.RData"))
ks.test(miry$vyska,"pnorm",mean=168,sd=10,exact=FALSE)
# Hodnota testové statistiky Kn byla 0.037, p-hodnota vyšla 0.4993. 
# Na hladině α=0.05, nemůžeme zamítnout hypotézu, že výška má rozdělení N(168,100).
