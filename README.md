# eu1420
Collecting EU subsidies for the 2014-2020 program.

## GOAL

The goal of this project is to create a database for the operations in the cohesion policy programmes in the 2014 - 2020 funding cycle among the EU 27 + United Kingdom member states, including interreg programmes. The project is a software solution that self-documents the collection of named datasets, and makes all operations and procedures (accessing, transforming, cleaning, converting, etc.) programatically reproducible, automated and extendible.

The initial list of data sources was provided by the the European Commission. It was not within the scope of the project to research and collect all transactions within the 2014 - 2020 funding cycle - upon agreement only file-based, programatically accessible and computer readable sources were included, therefore data only existing in HTML format for example was outside of the scope. As the framework is extendible, it allows the technical user to include additional datasources that were not part of the project originally.

## DATA STRUCTURE

The final deliverable of the project is a master database that includes the following fields:

- beneficiary name
- operation name
- operation summary
- operation start date
- operation end date
- total eligible expenditure allocated to the operation
- Union co-financing rate
- operation postcode or any location indictor
- country
- name of category of intervention
- date of last update of list of operations

## DEPLOYMENT

#### Clone the repository

```
$ git clone https://github.com/balkey/eu1420.git
```

### Install PostgreSQL

The project was tested on PostgreSQL 12.2. You could either install and run a PostgreSQL server locally, or use a hosted database. In case you want to run locally, install PostgreSQL [following this tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04).

Create your user with a role allowing to create schemas and tables. Create a database you will use.

