data {
  int M;            // number of years analyzed
  vector[M] miles;  // number of miles flown each year
  real sigma;       // sigma 
}


generated quantities {
  real theta=fabs(normal_rng(0, sigma));
  int y_sim[M];
  for (k in 1:M) {
    y_sim[k] = poisson_rng(theta*miles[k]);
  }
}

