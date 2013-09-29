# depmixS4
library('depmixS4')
data('speed')
	set.seed(1)
mod <- depmix(response = rt ~ 1, data = speed, nstates = 2, 
	trstart = runif(4))
fm <- fit(mod, emc = em.control(rand = FALSE))
fm
summary(fm)
====================================
set.seed(1)
mod <- depmix(rt ~ 1, data = speed, nstates = 2, family = gaussian(), 
	transition = ~scale(Pacc), instart = runif(2))
fm <- fit(mod, verbose = FALSE, emc = em.control(rand = FALSE))
summary(fm, which = 'transition')
==================================
set.seed(1)
mod <- depmix(list(rt ~ 1, corr ~ 1), data = speed, nstates = 2, 
	family = list(gaussian(), multinomial("identity")),
	transition = ~ scale(Pacc), instart = runif(2))
fm <- fit(mod, verbose = FALSE, emc=em.control(rand = FALSE))
summary(fm, which = 'response')