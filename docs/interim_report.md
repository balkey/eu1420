###### **Contract No 2020CE16BAT015**

###### *Pilot project to collect, clean and asses the list of operations produced by cohesion policy programmes at national, regional level*

# Interim report

## 1. Introduction

The goal of this report is to document progress about the project specified by contract **No 2020CE16BAT015**. Though the agreement specifies the expected output of the interim report, upon agreement with the representitives of the Commission, the scope of this report was modified to the following:

- as the expectation of the first 2 month period of the named contract was to extract data from sources and load it into a structured, validated, tabular form - a database - it was agreed that at this point an analysis of the data itself is not yet possible, as this would be equal to fulfill the full requirements of the contract.

- the mapping of column values - the interpretation of the contents of each regional / national file - will happen in coordination with the data transformations, data type validations and the data cleaing itself. The end of this phase will present a unified master database along with a report about the contents of the database itself. This will be included in the final report.

- At this point it is possible to provide metadata about the accessed files and their contents: number of rows ingested, number of columns detected.

- Current report will also include the structured data table of distinct column names for coordination with the representatives of the Commision: we find it beneficiary that the there's a common agreement of what the column names represent at each regional and national file. Therefore the interpretation and translation is mutually agreed and approved.

## 2. Programme codes with no endpoints

The following programme codes were missing endpoints, therefore a file could not be accessed:

```
country|programme code |
-------|---------------|
CY     |2014CY16M1OP001|
FI     |2014FI05M2OP001|
FI     |2014FI16M2OP001|
FI     |2016FI16RFSM001|
GR     |2014GR05M2OP001|
GR     |2014GR16M2OP002|
GR     |2014GR16M2OP003|
GR     |2014GR16M2OP004|
GR     |2014GR16M2OP005|
GR     |2014GR16M2OP006|
GR     |2014GR16M2OP008|
GR     |2014GR16M2OP009|
GR     |2014GR16M2OP010|
GR     |2014GR16M2OP011|
GR     |2014GR16M2OP012|
GR     |2014GR16M2OP013|
GR     |2014GR16M2OP014|
GR     |2014GR16M3TA001|
MT     |2014MT16M1OP001|
MT     |2014MT16RFSM001|
NL     |2014NL16RFOP001|
PL     |2014PL16M2OP002|
PL     |2014PL16M2OP003|
PL     |2014PL16M2OP004|
PT     |2014PT16M2OP002|
PT     |2014PT16M2OP004|
PT     |2014PT16RFTA001|
SE     |2014SE16M2OP001|
SE     |2014SE16RFOP001|
SE     |2014SE16RFOP002|
SE     |2014SE16RFOP003|
SE     |2014SE16RFOP004|
SE     |2014SE16RFOP005|
SE     |2014SE16RFOP006|
SE     |2014SE16RFOP007|
SE     |2014SE16RFOP008|
SE     |2014SE16RFOP009|
SK     |2014SK05M0OP001|
SK     |2014SK16M1OP001|
SK     |2014SK16RFOP001|
SK     |2014SK16RFTA001|
TC     |2014TC16I5CB001|
TC     |2014TC16I5CB002|
TC     |2014TC16I5CB003|
TC     |2014TC16I5CB004|
TC     |2014TC16I5CB008|
TC     |2014TC16I5CB010|
TC     |2014TC16M5TN001|
TC     |2014TC16M6TN001|
TC     |2014TC16RFCB002|
TC     |2014TC16RFCB003|
TC     |2014TC16RFCB005|
TC     |2014TC16RFCB010|
TC     |2014TC16RFCB011|
TC     |2014TC16RFCB012|
TC     |2014TC16RFCB013|
TC     |2014TC16RFCB016|
TC     |2014TC16RFCB018|
TC     |2014TC16RFCB020|
TC     |2014TC16RFCB021|
TC     |2014TC16RFCB022|
TC     |2014TC16RFCB024|
TC     |2014TC16RFCB026|
TC     |2014TC16RFCB027|
TC     |2014TC16RFCB028|
TC     |2014TC16RFCB030|
TC     |2014TC16RFCB032|
TC     |2014TC16RFCB033|
TC     |2014TC16RFCB035|
TC     |2014TC16RFCB036|
TC     |2014TC16RFCB037|
TC     |2014TC16RFCB040|
TC     |2014TC16RFCB042|
TC     |2014TC16RFCB043|
TC     |2014TC16RFCB044|
TC     |2014TC16RFCB049|
TC     |2014TC16RFCB051|
TC     |2014TC16RFCB052|
TC     |2014TC16RFCB056|
TC     |2014TC16RFIR002|
TC     |2014TC16RFIR003|
TC     |2014TC16RFIR004|
TC     |2014TC16RFTN001|
TC     |2014TC16RFTN004|
TC     |2014TC16RFTN005|
TC     |2014TC16RFTN008|
TC     |2014TC16RFTN010|
UK     |2014UK16RFOP003|
```

