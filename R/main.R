library(readxl)
library(dplyr)
library(tidyr)
library(lubridate)

excel_sheets("data/ser_reg_dep-rboptse88.xlsx")

clean_sheet <- function(sheet) {
  df_sheet <- read_excel(
    path = "data/ser_reg_dep-rboptse88.xlsx",
    sheet = sheet, 
    skip = 9
    )
  df_sheet = df_sheet[ ,c("Département", 
                          names(df_sheet)[
                                  grepl(
                                    pattern = "^[[:digit:]]", 
                                    names(df_sheet))
                                ])]
  df_sheet <- df_sheet %>% rename(date = Département) 
  long_sheet <- df_sheet %>% gather(key = "departement", value = "demandeurs_emploi", - date)

  return(long_sheet)
  }

excel_sheets("data/ser_reg_dep-rboptse88.xlsx")

df_abc <- clean_sheet(sheet = "Catégories ABC ensemble")
df_d <- clean_sheet(sheet = "Catégorie D")
df_e <- clean_sheet(sheet = "Catégorie E")

bourgogne_franche_comte <- c(
  "21 - Côte-d'Or", "25 - Doubs", "39 - Jura", 
  "58 - Nièvre", "70 - Haute-Saône", "71 - Saone-et-Loire", 
  "89 - Yonne", "90 - Territoire de Belfort" 
  )

df_abc %>% 
  filter(
    date == ymd("2015-11-01"), 
    departement %in% bourgogne_franche_comte) %>% 
  group_by(date) %>% 
  summarise(demandeurs_emploi = sum(demandeurs_emploi))

df_d %>% 
  filter(
    date == ymd("2015-11-01"), 
    departement %in% bourgogne_franche_comte) %>% 
  group_by(date) %>% 
  summarise(demandeurs_emploi = sum(demandeurs_emploi))


df_e %>% 
  filter(
    date == ymd("2015-11-01"), 
    departement %in% bourgogne_franche_comte) %>% 
  group_by(date) %>% 
  summarise(demandeurs_emploi = sum(demandeurs_emploi))



