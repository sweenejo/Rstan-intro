functions {
// ... function declarations and definitions ...
}
data {
  int<lower = 0> N;
  int y[N];
  int sets_obs[N];
  int sets[N];
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
  for (i in 1:N) {
    target += poisson_lpmf(y[i] | lambda * sets_obs[i]); // Sampling statement
  }
}
generated quantities {
int turt_pred[N];
for(i in 1:N) {
  turt_pred[i] = poisson_rng(lambda * sets[i]);
}
}