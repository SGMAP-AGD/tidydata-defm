library(curl)

## DARES dataset

curl_download(
  url = "http://dares.travail-emploi.gouv.fr/IMG/xlsx/ser_reg_dep-rboptse88.xlsx", 
  destfile = "raw-data/ser_reg_dep-rboptse88.xlsx"
  )

## Code officiel géographique

url_cog = "http://www.insee.fr/fr/methodes/nomenclatures/cog/telechargement/"

curl_download(
  url = paste0(url_cog, "2016/txt/depts2016.txt"), 
  destfile = "raw-data/table_departements.tsv"
  )

system("iconv -f  WINDOWS-1252 -t UTF-8 raw-data/table_departements.tsv > raw-data/table_departements_utf8.tsv")

curl_download(
  url = paste0(url_cog, "2016/txt/reg2016.txt"),
  destfile = "raw-data/table_regions_2016.tsv"
)

system("iconv -f  WINDOWS-1252 -t UTF-8 raw-data/table_regions_2016.tsv > raw-data/table_regions_2016_utf8.tsv")
