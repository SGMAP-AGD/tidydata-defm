library(readr)
library(ggplot2)
library(zoo)

table_defm_national_categorie <- read_csv(
  file = "data/table_defm_national_categorie.csv"
)

french_format <- function(x) {
  format(x, 
         big.mark = " ", 
         decimal.mark = ",", 
         scientific = FALSE
  )
}

table_defm_national_categorie$yearmon <- as.yearmon(table_defm_national_categorie$date) 
table_defm_national_categorie %>% 
  ggplot() + 
  geom_line(
    mapping = aes(
      x = yearmon, 
      y = defm
    )
  ) + 
  scale_y_continuous(
    name = "# demandeurs d'emplois", 
    labels = french_format
  ) + 
  scale_x_yearmon() + 
  facet_wrap(
    facets = ~ categorie, 
    scales = "free_y", 
    ncol = 1
  ) 