Include your database connection details in an environmental file, following the example [here](https://github.com/balkey/eu1420/tree/master/config).

#### Create a `.pgpass` file with your credenitals in `/home/usr/`:

Read [here](https://www.postgresql.org/docs/9.4/libpq-pgpass.html) on the formating convention. Don't forget to grant executive permissions on the file:

```
$ chmod 0600 ~/.pgpass
```

### Install Python3

It is strongly recommended to deploy the project in a virtual environment. We recommend virtualenv. [Follow this tutorial](https://gist.github.com/frfahim/73c0fad6350332cef7a653bcd762f08d) to install Python3!

#### Install pip3 for Python3

```
$ sudo apt install python3-pip
```

### Install dependencies

Once you set up Python and PostgreSQL, it is time to install dependencies for the project. Simply run in the project's root folder:

```
$ pip3 install -r requirements.txt
```

That's it, you should be ready to go!

### Include config files

Make sure you have included all necessary configuration files. YOu can see examples in the [config folder](https://github.com/balkey/eu1420/tree/master/config).

## SHORT MANUAL

There's two ways to run the entire project: either falling back to previously downloaded files, or downloading them from scratch. We strongly recommend using previously downloaded files as there's no guarantee that newly downloaded files will respect the data structures defined in the project, so it is very likely that you'll get errors that way.

You can also add new files to the existing ones, simply copy them to the `data/source` folder.

Make sure you keep the `data/source/[COUNTRY_CODE]/[PROGAME_CODE]/file.xlsx` convention when adding new files!

In case you already have included the files in the `data/source` folder, simply run in the project's root folder:

```
$ make
```

In case you want to newly download the sourcefiles, you need to download them from a Google Sheets first, using the Google Sheets API. See an [example sheet here](https://docs.google.com/spreadsheets/d/1ZXkIOly8p6bSCed42YBd9KyYCbDyrnkSp8_MfJ6JXtk/edit#gid=0).

Then see the how the sheet is downloaded [here](https://github.com/balkey/eu1420/blob/master/makefile#L131). You can also just copy your source file to `data/source/operations_list.csv` - in this case, make sure to comment out the command downloading the sheet from the Google Sheets API.

The minimal data requirement is the following for your `operations_list.csv` file:

country|reference      |endpoint                                                                                                                                      |access |fileformat|compressed|
-------|---------------|----------------------------------------------------------------------------------------------------------------------------------------------|-------|----------|----------|
AT     |2014AT16RFOP001|https://www.efre.gv.at/fileadmin/user_upload/downloadcenter/Vorhabensliste/Vorhabensliste_IWB_EFRE_AT2014-2020_Download.xlsx                  |online |xlsx      |         0|
BE     |2014BE16RFOP003|http://europe.wallonie.be/sites/default/files/20200212_Waleurope.csv                                                                          |online |csv       |         0|
BG     |2014BG16RFOP002|http://2020.eufunds.bg/en/0/0/Operations/ExportToXml?ProgrammeId=4r0ewAFDkOc%3D&ShowRes=True                                                  |online |xml       |         0|
CY     |2014CY16M1OP001|                                                                                                                                              |missing|          |         0|
CZ     |2014CZ16RFOP001|https://www.dotaceeu.cz/getmedia/c654292a-a424-428e-95f1-4c28baccd7a9/2019_03_01-M023a-Seznam-operaci-_-List-of-operations_1.xls.aspx?ext=.xls|online |xls       |         0|
DE     |2014DE16RFOP001|https://efre-bw.de/wp-content/uploads/Liste-der-Vorhaben_2019-09-30.xlsx                                                                      |online |xlsx      |         0|
DK     |2014DK16RFOP001|https://regionalt.erhvervsstyrelsen.dk/eu-projekt-eksport.csv                                                                                 |online |csv       |         0|
EE     |2014EE16M3OP001|https://www.struktuurifondid.ee/eng/toetatud-projektid/toetatud_projektid.csv                                                                 |online |csv       |         0|
ES     |2014ES16RFOP003|https://www.dgfc.sepg.hacienda.gob.es/sitios/dgfc/es-ES/loFEDER1420/porFEDER/Documents/LO-AN.xlsx                                             |online |xlsx      |         0|
FI     |2014FI05M2OP001|                                                                                                                                              |missing|          |         0|
FR     |2014FR16RFOP006|http://europe-en-alsace.eu/wp-content/uploads/2019/07/Liste-b%C3%A9n%C3%A9ficiaires-FEDER-AL-15-07-2019.xlsx                                  |online |xlsx      |         0|
GR     |2014GR16M2OP001|http://newsletter.antagonistikotita.gr/epanek/wp-content/uploads/2019/05/qry_Erga_List2Site_202002-1.csv                                      |online |csv       |         0|
HR     |2014HR16M1OP001|http://arhiva.strukturnifondovi.hr/UserDocsImages/Documents/KartaProjekataZaWeb1122017.xls                                                    |online |xls       |         0|
HU     |2014HU16M2OP001|                                                                                                                                              |offline|          |         0|
IE     |2014IE16RFOP001|https://www.nwra.ie/wp-content/uploads/2019/09/ecohesion-report-aug-2019-beneficiaries-cert-status-order-final-doc-x-county.xlsx              |online |xlsx      |         0|
IT     |2014ITERDF     |https://opencoesione.gov.it/en/opendata/fondi/progetti_esteso_FESR_2014-2020.zip                                                              |online |csv       |         1|
LT     |2014LT16MAOP001|https://www.esinvesticijos.lt/lt//finansavimas/paraiskos_ir_projektai/xlsexport?                                                              |online |xlsx      |         0|
LU     |2014LU16RFOP001|http://www.fonds-europeens.public.lu/fr/publications/l/liste-projet-2020-ice-feder/Liste_projets_FEDER_2014_2020.xlsx                         |online |xlsx      |         0|
LV     |2014LV16MAOP001|http://www.esfondi.lv/upload/projektu_mekletajs_csv/kpvis_CSV/kpvis_projektu_saraksts.csv                                                     |online |csv       |         0|
MT     |2014MT16M1OP001|                                                                                                                                              |missing|          |         0|
NL     |2014NL16RFOP004|http://www.op-oost.eu/Beschikte-projecten-(CSV-362-kB)                                                                                        |online |csv       |         0|
PL     |2014PL16M2OP001|http://rpo.dolnyslask.pl/wp-content/uploads/2020/01/lista-prj-pozak.xlsx                                                                      |online |xlsx      |         0|
PT     |2014PT16M2OP003|http://www.alentejo.portugal2020.pt/index.php/projetos-aprovados/category/73-projetos-aprovados?download=115:projetos-aprovados               |online |xlsx      |         0|
RO     |2014RO16RFOP002|http://www.fonduri-ue.ro/images/files/implementare-absorbtie/2017/Lista_Proiecte_contractate_-_01.2018.zip                                    |online |ods       |         1|
SE     |2014SE16RFOP003|                                                                                                                                              |missing|          |         0|
SI     |2014SI16MAOP001|https://www.eu-skladi.si/sl/dokumenti/seznam-projektov/seznam_projektov_18022020.xlsx                                                         |online |xlsx      |         0|
SK     |2014SK16M1OP002|http://www.op-kzp.sk/wp-content/uploads/2015/05/Zoznam-projektov_OP-KZP_27.4.2017_SIEA1.xlsx                                                  |online |xlsx      |         0|
TC     |2014TC16RFCB014|http://database.centralbaltic.eu/export/list-of-operations.csv                                                                                |online |csv       |         0|
UK     |2014UK16RFOP002|http://www.eufunding.gi/docs7/Beneficiaries%20Excel.xls                                                                                       |online |xls       |         0|
Once this file is in place, you just simply need to run:

```
$ $ make FORCE_DOWNLOAD=1
```

There's one important human supervision in the code, when the interatctive shell will prompt for user input in assigning the correct detected header for each source file. Please review the code [here](https://github.com/balkey/eu1420/blob/master/lib/evaluate_header.py).