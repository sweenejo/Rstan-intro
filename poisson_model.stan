functions {
// ... function declarations and definitions ...
}
data {
  int<lower = 0> N;
  int y[N];
}
transformed data {
// ... declarations ... statements ...
}
parameters {
  real<lower = 0> lambda;
}
transformed parameters {
// ... declarations ... statements ...
}
model {
  target += normal_lpdf(lambda | 0, 100); // Prior for lambda
  target += poisson_lpmf(y | lambda); // Sampling statement
}
generated quantities {
int turt_pred;
turt_pred = poisson_rng(lambda);
}