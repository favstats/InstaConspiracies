
# install.packages("pacman")
library(instaloadeR)
library(reticulate)
library(purrr)
library(tidyverse)

reticulate::use_python(py_config()$python)


init_instaloadeR()

hashies <- c("plannedemic")

get_em <- function(hashtag) {
  
  instaloadeR::insta_posts(query = hashtag, 
                           scope = "hashtag",
                           max_posts = 1000000, 
                           scrape_comments = F,
                           save_path = glue::glue("data/{hashtag}.csv"))
}

get_em <- possibly(get_em, otherwise = NA, quiet = F)

hashies %>%
  purrr::walk(get_em)

# read_csv("data/plannedemic.csv")

