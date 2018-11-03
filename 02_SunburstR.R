###
# Source: https://cran.r-project.org/web/packages/sunburstR/vignettes/sunburst-2-0-0.html
# 

library(sunburstR)
#packageVersion("sunburstR")
library(htmltools)
library(d3r)

dat <- data.frame(
  level1 = rep(c("a", "b"), each=3),
  level2 = paste0(rep(c("a", "b"), each=3), 1:3),
  size = c(10,5,2,3,8,6),
  stringsAsFactors = FALSE
)

knitr::kable(dat)

#use D3 to build hierarchy
tree <- d3_nest(dat, value_cols = "size")
#tree

dev.off()

### Option sb1: plain tree
#sb1 <- 
sunburst(tree, width="100%", height=400)

### Option sb2: plain tree, w/o legend
#sb2 <- 
sunburst(
  tree,
  legend = FALSE,
  width = "100%",
  height = 400
)

### Option sb3: tree with hierarchical
#sb3 <- 
sund2b(tree, width="100%")