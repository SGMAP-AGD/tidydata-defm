library(readxl)
library(tidyr)
library(dplyr)
library(plyr)
library(lubridate)
source("R/clean_sheet.R")
source("R/build_cog_tables.R")

list_sheets <- excel_sheets("raw-data/ser_reg_dep-rboptse88.xlsx")
list_sheets

# To be done

table_entrees_departement_abc <- clean_sheet("Entrées ABC")
table_entrees_departement_abc %>% glimpse()
table_sorties_departement_abc <- clean_sheet("Sorties ABC")

list_sheets
table_defm_departement_A_sexe 
ldply(
  .data = c("Catégorie A hommes", "Catégorie A femmes"), 
  clean_sheet, 
  .progress = "text"
) %>% 
  mutate(
    sexe = sub(
      pattern = "Catégorie A ([[:alpha:]]+)", 
      replacement = "\\1", 
      x = sheet
    ) %>% 
      glimpse()
    
    
    %>% 
      select(date, categorie, code_departement, defm)