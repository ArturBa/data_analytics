data {
  int M;            // number of years analyzed
  vector[M] miles;  // number of miles flown each year
  int y[M];         // death rate
  real sigma;       // sigma
  int miles_sim;    // miles flown
}
parameters {
  real<lower=0>theta;
}
model {
  theta ~ normal(0, sigma);
  for (k in 1:M) {
    y[k] ~ poisson(miles[k]*theta);
  }
}
generated quantities {
  int y_sim = poisson_rng(miles_sim*theta);
}