## 3. Endpoints with multiple programme codes

The following programme codes were associated with the same endpoint, therefore a 1:1 relationship could not be established between the two.

```
country|reference|reference_array                                                                                                                                                                                                                  |
-------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
CZ     |2014CZ   |{2014CZ16RFOP001,2014CZ16RFOP002,2014CZ16M1OP001,2014CZ16M1OP002,2014CZ16M2OP001,2014CZ16CFTA001,2014CZ05M2OP001}                                                                                                                |
FR     |2014FR   |{2014FR16RFOP001,2014FR16M0OP013}                                                                                                                                                                                                |
FR     |2014FR   |{2014FR05M2OP001,2014FR16M0OP009}                                                                                                                                                                                                |
FR     |2014FR   |{2014FR16M0OP008,2014FR16M0OP012}                                                                                                                                                                                                |
FR     |2014FR   |{2014FR16M2OP009,2014FR16M2OP006,2014FR16M0OP001}                                                                                                                                                                                |
FR     |2014FR   |{2014FR16RFOP002,2014FR16M2OP003,2014FR16M2TA001,2014FR16M0OP002,2014FR16M0OP003,2014FR16M0OP005,2014FR16M2OP001,2014FR16M2OP004,2014FR16M2OP008,2014FR16M2OP010,2014FR16M2OP011,2014FR16M2OP012,2014FR16RFOP003,2014FR16RFOP005}|
HU     |2014HU   |{2014HU16M2OP001,2014HU16M0OP001,2014HU16M1OP001,2014HU16M1OP003,2014HU05M3OP001,2014HU16M2OP002,2014HU05M2OP001}                                                                                                                |
PL     |2014PL   |{2014PL16CFTA001,2014PL16M1OP001}                                                                                                                                                                                                |
RO     |2014RO   |{2014RO16RFOP001,2014RO16M1OP001,2014RO16RFOP002,2014RO16RFTA001,2014RO16RFSM001}                                                                                                                                                |
UK     |2014UK   |{2014UK16RFOP005,2014UK16RFOP006}                                                                                                                                                                                                |
```

## 4. Unsuccessful file downloads

An error was repeatedly encountered while trying to access the following endpoints, therefore the files could not be retrieved:

```
country|reference      |endpoint                                                      |
-------|---------------|--------------------------------------------------------------|
GR     |2014GR16M1OP001|https://www.espa.gr/el/Documents/ListOfOperations_20200128.zip|
```

## 5. Unsuccessful uncompressions

All files were successfully uncompressed, we encountered no errors.

## 6. Unsuccessfull file conversions and corrupted files

The following downloaded files were corrupted to the extent that we couldn't access their contents:

```
country|reference      |endpoint                                                                                     |
-------|---------------|---------------------------------------------------------------------------------------------|
TC     |2014TC16RFCB015|http://www.skhu.eu/_projectxls                                                               |
TC     |2014TC16RFCB017|https://www.sn-cz2020.eu/media/de_cs/einzelne_dokumente/20-03-19_Liste_der_Vorhaben.xlsx     |
TC     |2014TC16RFCB025|http://pl.cz-pl.eu/obsah/soubory/734/ogolna-lista-zatwierdzonych-projektow-do-24.06.2019.xlsx|
TC     |2014TC16RFCB029|http://pl.cz-pl.eu/ogoszenia-o-naborach-wnioskow-i-zatwierdzone-projekty                     |
```

## 7. Unsuccessfull character encodings

Character encoding contained some errors where the source was in .csv format and the file contained non UTF-8 characters. We decided to discard these characters, thus saving the rest of the file contents. The extent of truncation is yet not examined - if at a later stage it becomes apparent that the content was damaged to an extent that the result is unusable, we will revisit the problem of missing non UTF-8 character encodings, and will possibly advise on supporting these files with probable character encodings based no the countries native language they are sourced from.

