library(readr)
library(dplyr)

table_departements <- read_tsv("raw-data/table_departements_utf8.tsv") %>% 
  select(
    code_region = REGION, 
    code_departement = DEP, 
    libelle_departement = NCCENR
    )

write_csv(
  table_departements, 
  "data/table_departements.csv"
  )

table_regions_2016 <- read_tsv("raw-data/table_regions_2016_utf8.tsv") %>% 
  select(
    code_region = REGION, 
    libelle_region = NCCENR
  )

write_csv(
  table_regions_2016, 
  "data/table_regions_2016.csv"
  )