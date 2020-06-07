data {
    int M;      //number of measurments
    real lambda_;
}

generated quantities {
    real y_sim[M];
    for (k in 1:M) {
        y_sim[k] = poisson_rng(lambda_);
    }
}

