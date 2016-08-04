
clean_sheet <- function(sheet) {
  df_sheet <- readxl::read_excel(
    path = "raw-data/ser_reg_dep-rboptse88.xlsx",
    sheet = sheet, 
    skip = 9
    )
  df_sheet = df_sheet[ ,c("Département", names(df_sheet)[grepl(
    pattern = "^[[:digit:]]", 
    names(df_sheet))
    ])]
  df_sheet <- df_sheet %>% 
    dplyr::rename(date = Département) 
  long_sheet <- df_sheet %>% 
    tidyr::gather(
      key = "departement", 
      value = "defm", 
      - date) 
  long_sheet$sheet <- sheet
  long_sheet$categorie <- sub(
    pattern = "^Catégorie[s]? ([[:upper:]]+).*", 
    replacement = "\\1", 
    x = sheet
    )
  long_sheet$date <- format(
    long_sheet$date, 
    format = "%Y-%m"
    )
  long_sheet$code_departement <- sub(
    pattern = "^([[:digit:]AB]{2,3})[[:blank:]]\\-[[:blank:]].*", 
    replacement = "\\1", 
    x = long_sheet$departement
    )
  long_sheet$defm = 1000 * long_sheet$defm
  long_sheet <- filter(long_sheet, is.na(date) == FALSE)
  return(long_sheet)
  }

## Example : 
# list_sheets <- excel_sheets("raw-data/ser_reg_dep-rboptse88.xlsx")
# clean_sheet(list_sheets[2])