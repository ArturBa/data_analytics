data {
    vector[4] mu;       // location
    matrix[4,4] sigma;  // scale
}


generated quantities {
    vector[4] result = multi_normal_rng(mu,sigma);
}
