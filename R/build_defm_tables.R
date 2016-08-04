library(readxl)
library(tidyr)
library(dplyr)
library(plyr)
library(lubridate)
source("R/clean_sheet.R")
source("R/build_cog_tables.R")

list_sheets <- excel_sheets("raw-data/ser_reg_dep-rboptse88.xlsx")
list_sheets

list_sheet_categorie <- c("Catégorie A ensemble", "Catégorie B", "Catégorie C", 
                          "Catégorie D", "Catégorie E")

table_defm_departement_categorie <- ldply(
  .data = list_sheet_categorie, 
  clean_sheet, 
  .progress = "text"
) %>% 
  select(date, categorie, code_departement, defm)

table_defm_departement_categorie <- table_defm_departement_categorie %>% 
  left_join(
    table_departements, 
    by = "code_departement"
  )
table_defm_departement_categorie %>% glimpse()

write_csv(
  table_defm_departement_categorie,
  path = "data/table_defm_departement_categorie.csv"
  )

table_defm_region2016_categorie <- table_defm_departement_categorie %>% 
  group_by(date, code_region, categorie) %>% 
  dplyr::summarise(defm = sum(defm))
table_defm_region2016_categorie <- table_defm_region2016_categorie %>% 
  left_join(
    table_regions_2016, 
    by = "code_region"
  )

write_csv(
  x = table_defm_region2016_categorie,
  path = "data/table_defm_region2016_categorie.csv"
  )

table_defm_france_categorie <- table_defm_departement_categorie %>% 
  group_by(date, categorie) %>% 
  dplyr::summarise(defm = sum(defm))

write_csv(
  x = table_defm_france_categorie, 
  path = "data/table_defm_france_categorie.csv"
  )




