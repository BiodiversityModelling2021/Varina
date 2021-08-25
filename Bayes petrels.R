

# 1. Grid search ----------------------------------------------------------

set.seed(1859)
x_obs <- rbinom(10, 6, 0.6)
x_obs


p <- seq(from = 0.01, to = 0.99, length.out = 100)

curve(dbeta(x, 2, 2))

prior <- dbeta(p, 2, 2)

#likelihood <- (dbinom(x_obs, size = 6, prob = p, log = FALSE))

numerator <- likelihood * prior

denominator <- sum(numerator)

#sum(numerator/denominator)

posterior <- numerator/denominator
posterior

plot(p, posterior)


# 2. Conjugate prior ------------------------------------------------------

install.packages("extraDistr")

set.seed(1859)
x_obs <- rbinom(10, 6, 0.6)
x_obs

p <- seq(from = 0.01, to = 0.99, length.out = 100)

curve(dbeta(x, 2, 2))

prior <- dbeta(p, 2, 2)

posterior2 <- dbeta(p, shape1 = (2 + sum(x_obs)), shape2 = (2 + sum(6 - x_obs)))

something <- posterior2/sum(posterior2)

plot(p, posterior2)