## 8. Files with no header or detectable tabular structure

For the following programme codes and files it was either not possible to detect a valid header or the data could not be converted to a tabular structure. The `file_sheet_index` following the underscore appended to the programme codes indicate the worksheet's index within the original source file workbook, or if there's multiple files belonging to the same programme code, their index according to alphabetical order. Most cases included here are just not tabular data: the worksheet within the workbook contains some sort of description or free text addition to the data. 

```
country|reference      |reference_array                                                                                                  |endpoint                                                                                                                                                                                                                                                       |file_sheet_index|
-------|---------------|-----------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|
CZ     |2014CZ         |{2014CZ16RFOP001,2014CZ16RFOP002,2014CZ16M1OP001,2014CZ16M1OP002,2014CZ16M2OP001,2014CZ16CFTA001,2014CZ05M2OP001}|https://www.dotaceeu.cz/getmedia/c654292a-a424-428e-95f1-4c28baccd7a9/2019_03_01-M023a-Seznam-operaci-_-List-of-operations_1.xls.aspx?ext=.xls                                                                                                                 |2               |
DE     |2014DE16RFOP005|{2014DE16RFOP005}                                                                                                |https://www.efre-bremen.de/sixcms/media.php/13/2019-12-31_Liste%20der%20Vorhaben.xlsx                                                                                                                                                                          |2               |
EE     |2014EE16M3OP001|{2014EE16M3OP001}                                                                                                |https://www.struktuurifondid.ee/eng/toetatud-projektid/toetatud_projektid.csv                                                                                                                                                                                  |1               |
GR     |2014GR16M2OP007|{2014GR16M2OP007}                                                                                                |http://stereaellada.gr/wp-content/uploads/2018/02/%CE%9A%CE%91%CE%A4%CE%91%CE%9B%CE%9F%CE%93%CE%9F%CE%A3-%CE%A0%CE%A1%CE%91%CE%9E%CE%95%CE%A9%CE%9D-%CE%99%CE%91%CE%9D%CE%9F%CE%A5%CE%91%CE%A1%CE%99%CE%9F%CE%A3-2018-1.xls                                    |2               |
GR     |2014GR16M2OP007|{2014GR16M2OP007}                                                                                                |http://stereaellada.gr/wp-content/uploads/2018/10/%CE%92-%CE%95%CE%9E%CE%91%CE%9C%CE%97%CE%9D%CE%9F-2018-%CE%9F%CE%B9%CE%BA%CE%BF%CE%BD%CE%BF%CE%BC%CE%B9%CE%BA%CE%AC-%CF%83%CF%84%CE%BF%CE%B9%CF%87%CE%B5%CE%AF%CE%B1-%CE%AD%CF%81%CE%B3%CF%89%CE%BD-1.xlsx   |2               |
HU     |2014HU         |{2014HU16M2OP001,2014HU16M0OP001,2014HU16M1OP001,2014HU16M1OP003,2014HU05M3OP001,2014HU16M2OP002,2014HU05M2OP001}|                                                                                                                                                                                                                                                               |2               |
PL     |2014PL16M2OP007|{2014PL16M2OP007}                                                                                                |https://www.funduszedlamazowsza.eu/wp-content/uploads/2019/03/lista-projektow-konkursowych.xlsx                                                                                                                                                                |2               |
PT     |2014PT16CFOP001|{2014PT16CFOP001}                                                                                                |https://poseur.portugal2020.pt/umbraco/Surface/Candidatura/ExportCSVCandidaturas                                                                                                                                                                               |1               |
PT     |2014PT16M2OP007|{2014PT16M2OP007}                                                                                                |https://algarve2020.eu/info/sites/algarve2020.eu/files/candidaturas/20200414_quadro_ii_operacoes_aprovadas_31-03-2020.xlsx                                                                                                                                     |2               |
PT     |2014PT16M2OP007|{2014PT16M2OP007}                                                                                                |https://algarve2020.eu/info/sites/algarve2020.eu/files/candidaturas/20200414_quadro_ii_operacoes_aprovadas_31-03-2020.xlsx                                                                                                                                     |3               |
RO     |2014RO         |{2014RO16RFOP001,2014RO16M1OP001,2014RO16RFOP002,2014RO16RFTA001,2014RO16RFSM001}                                |http://www.fonduri-ue.ro/images/files/implementare-absorbtie/2017/Lista_Proiecte_contractate_-_01.2018.zip                                                                                                                                                     |11              |
RO     |2014RO         |{2014RO16RFOP001,2014RO16M1OP001,2014RO16RFOP002,2014RO16RFTA001,2014RO16RFSM001}                                |http://www.fonduri-ue.ro/images/files/implementare-absorbtie/2017/Lista_Proiecte_contractate_-_01.2018.zip                                                                                                                                                     |14              |
RO     |2014RO         |{2014RO16RFOP001,2014RO16M1OP001,2014RO16RFOP002,2014RO16RFTA001,2014RO16RFSM001}                                |http://www.fonduri-ue.ro/images/files/implementare-absorbtie/2017/Lista_Proiecte_contractate_-_01.2018.zip                                                                                                                                                     |15              |
RO     |2014RO         |{2014RO16RFOP001,2014RO16M1OP001,2014RO16RFOP002,2014RO16RFTA001,2014RO16RFSM001}                                |http://www.fonduri-ue.ro/images/files/implementare-absorbtie/2017/Lista_Proiecte_contractate_-_01.2018.zip                                                                                                                                                     |16              |
RO     |2014RO         |{2014RO16RFOP001,2014RO16M1OP001,2014RO16RFOP002,2014RO16RFTA001,2014RO16RFSM001}                                |http://www.fonduri-ue.ro/images/files/implementare-absorbtie/2017/Lista_Proiecte_contractate_-_01.2018.zip                                                                                                                                                     |17              |
RO     |2014RO         |{2014RO16RFOP001,2014RO16M1OP001,2014RO16RFOP002,2014RO16RFTA001,2014RO16RFSM001}                                |http://www.fonduri-ue.ro/images/files/implementare-absorbtie/2017/Lista_Proiecte_contractate_-_01.2018.zip                                                                                                                                                     |4               |
TC     |2014TC16RFCB006|{2014TC16RFCB006}                                                                                                |https://www.poctefa.eu/wp-content/uploads/2018/05/Listado-proyectos-programados_FR_180518.xlsx                                                                                                                                                                 |2               |
TC     |2014TC16RFCB039|{2014TC16RFCB039}                                                                                                |https://www.interreg-rhin-sup.eu/wp-content/uploads/projets-acceptes-angenommenen-projekten-12122019-1.xlsx                                                                                                                                                    |7               |
TC     |2014TC16RFCB047|{2014TC16RFCB047}                                                                                                |http://seupb.eu/sites/default/files/styles/INTERREGVA/Jun_Beneficiaries_Spreadsheet_INTERREG_Webcopy_English.xlsx                                                                                                                                              |2               |
TC     |2014TC16RFPC001|{2014TC16RFPC001}                                                                                                |http://seupb.eu/sites/default/files/styles/PEACEIV/Apr_Beneficiaries_Spreadsheet_PEACE_Webcopy_English_0.XLSX                                                                                                                                                  |2               |
UK     |2014UK         |{2014UK16RFOP005,2014UK16RFOP006}                                                                                |https://gov.wales/sites/default/files/publications/2020-02/eu-structural-funds-programme-2014-to-2020-approved-projects.ods                                                                                                                                    |2               |
UK     |2014UK16RFOP004|{2014UK16RFOP004}                                                                                                |https://www.gov.scot/binaries/content/documents/govscot/publications/transparency-data/2018/06/esif-operations-funding/documents/esf-and-erdf-operations-funding-approved-to-july-2019/esf-and-erdf-operations-funding-approved-to-july-2019/govscot%3Adocument|2               |
```

