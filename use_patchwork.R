
# install.packages("patchwork")
library(patchwork)
library(teachIRT)

# Example 1
p_1 <- icc_gpcm(alpha = 1.2, delta = 0:1)
p_2 <- icc_gpcm(alpha = 0.5, delta = 0:1)
p_1 / p_2
p_1 + p_2

# Example 2
icc <- icc_3pl(alpha = c(1, 1.2), beta = c(0, 0.5), gamma = c(0.1, 0.2))
inf_1 <- inf_plot_3pl(alpha = 1, beta = 0, gamma = 0.1)
inf_2 <- inf_plot_3pl(alpha = 1.2, beta = 0.5, gamma = 0.2)
(icc) / (inf_1 + inf_2)
