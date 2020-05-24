data {
    int M;      //number of measurments
    real nu;    //degrees of freedom
    real mu;    //location
    real sigma; //scale
}

generated quantities {
    real y_sim[M];
    for (k in 1:M) {
        y_sim[k] = student_t_rng(nu, mu, sigma);
    }
}