## 9. Resultset 1: number of rows by country code

The following report contains all the loaded files and their row counts aggregated on a country level. Please mind that the contents of the rows themselves are not analysed at this stage: there could be incomplete rows included here, which could be discarded from the final master dataset.

```
country_code|nr_of_files|nr_of_rows|
------------|-----------|----------|
AT          |          1|      1264|
BE          |          9|      3961|
BG          |          6|      2634|
CZ          |          1|     33478|
DE          |         13|     41703|
DK          |          1|       287|
ES          |         21|     61171|
FR          |         12|      7503|
GR          |          2|     23571|
HR          |          1|      2666|
HU          |          1|     37557|
IE          |          2|       772|
IT          |          3|    391491|
LU          |          1|        29|
LV          |          1|      1774|
NL          |          3|       667|
PL          |         16|     38254|
PT          |         11|     46111|
RO          |         13|      2478|
SI          |          1|      4945|
SK          |         12|     11953|
TC          |         61|     13972|
UK          |          6|      1888|
```

## 10. Resultset 2: number of rows by programme code

The following report contains the number of files and rows loaded by programme code:

```
programme_code |nr_of_files|nr_of_rows|
---------------|-----------|----------|
2014AT16RFOP001|          1|      1264|
2014BE16RFOP001|          7|      3036|
2014BE16RFOP002|          1|       204|
2014BE16RFOP003|          1|       721|
2014BG05M2OP001|          1|       159|
2014BG16M1OP001|          1|        17|
2014BG16M1OP002|          1|        30|
2014BG16RFOP001|          1|       416|
2014BG16RFOP002|          1|      2012|
2014CZ         |          1|     33478|
2014DE16M2OP001|          1|     11511|
2014DE16RFOP002|          1|       591|
2014DE16RFOP003|          1|      2316|
2014DE16RFOP004|          1|      1557|
2014DE16RFOP005|          1|       288|
2014DE16RFOP006|          1|        68|
2014DE16RFOP007|          1|       392|
2014DE16RFOP009|          1|      3047|
2014DE16RFOP011|          1|       236|
2014DE16RFOP012|          1|     12371|
2014DE16RFOP013|          1|      3381|
2014DE16RFOP014|          1|      1035|
2014DE16RFOP015|          1|      4910|
2014DK16RFOP001|          1|       287|
2014ES16RFOP002|          1|     33012|
2014ES16RFOP003|          1|      2710|
2014ES16RFOP004|          1|       486|
2014ES16RFOP005|          1|       842|
2014ES16RFOP006|          1|       437|
2014ES16RFOP007|          1|      1016|
2014ES16RFOP008|          1|       313|
2014ES16RFOP009|          1|       685|
2014ES16RFOP010|          1|      1185|
2014ES16RFOP011|          1|      1217|
2014ES16RFOP012|          1|       262|
2014ES16RFOP013|          1|      2136|
2014ES16RFOP014|          1|      6217|
2014ES16RFOP015|          1|      4015|
2014ES16RFOP016|          1|       203|
2014ES16RFOP017|          1|       394|
2014ES16RFOP018|          1|       214|
2014ES16RFOP019|          1|      2353|
2014ES16RFOP020|          1|       470|
2014ES16RFOP021|          1|      2998|
2014ES16RFSM001|          1|         6|
2014FR         |          1|       264|
2014FR05M0OP001|          1|       906|
2014FR16M0OP004|          1|       454|
2014FR16M0OP006|          1|      1086|
2014FR16M0OP007|          1|      1139|
2014FR16M0OP011|          1|       561|
2014FR16M0OP014|          1|       997|
2014FR16M0OP015|          1|      1262|
2014FR16M2OP005|          1|       436|
2014FR16RFOP004|          1|        40|
2014FR16RFOP006|          1|       208|
2014FR16RFOP007|          1|       150|
2014GR16M2OP001|          1|     23470|
2014GR16M2OP007|          1|       101|
2014HR16M1OP001|          1|      2666|
2014HU         |          1|     37557|
2014IE16RFOP001|          1|       420|
2014IE16RFOP002|          1|       352|
2014ITERDF     |          1|     62638|
2014ITERDFTC   |          1|       744|
2014ITESF      |          1|    328109|
2014LU16RFOP001|          1|        29|
2014LV16MAOP001|          1|      1774|
2014NL16RFOP002|          1|       131|
2014NL16RFOP003|          1|       148|
2014NL16RFOP004|          1|       388|
2014PL16M2OP001|          1|       211|
2014PL16M2OP005|          1|       234|
2014PL16M2OP006|          1|       236|
2014PL16M2OP007|          1|      2708|
2014PL16M2OP008|          1|      1464|
2014PL16M2OP009|          1|      2891|
2014PL16M2OP010|          1|       135|
2014PL16M2OP011|          1|      1765|
2014PL16M2OP012|          1|      4396|
2014PL16M2OP013|          1|      7602|
2014PL16M2OP014|          1|      3832|
2014PL16M2OP015|          1|      3303|
2014PL16M2OP016|          1|      1523|
2014PL16RFOP001|          1|      6327|
2014PL16RFOP002|          1|       471|
2014PL16RFOP003|          1|      1156|
2014PT16M2OP001|          7|     34837|
2014PT16M2OP003|          1|      3796|
2014PT16M2OP005|          1|      3005|
2014PT16M2OP006|          1|      3460|
2014PT16M2OP007|          1|      1013|
2014RO         |         13|      2478|
2014SI16MAOP001|          1|      4945|
2014SK         |          1|      8607|
2014SK16M1OP002|          2|      1135|
2014SK16RFOP002|          9|      2211|
2014TC16I5CB005|          1|        78|
2014TC16I5CB006|          1|        65|
2014TC16I5CB007|          1|        68|
2014TC16I5CB009|          2|       246|
2014TC16M4TN001|          1|       130|
2014TC16M4TN002|          1|        42|
2014TC16M4TN003|          2|        43|
2014TC16RFCB001|          1|       345|
2014TC16RFCB004|          1|        78|
2014TC16RFCB006|          1|       416|
2014TC16RFCB007|          1|       467|
2014TC16RFCB008|          1|        63|
2014TC16RFCB009|          3|       412|
2014TC16RFCB014|          1|       765|
2014TC16RFCB019|          1|        41|
2014TC16RFCB023|          1|      1705|
2014TC16RFCB034|          1|       319|
2014TC16RFCB038|          2|       949|
2014TC16RFCB039|         14|       216|
2014TC16RFCB041|          1|       100|
2014TC16RFCB045|          1|        54|
2014TC16RFCB046|          2|      1183|
2014TC16RFCB047|          1|        32|
2014TC16RFCB048|          1|        20|
2014TC16RFCB050|          1|       211|
2014TC16RFCB053|          3|       219|
2014TC16RFCB054|          3|       693|
2014TC16RFCB055|          2|       172|
2014TC16RFIR001|          1|      2089|
2014TC16RFPC001|          1|        95|
2014TC16RFTN002|          1|        54|
2014TC16RFTN003|          3|       994|
2014TC16RFTN006|          1|       978|
2014TC16RFTN007|          1|       480|
2014TC16RFTN009|          1|       150|
2014UK         |          1|       253|
2014UK16RFOP001|          1|      1248|
2014UK16RFOP002|          3|        92|
2014UK16RFOP004|          1|       295|
2015BG16RFSM001|          1|         0|
```

