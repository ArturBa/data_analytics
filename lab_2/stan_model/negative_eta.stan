data {
    int M;      //number of measurments
    real eta;   //log location
    real phi;   //overdispersion
}

generated quantities {
    real y_sim[M];
    for (k in 1:M) {
        y_sim[k] = neg_binomial_2_log_rng(eta, phi);
    }
}
