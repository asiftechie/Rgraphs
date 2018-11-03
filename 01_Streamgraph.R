##
#Source: https://www.r-bloggers.com/interactive-product-export-streamgraphs-with-data360r-now-in-cran/
#

install.packages("devtools")

devtools::install_github("hrbrmstr/streamgraph")
library(streamgraph)

#install.packages(c('devtools','data360r','bit64', 'dplyr'))
library(devtools)
library(data360r)
library(dplyr)

#Step 1: get data
df_exp <- get_data360(indicator_id = c(2369), output_type = "long")

#Step 2: aggregate by year & product (using dplyr)
df_exp_sum = 
df_exp %>% group_by(Period,Product) %>%
  summarise(Observation = sum(Observation)) %>%
  ungroup() %>%
  filter(!(Product == "All Products")) %>%
  mutate(Obs_scaled = Observation / 1000000000,
         Period = as.numeric(as.character(Period)))

#Step 3: plot streamgraph
streamgraph(df_exp_sum, key="Product", value="Obs_scaled", date="Period") %>%
  sg_axis_x(2, "year", "%Y") %>%
  sg_fill_tableau("cyclic") %>%
  sg_legend(show=TRUE, label= "Product Classification: ")