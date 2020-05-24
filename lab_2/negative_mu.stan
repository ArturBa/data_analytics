data {
    int M;      //number of measurments
    real mu;    //location
    real phi;   //precision
}

generated quantities {
    real y_sim[M];
    for (k in 1:M) {
        y_sim[k] = neg_binomial_2_rng(mu, phi);
    }
}
