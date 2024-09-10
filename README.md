# teachIRT

teachIRT is a simple R-package that can be used to teach and explore item response theory (IRT). It is not intended for research or applied psychometrics.

## Installation

Install the package using

```{r}
# Run this if the devtools package isn't installed
# install.packages("devtools")

# Install the teachIRT package
devtools::install_github("jkillisch/teachIRT")
```

When the installation was successful, you can load the package just like any other R-package:

```{r}
library(teachIRT)
```

## Functionality

teachIRT provides four types of functions

(1) Functions to compute probabilities, e.g. probabilities to solve an item or to respond in a certain category. These functions begin with a p\_ followed by the model name.

(2) Functions to plot probabilities (ICCs, OCCs, CCCs). These functions begin with the type of plot followed by the model name.

(3) Functions to compute measures of statistical information. These functions begin with an inf\_ followed by the model name. These functions are, currently, only available for the 1PL-3PL model.

(4) Functions to plot measures of statistical information. These functions begin with an inf_plot\_ followed by the model name.

The model names are rasch, 2pl, 3pl, pcm, gpcm, grm, and tirt.

## Demonstration

Here is a demonstration of the functions provided by the package:

```{r}
# Demonstration of R-package teachIRT

library(teachIRT)

# Rasch -------------------------------------------------------------------

# Probability to solve an item
p_rasch(theta = 3, beta = 2)
p_rasch(theta = 4, beta = 2)
p_rasch(theta = 2, beta = 3)

# Plot ICC
icc_rasch(beta = -0.7)

# Wider x-axis
icc_rasch(theta_range = c(-10, 10), beta = -0.7)

# Multiple items (currently only for 1PL-3PL ICCs)
icc_rasch(beta = -1:1)

# Information at theta
inf_rasch(theta = 0.5, beta = 0.4)

# Plot information function
inf_plot_rasch(beta = 0.5)

# 2PL ---------------------------------------------------------------------

p_2pl(theta = 1.5, beta = 0.5, alpha = 1)
p_2pl(theta = 1, beta = 0.5, alpha = 1)
p_2pl(theta = 1.5, beta = 0.5, alpha = 0.2)
p_2pl(theta = 1, beta = 0.5, alpha = 0.2)

icc_2pl(alpha = 1.2, beta = 1.5)
icc_2pl(alpha = c(1, 1.2), beta = c(0, 1.5))
inf_2pl(theta = 0.5, alpha = 1.2, beta = 1.5)
inf_plot_2pl(alpha = 1.2, beta = 1.5)

# You can manually scale the y-axis for better comparisons
inf_plot_2pl(alpha = 1.2, beta = 1.5, y_lim = 1)

# 3PL ---------------------------------------------------------------------

p_3pl(theta = -5, beta = 0.5, alpha = 1, gamma = 0.3)
icc_3pl(alpha = 1, beta = 0.5, gamma = 0.3)
icc_3pl(alpha = c(0.5, 1), beta = c(1, 0.5), gamma = c(0.2, 0.3))
inf_3pl(theta = 0, alpha = 1, beta = 0.5, gamma = 0.3)
inf_plot_3pl(alpha = 1, beta = 0.5, gamma = 0.3)

# PCM ---------------------------------------------------------------------

# Gives all category probabilities
p_pcm(theta = 0.5, delta = c(-1, 0, 1))
icc_pcm(delta = c(-1, 0, 1))

# GPCM --------------------------------------------------------------------

p_gpcm(theta = 0, alpha = 2, delta = c(-3, -1, 2))
icc_gpcm(alpha = 2, delta = c(-3, -1, 2))

# GRM ---------------------------------------------------------------------

p_step_grm(theta = 1, delta = c(-2, -0.5, 1.5), alpha = 1.2)
p_grm(theta = 1, delta = c(-2, -0.5, 1.5), alpha = 1.2)
occ_grm(alpha = 1.2, delta = c(-2, -0.5, 1.5))
ccc_grm(alpha = 1.2, delta = c(-2, -0.5, 1.5))

# Thurstonian IRT ---------------------------------------------------------

p_tirt(
  theta = c(0.5, 0.7),
  mu = c(1, 0.3),
  lambda = c(0.74, 0.4),
  psi2 = c(1, 1)
)
icc_tirt(
  mu = c(1, 0.3),
  lambda = c(0.74, 0.4),
  psi2 = c(1, 1),
  rotation = -40 # Change this number to rotate the plot
)
```

## Combine teachIRT with the patchwork Package

Sometimes it is useful to portray multiple plots next to each other. In these
cases, I recommend to combine teachIRT with the patchwork package. Here is a 
demonstration:

```{r}
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
```

## Further Information

The functions presented above come with a help file. Just type ?\<function_name\>.

```{r}
# Show help file for the function p_rasch
?p_rasch
```

Please let me know if you have any trouble using the package or if you find a bug.

Have fun!
