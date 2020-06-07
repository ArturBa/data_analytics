data {
    vector[2] mu;       // location
    matrix[2,2] sigma;  // scale
}


generated quantities {
    vector[2] result = multi_normal_rng(mu,sigma);
}
