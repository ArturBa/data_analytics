data {
    real nu;    //degrees of freedom
    real mu;    //location
    real sigma; //scale
}

generated quantities {
    real y_sim = student_t_rng(nu, mu, sigma);
}

