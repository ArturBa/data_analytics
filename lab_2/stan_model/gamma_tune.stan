functions {
    vector tail_delta(vector y, vector theta, real[] x_r, int[] x_i) {
        vector[2] deltas;
        deltas[1] = gamma_cdf(theta[1], exp(y[1]), exp(y[2])) - 0.01;
        deltas[2] = 1 - gamma_cdf(theta[2], exp(y[1]), exp(y[2])) - 0.01;
        return deltas;
    }
}

data {
    real l;     // Lower value
    real u;     // Upper value

    real alpha_guess;
    real beta_guess;

    int<lower=0> N;
}


transformed data{
    vector[2] y;
    real x_r[0];
    int  x_i[0];
    vector[2] theta = [l, u]';
    vector[2] y_guess = [log(alpha_guess), log(beta_guess)]';

    // Find gamma deviation ensures 98% below 
    y = algebra_solver(tail_delta, y_guess, theta, x_r, x_i);
    print("alpha: ", exp(y[1]), "   Beta: ", exp(y[2]));

}

generated quantities {
    real alpha = exp(y[1]);
    real beta  = exp(y[2]);

    real y_sim[N];
    for (n in 1:N) {
        y_sim[n] = gamma_rng(alpha, beta);
    }
}