## 10. Resultset 3: number of columns and rows by programme code and file

The following report contains all the loaded files their column counts and their rows counts. Please mind that the contents of the columns and rows themselves are not analysed at this stage: there could be incomplete rows or columns included here, which could be discarded from the final master dataset.

```
table_name        |nr_of_columns|nr_of_rows|
------------------|-------------|----------|
2014AT16RFOP001_1 |           10|      1264|
2014BE16RFOP001_1 |           13|       182|
2014BE16RFOP001_2 |           13|      1402|
2014BE16RFOP001_3 |           17|        52|
2014BE16RFOP001_4 |           13|        22|
2014BE16RFOP001_5 |           13|        26|
2014BE16RFOP001_6 |           13|       664|
2014BE16RFOP001_7 |           13|       688|
2014BE16RFOP002_1 |           13|       204|
2014BE16RFOP003_1 |           20|       721|
2014BG05M2OP001_1 |           10|       159|
2014BG16M1OP001_1 |           10|        17|
2014BG16M1OP002_1 |           10|        30|
2014BG16RFOP001_1 |           10|       416|
2014BG16RFOP002_1 |           10|      2012|
2014CZ_1          |           29|     33478|
2014DE16M2OP001_1 |           12|     11511|
2014DE16RFOP002_1 |           14|       591|
2014DE16RFOP003_1 |           11|      2316|
2014DE16RFOP004_1 |           10|      1557|
2014DE16RFOP005_1 |           11|       288|
2014DE16RFOP006_1 |           15|        68|
2014DE16RFOP007_1 |           12|       392|
2014DE16RFOP009_1 |           14|      3047|
2014DE16RFOP011_1 |           11|       236|
2014DE16RFOP012_1 |           16|     12371|
2014DE16RFOP013_1 |           11|      3381|
2014DE16RFOP014_1 |           10|      1035|
2014DE16RFOP015_1 |           10|      4910|
2014DK16RFOP001_1 |           21|       287|
2014ES16RFOP002_1 |           21|     33012|
2014ES16RFOP003_1 |           21|      2710|
2014ES16RFOP004_1 |           20|       486|
2014ES16RFOP005_1 |           20|       842|
2014ES16RFOP006_1 |           21|       437|
2014ES16RFOP007_1 |           21|      1016|
2014ES16RFOP008_1 |           20|       313|
2014ES16RFOP009_1 |           20|       685|
2014ES16RFOP010_1 |           21|      1185|
2014ES16RFOP011_1 |           21|      1217|
2014ES16RFOP012_1 |           21|       262|
2014ES16RFOP013_1 |           21|      2136|
2014ES16RFOP014_1 |           20|      6217|
2014ES16RFOP015_1 |           21|      4015|
2014ES16RFOP016_1 |           20|       203|
2014ES16RFOP017_1 |           21|       394|
2014ES16RFOP018_1 |           21|       214|
2014ES16RFOP019_1 |           20|      2353|
2014ES16RFOP020_1 |           21|       470|
2014ES16RFOP021_1 |           21|      2998|
2014ES16RFSM001_1 |           13|         6|
2014FR05M0OP001_1 |           11|       906|
2014FR16M0OP004_1 |           17|       454|
2014FR16M0OP006_1 |           12|      1086|
2014FR16M0OP007_1 |           13|      1139|
2014FR16M0OP011_1 |           10|       561|
2014FR16M0OP014_1 |           12|       997|
2014FR16M0OP015_1 |           15|      1262|
2014FR16M2OP005_1 |           12|       436|
2014FR16RFOP004_1 |           13|        40|
2014FR16RFOP006_1 |           15|       208|
2014FR16RFOP007_1 |           11|       150|
2014FR_1          |           11|       264|
2014GR16M2OP001_1 |           13|     23470|
2014GR16M2OP007_1 |           32|       101|
2014HR16M1OP001_1 |           12|      2666|
2014HU_1          |           15|     37557|
2014IE16RFOP001_1 |            9|       420|
2014IE16RFOP002_1 |           14|       352|
2014ITERDFTC_1    |          163|       744|
2014ITERDF_1      |          181|     62638|
2014ITESF_1       |          156|    328109|
2014LU16RFOP001_1 |           12|        29|
2014LV16MAOP001_1 |           71|      1774|
2014NL16RFOP002_1 |           32|       131|
2014NL16RFOP003_1 |           27|       148|
2014NL16RFOP004_1 |           33|       388|
2014PL16M2OP001_1 |           16|       211|
2014PL16M2OP005_1 |           14|       234|
2014PL16M2OP006_1 |           10|       236|
2014PL16M2OP007_1 |           23|      2708|
2014PL16M2OP008_1 |           25|      1464|
2014PL16M2OP009_1 |           25|      2891|
2014PL16M2OP010_1 |           11|       135|
2014PL16M2OP011_1 |           24|      1765|
2014PL16M2OP012_1 |           25|      4396|
2014PL16M2OP013_1 |           12|      7602|
2014PL16M2OP014_1 |           25|      3832|
2014PL16M2OP015_1 |           17|      3303|
2014PL16M2OP016_1 |           25|      1523|
2014PL16RFOP001_1 |           25|      6327|
2014PL16RFOP002_1 |           25|       471|
2014PL16RFOP003_1 |           23|      1156|
2014PT16M2OP001_1 |            5|      3661|
2014PT16M2OP001_2 |            5|      6773|
2014PT16M2OP001_3 |           32|      5716|
2014PT16M2OP001_4 |           32|      1381|
2014PT16M2OP001_5 |           33|      3660|
2014PT16M2OP001_6 |           20|      5041|
2014PT16M2OP001_7 |           21|      8605|
2014PT16M2OP003_1 |           20|      3796|
2014PT16M2OP005_1 |           20|      3005|
2014PT16M2OP006_1 |           17|      3460|
2014PT16M2OP007_1 |           19|      1013|
2014RO_1          |           10|        18|
2014RO_10         |           26|       336|
2014RO_12         |           31|        67|
2014RO_13         |           16|       382|
2014RO_18         |           26|       212|
2014RO_19         |           14|       890|
2014RO_2          |           13|       272|
2014RO_3          |           13|        13|
2014RO_5          |            8|       139|
2014RO_6          |           13|        13|
2014RO_7          |           12|        66|
2014RO_8          |           24|        61|
2014RO_9          |            9|         9|
2014SI16MAOP001_1 |           24|      4945|
2014SK16M1OP002_1 |           13|       568|
2014SK16M1OP002_2 |            5|       567|
2014SK16RFOP002_1 |            7|       816|
2014SK16RFOP002_2 |            7|       176|
2014SK16RFOP002_3 |            7|       102|
2014SK16RFOP002_4 |            7|        53|
2014SK16RFOP002_5 |            7|       675|
2014SK16RFOP002_6 |            7|       223|
2014SK16RFOP002_7 |            7|        87|
2014SK16RFOP002_8 |            7|        51|
2014SK16RFOP002_9 |            7|        28|
2014SK_1          |           19|      8607|
2014TC16I5CB005_1 |           12|        78|
2014TC16I5CB006_1 |           12|        65|
2014TC16I5CB007_1 |           12|        68|
2014TC16I5CB009_1 |            8|        43|
2014TC16I5CB009_2 |            5|       203|
2014TC16M4TN001_1 |           16|       130|
2014TC16M4TN002_1 |           15|        42|
2014TC16M4TN003_1 |           14|        20|
2014TC16M4TN003_2 |           14|        23|
2014TC16RFCB001_1 |           14|       345|
2014TC16RFCB004_1 |           12|        78|
2014TC16RFCB006_1 |           16|       416|
2014TC16RFCB007_1 |           14|       467|
2014TC16RFCB008_1 |           13|        63|
2014TC16RFCB009_1 |           14|        26|
2014TC16RFCB009_2 |           14|        43|
2014TC16RFCB009_3 |           14|       343|
2014TC16RFCB014_1 |           15|       765|
2014TC16RFCB019_1 |           19|        41|
2014TC16RFCB023_1 |           14|      1705|
2014TC16RFCB034_1 |           16|       319|
2014TC16RFCB038_1 |           16|       864|
2014TC16RFCB038_2 |           28|        85|
2014TC16RFCB039_1 |           16|        10|
2014TC16RFCB039_10|           16|        12|
2014TC16RFCB039_11|           16|        22|
2014TC16RFCB039_12|           16|         9|
2014TC16RFCB039_13|           16|        15|
2014TC16RFCB039_14|           16|        17|
2014TC16RFCB039_15|           16|        18|
2014TC16RFCB039_2 |           16|        12|
2014TC16RFCB039_3 |           16|        23|
2014TC16RFCB039_4 |           16|        29|
2014TC16RFCB039_5 |           16|         7|
2014TC16RFCB039_6 |           16|         9|
2014TC16RFCB039_8 |           16|        25|
2014TC16RFCB039_9 |           16|         8|
2014TC16RFCB041_1 |           17|       100|
2014TC16RFCB045_1 |           35|        54|
2014TC16RFCB046_1 |           20|        81|
2014TC16RFCB046_2 |           18|      1102|
2014TC16RFCB047_1 |           17|        32|
2014TC16RFCB048_1 |           10|        20|
2014TC16RFCB050_1 |           14|       211|
2014TC16RFCB053_1 |           17|        73|
2014TC16RFCB053_2 |           17|        73|
2014TC16RFCB053_3 |           17|        73|
2014TC16RFCB054_1 |           17|       231|
2014TC16RFCB054_2 |           17|       231|
2014TC16RFCB054_3 |           17|       231|
2014TC16RFCB055_1 |           25|        30|
2014TC16RFCB055_2 |           21|       142|
2014TC16RFIR001_1 |           13|      2089|
2014TC16RFPC001_1 |           17|        95|
2014TC16RFTN002_1 |           12|        54|
2014TC16RFTN003_1 |           13|        85|
2014TC16RFTN003_2 |           12|       901|
2014TC16RFTN003_3 |            2|         8|
2014TC16RFTN006_1 |            9|       978|
2014TC16RFTN007_1 |           19|       480|
2014TC16RFTN009_1 |           11|       150|
2014UK16RFOP001_1 |           14|      1248|
2014UK16RFOP002_1 |           11|        48|
2014UK16RFOP002_2 |            9|        36|
2014UK16RFOP002_3 |            8|         8|
2014UK16RFOP004_1 |           17|       295|
2014UK_1          |           16|       253|
2015BG16RFSM001_1 |           10|         0|
```

## 11. Resultset 4: List of individual columns

This list is accessible [online here](https://docs.google.com/spreadsheets/d/1cdzdbCMk5faY77_MPwnuYzFtW14_brak5oLKz8XrKU4/edit?usp=sharing), as it is too long to include in this report.
