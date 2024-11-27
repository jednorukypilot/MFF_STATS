sample_count <- 1000
sample_size <- 100

# Generate 1000 samples of 100 exponential random variables l=2, mean=1/2
lambda <- 2
exponential_samples <- replicate(sample_count, rexp(sample_size, rate = lambda))
exponential_var <- apply(exponential_samples, 2, var)
