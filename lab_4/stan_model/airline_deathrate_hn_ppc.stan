data {
  int sigma; //poisson lambda argument
}


generated quantities {
  real lambda = fabs(normal_rng(0, sigma));
  int y_sim = poisson_rng(lambda);
}


