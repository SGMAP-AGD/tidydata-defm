# Demandeurs d'emploi en fin de mois

Ce projet a pour objectif de mettre les données sur les demandeurs d’emploi inscrits à Pôle emploi en fin de mois dans un format facilement réutilisable.

Toutes les données sont exportées au format csv (séparateur ",") encodé en utf-8.

## Data

- [table_departements](data/table_departements.csv) :
  - code_departement
  - libelle_departement
  - code_region : code des nouvelles régions (ie millésime 2016)
- [table_regions_2016](data/table_regions_2016.csv) :
  - code_region
  - libelle_region
- [table_defm_departement_categorie](data/table_defm_departement_categorie.csv) :
  - date : année et mois au format "yyyy-mm" en chaîne de caractères
  - code_departement
  - libelle_departement
  - code_region
  - categorie : A, B, C, D ou E
  - defm : nombre de demandeurs d'emploi en fin de mois
- [table_defm_region_2016_categorie](data/table_defm_region_2016_categorie.csv) :
  - date : année et mois au format "yyyy-mm" en chaîne de caractères
  - code_region
  - libelle_region
  - categorie : A, B, C, D ou E
  - defm : nombre de demandeurs d'emploi en fin de mois
- [table_defm_france_categorie](data/table_defm_france_categorie.csv) :
  - date : année et mois au format "yyyy-mm" en chaîne de caractères
  - categorie : A, B, C, D ou E
  - defm : nombre de demandeurs d'emploi en fin de mois

## Programmes

- [download_raw_data.R](R/download_raw_data.R) : télécharge les données brutes dans le répertoire `raw-data`.
- [clean_sheet.R](R/clean_sheet.R) : une fonction qui importe les données d'une feuille du fichier xlsx source pour en extraire les informations pertinentes.
- [build_cog_tables.R](R/build_cog_tables.R) : construit les tables départementales et régionales à partir du code officiel géographique de l'Insee.
- [build_defm_tables.R](R/build_defm_tables.R) : construit les tables sur les demandeurs d'emploi en fin de mois (`defm`).
- [visualize_defm_national_categorie.R](R/visualize_defm_national_categorie.R) : visualise les séries nationales par catégorie.

## Sources

- [Les demandeurs d’emploi inscrits à Pôle emploi : données régionales, départementales et par zone d’emploi](http://dares.travail-emploi.gouv.fr/dares-etudes-et-statistiques/statistiques-de-a-a-z/article/les-demandeurs-d-emploi-inscrits-a-pole-emploi-les-series-mensuelles-regionales) (DARES)
- [Code officiel géographique](http://www.insee.fr/fr/methodes/nomenclatures/cog/telechargement.asp) (INSEE)
