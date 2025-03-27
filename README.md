# teachIRT

teachIRT is a simple R-package that can be used to teach and explore item response theory (IRT).

[![R-CMD-check](https://github.com/jkillisch/teachIRT/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jkillisch/teachIRT/actions/workflows/R-CMD-check.yaml) [![Codecov test coverage](https://codecov.io/gh/jkillisch/teachIRT/graph/badge.svg)](https://app.codecov.io/gh/jkillisch/teachIRT)

## Installation

Install the package using

```{r, eval=FALSE}
# Run this if the devtools package isn't installed
install.packages("devtools")

# Install the teachIRT package
devtools::install_github("jkillisch/teachIRT")
```

If you would like to include knitted vignettes in the installation, use:

```{r, eval=FALSE}
devtools::install_github(
  "jkillisch/teachIRT",
  build_vignettes = TRUE,
  dependencies = TRUE
)
```

You can load the package just like any other R-package:

```{r}
library(teachIRT)
```

## Functionality

teachIRT provides five types of functions: (1) Functions to compute probabilities, (2) functions to plot probabilities, (3) functions to compute measures of statistical information, (4) functions to create information plots, and (5) functions to simulate responses.

Available models are are the 1PL/Rasch, 2PL, 3PL, PCM, GPCM, GRM, and TIRT model. However, functions (1)-(5) are not fully crossed with all models. If vignettes have been built, you can check the demonstration vignette for an overview and demonstration of all package functions.

```{r}
vignette("demonstration", "teachIRT")
```

There is another vignette related to combining multiple plots using the patchwork package. It can be also be viewed using the vignette command:

```{r}
vignette("combine_with_patchwork", "teachIRT")
```

## Help Files

All user functions come with a help file. Just type ?\<function_name\> for further information.

```{r}
# Show help file for the function p_rasch
?p_rasch
```

Please let me know if you have any trouble using the package or if you find a bug.

Have fun!
