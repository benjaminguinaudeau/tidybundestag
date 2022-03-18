
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tidybundestag

<!-- badges: start -->
<!-- badges: end -->

`tidybundestag` wraps up the official API of the German Bundestag in R.

It can be used to retrieve data on:

-   activities (aktivität)
-   “Drucksachen”
-   Members of the Bundestag
-   Plenary protocols
-   Parliamentary processes (Vorgänge)

For more information on the API, please visit:
<https://dip.bundestag.de/documents/informationsblatt_zur_dip_api.pdf>

## Installation

You can install the latest version of tidybundestag from Github with

``` r
remotes::install_github("benjaminguinaudeau/tidybundestag")
```

## Api Key

Access to the API is controlled with an API key. To obtain this api-key
please visit the Bundestag
[website](https://dip.bundestag.de/%C3%BCber-dip/hilfe/api#content).

tidybundestag functions will read the API key from the environment
variable `BUNDESTAG_API`. In order to add your key to your environment
file, you can use the function `edit_r_environ()` from the {{usethis}}.

This will open your .Renviron file in your text editor. Now, you can add
the following line to it:

``` r
BUNDESTAG_API="YOUR_API_KEY"
```

Save the file and restart R for the changes to take effect.

Alternatively, you can provide an explicit definition of your API key
with each function call using the `api_token` argument.

## Example

``` r
library(tidybundestag)
```

Once you have an api-key, you can start accessing data:

``` r
bt_vorgang(n_max = 100) %>%
  dplyr::glimpse()
#> ✓ Total number of retrievable units: 283573 (Maximum set to 100)
#> 
#> Retrieved 0 documents
#> Done
#> ✓ Successfully retrieved 100 documents
#> Done
#> Rows: 100
#> Columns: 14
#> $ id                        <chr> "285483", "285482", "285481", "285480", "285…
#> $ beratungsstand            <chr> "Noch nicht beantwortet", "Noch nicht beantw…
#> $ vorgangstyp               <chr> "Kleine Anfrage", "Kleine Anfrage", "Kleine …
#> $ typ                       <chr> "Vorgang", "Vorgang", "Vorgang", "Vorgang", …
#> $ wahlperiode               <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, …
#> $ initiative                <list> [<tbl_df[1 x 1]>], [<tbl_df[1 x 1]>], [<tbl…
#> $ datum                     <chr> "2022-03-18", "2022-03-18", "2022-03-18", "2…
#> $ titel                     <chr> "Vorhaben der Bundesregierung zur Verbesseru…
#> $ sachgebiet                <list> <NULL>, <NULL>, <NULL>, <NULL>, [<tbl_df[1 …
#> $ deskriptor                <list> <NULL>, <NULL>, <NULL>, <NULL>, [<tbl_df[2 …
#> $ gesta                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, "D010", …
#> $ zustimmungsbeduerftigkeit <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NU…
#> $ abstract                  <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "Ent…
#> $ vorgang_verlinkung        <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NU…
```

## Endpoints

The API of the Bundestag proposes 8 different endpoints.

`tidybundestag` always returns a tibble where each row represents one
unit (i.e. one process, one plenary, one questions, one person, etc…).
The original json-structure is embedded in the tibble as a list-column,
that can be easily handled with
[`tidyr`](https://tidyr.tidyverse.org/reference/nest.html).

### Activities

``` r
bt_aktivitaet(n_max = 100) %>%
  dplyr::glimpse()
#> ✓ Total number of retrievable units: 1568803 (Maximum set to 100)
#> 
#> Retrieved 0 documents
#> Done
#> ✓ Successfully retrieved 100 documents
#> Done
#> Rows: 100
#> Columns: 10
#> $ id                   <chr> "1590982", "1590981", "1590980", "1590979", "1590…
#> $ aktivitaetsart       <chr> "Kleine Anfrage", "Kleine Anfrage", "Kleine Anfra…
#> $ typ                  <chr> "Aktivität", "Aktivität", "Aktivität", "Aktivität…
#> $ vorgangsbezug_anzahl <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
#> $ dokumentart          <chr> "Drucksache", "Drucksache", "Drucksache", "Drucks…
#> $ wahlperiode          <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 2…
#> $ datum                <chr> "2022-03-18", "2022-03-18", "2022-03-18", "2022-0…
#> $ titel                <chr> "Petr Bystron, MdB, AfD", "Dr. Alexander Gauland,…
#> $ fundstelle           <list> [<tbl_df[1 x 8]>], [<tbl_df[1 x 8]>], [<tbl_df[1…
#> $ vorgangsbezug        <list> [<tbl_df[1 x 4]>], [<tbl_df[1 x 4]>], [<tbl_df[1…
```

### Drucksache

``` r
bt_drucksache(n_max = 100) %>%
  dplyr::glimpse()
#> ✓ Total number of retrievable units: 258512 (Maximum set to 100)
#> 
#> Retrieved 0 documents
#> Done
#> ✓ Successfully retrieved 100 documents
#> Done
#> Rows: 100
#> Columns: 16
#> $ id                   <chr> "259841", "259840", "259839", "259838", "259837",…
#> $ drucksachetyp        <chr> "Kleine Anfrage", "Kleine Anfrage", "Kleine Anfra…
#> $ dokumentart          <chr> "Drucksache", "Drucksache", "Drucksache", "Drucks…
#> $ autoren_anzahl       <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 2, 15, 6, 5, 14, 0…
#> $ typ                  <chr> "Dokument", "Dokument", "Dokument", "Dokument", "…
#> $ vorgangsbezug_anzahl <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
#> $ dokumentnummer       <chr> "20/1109", "20/1108", "20/1107", "122/22(B)", "10…
#> $ wahlperiode          <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 2…
#> $ herausgeber          <chr> "BT", "BT", "BT", "BR", "BR", "BR", "BR", "BR", "…
#> $ datum                <chr> "2022-03-18", "2022-03-18", "2022-03-18", "2022-0…
#> $ titel                <chr> "Vorhaben der Bundesregierung zur Verbesserung de…
#> $ fundstelle           <list> [<tbl_df[1 x 8]>], [<tbl_df[1 x 8]>], [<tbl_df[1…
#> $ urheber              <list> [<tbl_df[1 x 3]>], [<tbl_df[1 x 3]>], [<tbl_df[1…
#> $ vorgangsbezug        <list> [<tbl_df[1 x 3]>], [<tbl_df[1 x 3]>], [<tbl_df[1…
#> $ autoren_anzeige      <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, …
#> $ ressort              <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, …
```

### Drucksache-Text

``` r
bt_drucksache_text(n_max = 20) %>%
  dplyr::glimpse()
#> ✓ Total number of retrievable units: 258512 (Maximum set to 20)
#> 
#> Retrieved 0 documents
#> Retrieved 10 documents
#> Done
#> ✓ Successfully retrieved 20 documents
#> Done
#> Rows: 20
#> Columns: 15
#> $ id              <chr> "259841", "259840", "259839", "259838", "259837", "259…
#> $ drucksachetyp   <chr> "Kleine Anfrage", "Kleine Anfrage", "Kleine Anfrage", …
#> $ dokumentart     <chr> "Drucksache", "Drucksache", "Drucksache", "Drucksache"…
#> $ autoren_anzahl  <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 2, 15, 6, 5, 14, 0, 0, …
#> $ typ             <chr> "Dokument", "Dokument", "Dokument", "Dokument", "Dokum…
#> $ dokumentnummer  <chr> "20/1109", "20/1108", "20/1107", "122/22(B)", "109/22(…
#> $ wahlperiode     <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20…
#> $ herausgeber     <chr> "BT", "BT", "BT", "BR", "BR", "BR", "BR", "BR", "BR", …
#> $ datum           <chr> "2022-03-18", "2022-03-18", "2022-03-18", "2022-03-18"…
#> $ titel           <chr> "Vorhaben der Bundesregierung zur Verbesserung der Par…
#> $ fundstelle      <list> [<tbl_df[1 x 8]>], [<tbl_df[1 x 8]>], [<tbl_df[1 x 8]…
#> $ urheber         <list> [<tbl_df[1 x 3]>], [<tbl_df[1 x 3]>], [<tbl_df[1 x 3]…
#> $ text            <chr> NA, NA, NA, "Bundesrat Drucksache 122/22 (Beschluss)\n…
#> $ autoren_anzeige <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NULL…
#> $ ressort         <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NULL…
```

### Person

``` r
bt_person(n_max = 20) %>%
  dplyr::glimpse()
#> ✓ Total number of retrievable units: 5369 (Maximum set to 20)
#> 
#> Retrieved 0 documents
#> Done
#> ✓ Successfully retrieved 100 documents
#> Done
#> Rows: 100
#> Columns: 10
#> $ id           <chr> "7466", "7462", "7405", "7399", "7381", "7360", "7356", "…
#> $ nachname     <chr> "Wundrak", "Wissler", "Schmidt", "Schattner", "Moosdorf",…
#> $ vorname      <chr> "Joachim", "Janine", "Eugen", "Bernd", "Matthias", "Chris…
#> $ typ          <chr> "Person", "Person", "Person", "Person", "Person", "Person…
#> $ wahlperiode  <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 18, 20, 20, 1…
#> $ basisdatum   <chr> "2021-12-15", "2021-12-07", "2021-10-25", "2021-11-12", "…
#> $ datum        <chr> "2022-03-18", "2022-03-18", "2022-03-18", "2022-03-18", "…
#> $ titel        <chr> "Joachim Wundrak, MdB, AfD", "Janine Wissler, MdB, DIE LI…
#> $ person_roles <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, …
#> $ namenszusatz <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…
```

### Plenarprotokoll

``` r
bt_plenarprotokoll(n_max = 100) %>%
  dplyr::glimpse()
#> ✓ Total number of retrievable units: 5459 (Maximum set to 100)
#> 
#> Retrieved 0 documents
#> Done
#> ✓ Successfully retrieved 100 documents
#> Done
#> Rows: 100
#> Columns: 12
#> $ id                   <chr> "5475", "5474", "5473", "5472", "5471", "5470", "…
#> $ dokumentart          <chr> "Plenarprotokoll", "Plenarprotokoll", "Plenarprot…
#> $ typ                  <chr> "Dokument", "Dokument", "Dokument", "Dokument", "…
#> $ vorgangsbezug_anzahl <int> 5, 0, 7, 51, 56, 9, 18, 52, 60, 1, 34, 13, 43, 42…
#> $ dokumentnummer       <chr> "1018", "20/22", "20/21", "20/20", "1017", "20/19…
#> $ wahlperiode          <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 2…
#> $ herausgeber          <chr> "BR", "BT", "BT", "BT", "BR", "BT", "BT", "BT", "…
#> $ datum                <chr> "2022-03-18", "2022-03-18", "2022-03-17", "2022-0…
#> $ titel                <chr> "Protokoll der 1018. Sitzung des Bundesrates", "P…
#> $ fundstelle           <list> [<tbl_df[1 x 6]>], [<tbl_df[1 x 6]>], [<tbl_df[1…
#> $ vorgangsbezug        <list> [<tbl_df[4 x 3]>], <NULL>, [<tbl_df[4 x 3]>], [<…
#> $ sitzungsbemerkung    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, "17. Bundesve…
```

### Text of plenarprotokoll

``` r
bt_plenarprotokoll_text(n_max = 20) %>%
  dplyr::glimpse()
#> ✓ Total number of retrievable units: 5459 (Maximum set to 20)
#> 
#> Retrieved 0 documents
#> Retrieved 10 documents
#> Done
#> ✓ Successfully retrieved 20 documents
#> Done
#> Rows: 20
#> Columns: 11
#> $ id                <chr> "5475", "5474", "5473", "5472", "5471", "5470", "546…
#> $ dokumentart       <chr> "Plenarprotokoll", "Plenarprotokoll", "Plenarprotoko…
#> $ typ               <chr> "Dokument", "Dokument", "Dokument", "Dokument", "Dok…
#> $ dokumentnummer    <chr> "1018", "20/22", "20/21", "20/20", "1017", "20/19", …
#> $ wahlperiode       <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, …
#> $ herausgeber       <chr> "BR", "BT", "BT", "BT", "BR", "BT", "BT", "BT", "BT"…
#> $ datum             <chr> "2022-03-18", "2022-03-18", "2022-03-17", "2022-03-1…
#> $ titel             <chr> "Protokoll der 1018. Sitzung des Bundesrates", "Prot…
#> $ fundstelle        <list> [<tbl_df[1 x 6]>], [<tbl_df[1 x 6]>], [<tbl_df[1 x …
#> $ text              <chr> NA, NA, "Deutscher Bundestag\nStenografischer Berich…
#> $ sitzungsbemerkung <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, "17. Bundesversa…
```

### Vorgang

``` r
bt_vorgang(n_max = 100) %>%
  dplyr::glimpse()
#> ✓ Total number of retrievable units: 283573 (Maximum set to 100)
#> 
#> Retrieved 0 documents
#> Done
#> ✓ Successfully retrieved 100 documents
#> Done
#> Rows: 100
#> Columns: 14
#> $ id                        <chr> "285483", "285482", "285481", "285480", "285…
#> $ beratungsstand            <chr> "Noch nicht beantwortet", "Noch nicht beantw…
#> $ vorgangstyp               <chr> "Kleine Anfrage", "Kleine Anfrage", "Kleine …
#> $ typ                       <chr> "Vorgang", "Vorgang", "Vorgang", "Vorgang", …
#> $ wahlperiode               <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, …
#> $ initiative                <list> [<tbl_df[1 x 1]>], [<tbl_df[1 x 1]>], [<tbl…
#> $ datum                     <chr> "2022-03-18", "2022-03-18", "2022-03-18", "2…
#> $ titel                     <chr> "Vorhaben der Bundesregierung zur Verbesseru…
#> $ sachgebiet                <list> <NULL>, <NULL>, <NULL>, <NULL>, [<tbl_df[1 …
#> $ deskriptor                <list> <NULL>, <NULL>, <NULL>, <NULL>, [<tbl_df[2 …
#> $ gesta                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, "D010", …
#> $ zustimmungsbeduerftigkeit <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NU…
#> $ abstract                  <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "Ent…
#> $ vorgang_verlinkung        <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NU…
```

### Vorgangsposition

``` r
bt_vorgangsposition(n_max = 100) %>%
  dplyr::glimpse()
#> ✓ Total number of retrievable units: 604223 (Maximum set to 100)
#> 
#> Retrieved 0 documents
#> Done
#> ✓ Successfully retrieved 100 documents
#> Done
#> Rows: 100
#> Columns: 21
#> $ id                 <chr> "1", "10", "100", "10001", "10002", "10006", "10008…
#> $ vorgangsposition   <chr> "Antrag zur Weitergeltung der Geschäftsordnung", "U…
#> $ zuordnung          <chr> "BT", "BR", "BT", "BT", "BT", "BT", "BT", "BT", "BT…
#> $ gang               <lgl> TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRU…
#> $ fortsetzung        <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FA…
#> $ nachtrag           <lgl> FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FA…
#> $ vorgangstyp        <chr> "Geschäftsordnung", "Bericht, Gutachten, Programm",…
#> $ typ                <chr> "Vorgangsposition", "Vorgangsposition", "Vorgangspo…
#> $ titel              <chr> "Weitergeltung von Geschäftsordnungsrecht (G-SIG: 1…
#> $ aktivitaet_anzahl  <int> 0, 0, 0, 14, 0, 6, 15, 37, 4, 0, 48, 13, 52, 46, 0,…
#> $ dokumentart        <chr> "Drucksache", "Drucksache", "Drucksache", "Drucksac…
#> $ vorgang_id         <chr> "3", "4", "42", "6063", "4624", "4628", "4629", "65…
#> $ datum              <chr> "2005-10-18", "2005-10-19", "2005-12-13", "2006-09-…
#> $ fundstelle         <list> [<tbl_df[5 x 8]>], [<tbl_df[1 x 9]>], [<tbl_df[5 x…
#> $ urheber            <list> [<tbl_df[5 x 3]>], [<tbl_df[1 x 3]>], [<tbl_df[5 x…
#> $ ueberweisung       <list> <NULL>, [<tbl_df[1 x 3]>], <NULL>, <NULL>, <NULL>,…
#> $ aktivitaet_anzeige <list> <NULL>, <NULL>, <NULL>, [<tbl_df[4 x 3]>], <NULL>,…
#> $ ressort            <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <N…
#> $ beschlussfassung   <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <N…
#> $ ratsdok            <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ kom                <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
```

## Query Parameter

-   id: id of the desired unit
-   start\_date: First day of the desired period (character string
    YYYY/MM/DD)
-   end\_date: Last day of the desired period (character string
    YYYY/MM/DD)
-   drucksache: Drucksache number of the desired unit
-   plenarprotokoll: Id of a plenary protocol related to the desired
    unit
-   vorgang: Id of a process related to the desired unit
-   zuordnung: Attribution to a given institution (one of
    `c('BT', 'BR', 'BV', 'EK')`)

### id (one or several)

``` r
bt_vorgang(id = "279665")
#> ✓ Total number of retrievable units: 1 (Maximum set to 100)
#> 
#> Retrieved 0 documents
#> Retrieved 1 documents
#> Done
#> ✓ Successfully retrieved 1 documents
#> Done
#> # A tibble: 1 × 12
#>   id     beratungsstand           vorgangstyp gesta sachgebiet typ   wahlperiode
#>   <chr>  <chr>                    <chr>       <chr> <list>     <chr>       <int>
#> 1 279665 Erledigt durch Ablauf d… Gesetzgebu… O009  <tibble>   Vorg…          19
#> # … with 5 more variables: zustimmungsbeduerftigkeit <list>, initiative <list>,
#> #   datum <chr>, titel <chr>, deskriptor <list>
```

``` r
bt_drucksache_text(id = c("239894", "234517"))
#> ✓ Total number of retrievable units: 2 (Maximum set to 100)
#> 
#> Retrieved 0 documents
#> Retrieved 2 documents
#> Done
#> ✓ Successfully retrieved 2 documents
#> Done
#> # A tibble: 2 × 15
#>   id     drucksachetyp  dokumentart autoren_anzahl typ      dokumentnummer
#>   <chr>  <chr>          <chr>                <int> <chr>    <chr>         
#> 1 239894 Antwort        Drucksache               0 Dokument 19/18195      
#> 2 234517 Kleine Anfrage Drucksache              15 Dokument 19/13776      
#> # … with 9 more variables: wahlperiode <int>, herausgeber <chr>, datum <chr>,
#> #   titel <chr>, text <chr>, fundstelle <list>, ressort <list>, urheber <list>,
#> #   autoren_anzeige <list>
```

### start\_date

``` r
bt_vorgang(n_max = 100, start_date = "2021-01-01") %>%
  dplyr::glimpse()
#> ✓ Total number of retrievable units: 14329 (Maximum set to 100)
#> 
#> Retrieved 0 documents
#> Done
#> ✓ Successfully retrieved 100 documents
#> Done
#> Rows: 100
#> Columns: 14
#> $ id                        <chr> "285483", "285482", "285481", "285480", "285…
#> $ beratungsstand            <chr> "Noch nicht beantwortet", "Noch nicht beantw…
#> $ vorgangstyp               <chr> "Kleine Anfrage", "Kleine Anfrage", "Kleine …
#> $ typ                       <chr> "Vorgang", "Vorgang", "Vorgang", "Vorgang", …
#> $ wahlperiode               <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, …
#> $ initiative                <list> [<tbl_df[1 x 1]>], [<tbl_df[1 x 1]>], [<tbl…
#> $ datum                     <chr> "2022-03-18", "2022-03-18", "2022-03-18", "2…
#> $ titel                     <chr> "Vorhaben der Bundesregierung zur Verbesseru…
#> $ sachgebiet                <list> <NULL>, <NULL>, <NULL>, <NULL>, [<tbl_df[1 …
#> $ deskriptor                <list> <NULL>, <NULL>, <NULL>, <NULL>, [<tbl_df[2 …
#> $ gesta                     <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, "D010", …
#> $ zustimmungsbeduerftigkeit <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NU…
#> $ abstract                  <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "Ent…
#> $ vorgang_verlinkung        <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NU…
```

### end\_date

``` r
bt_drucksache(n_max = 100, end_date = "2020-01-01") %>%
  dplyr::glimpse()
#> ✓ Total number of retrievable units: 236667 (Maximum set to 100)
#> 
#> Retrieved 0 documents
#> Done
#> ✓ Successfully retrieved 100 documents
#> Done
#> Rows: 100
#> Columns: 16
#> $ id                   <chr> "237635", "237626", "237622", "237619", "237611",…
#> $ drucksachetyp        <chr> "Antwort", "Antwort", "Antwort", "Antwort", "Antw…
#> $ dokumentart          <chr> "Drucksache", "Drucksache", "Drucksache", "Drucks…
#> $ autoren_anzahl       <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
#> $ typ                  <chr> "Dokument", "Dokument", "Dokument", "Dokument", "…
#> $ vorgangsbezug_anzahl <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
#> $ dokumentnummer       <chr> "19/16291", "19/16299", "19/16295", "19/16292", "…
#> $ wahlperiode          <int> 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 1…
#> $ herausgeber          <chr> "BT", "BT", "BT", "BT", "BT", "BT", "BT", "BT", "…
#> $ datum                <chr> "2019-12-30", "2019-12-30", "2019-12-30", "2019-1…
#> $ titel                <chr> "auf die Kleine Anfrage\r\n- Drucksache 19/14743 …
#> $ fundstelle           <list> [<tbl_df[1 x 8]>], [<tbl_df[1 x 8]>], [<tbl_df[1…
#> $ ressort              <list> [<tbl_df[1 x 2]>], [<tbl_df[1 x 2]>], [<tbl_df[1…
#> $ urheber              <list> [<tbl_df[1 x 3]>], [<tbl_df[1 x 3]>], [<tbl_df[1…
#> $ vorgangsbezug        <list> [<tbl_df[1 x 3]>], [<tbl_df[1 x 3]>], [<tbl_df[1…
#> $ autoren_anzeige      <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, …
```

### drucksache

``` r
bt_vorgang(drucksache = 68852) %>%
  dplyr::glimpse()
#> ✓ Total number of retrievable units: 1 (Maximum set to 100)
#> 
#> Retrieved 0 documents
#> Retrieved 1 documents
#> Done
#> ✓ Successfully retrieved 1 documents
#> Done
#> Rows: 1
#> Columns: 12
#> $ id             <chr> "84343"
#> $ abstract       <chr> "Übernahme von Geschäftsordnungen durch den 19. Deutsch…
#> $ beratungsstand <chr> "Abgeschlossen"
#> $ vorgangstyp    <chr> "Geschäftsordnung"
#> $ sachgebiet     <list> [<tbl_df[1 x 1]>]
#> $ typ            <chr> "Vorgang"
#> $ wahlperiode    <int> 19
#> $ initiative     <list> [<tbl_df[1 x 1]>]
#> $ datum          <chr> "2019-03-27"
#> $ titel          <chr> "Weitergeltung von Geschäftsordnungsrecht"
#> $ deskriptor     <list> [<tbl_df[6 x 3]>]
#> $ verkuendung    <list> [<tbl_df[1 x 11]>]
```

### plenarprotokoll

``` r
bt_vorgang(plenarprotokoll = 908) %>%
  dplyr::glimpse()
#> ✓ Total number of retrievable units: 6 (Maximum set to 100)
#> 
#> Retrieved 0 documents
#> Retrieved 6 documents
#> Done
#> ✓ Successfully retrieved 6 documents
#> Done
#> Rows: 6
#> Columns: 12
#> $ id             <chr> "84343", "84396", "84394", "84393", "84352", "84344"
#> $ abstract       <chr> "Übernahme von Geschäftsordnungen durch den 19. Deutsch…
#> $ beratungsstand <chr> "Abgeschlossen", "Abgeschlossen", "Abgeschlossen", NA, …
#> $ vorgangstyp    <chr> "Geschäftsordnung", "Wahl im BT", "Wahl im BT", "Anspra…
#> $ sachgebiet     <list> [<tbl_df[1 x 1]>], [<tbl_df[1 x 1]>], [<tbl_df[1 x 1]>]…
#> $ typ            <chr> "Vorgang", "Vorgang", "Vorgang", "Vorgang", "Vorgang",…
#> $ wahlperiode    <int> 19, 19, 19, 19, 19, 19
#> $ initiative     <list> [<tbl_df[1 x 1]>], <NULL>, <NULL>, <NULL>, [<tbl_df[1 x…
#> $ datum          <chr> "2019-03-27", "2017-10-24", "2017-10-24", "2017-10-24",…
#> $ titel          <chr> "Weitergeltung von Geschäftsordnungsrecht", "Wahl der …
#> $ deskriptor     <list> [<tbl_df[6 x 3]>], [<tbl_df[2 x 3]>], [<tbl_df[3 x 3]>]…
#> $ verkuendung    <list> [<tbl_df[1 x 11]>], <NULL>, <NULL>, <NULL>, <NULL>, <NU…
```

### zuordnung

``` r
bt_plenarprotokoll(n_max = 100, zuordnung = "BT") %>%
  dplyr::glimpse()
#> ✓ Total number of retrievable units: 4385 (Maximum set to 100)
#> 
#> Retrieved 0 documents
#> Done
#> ✓ Successfully retrieved 100 documents
#> Done
#> Rows: 100
#> Columns: 11
#> $ id                   <chr> "5474", "5473", "5472", "5470", "5469", "5468", "…
#> $ dokumentart          <chr> "Plenarprotokoll", "Plenarprotokoll", "Plenarprot…
#> $ typ                  <chr> "Dokument", "Dokument", "Dokument", "Dokument", "…
#> $ vorgangsbezug_anzahl <int> 0, 7, 51, 9, 18, 52, 60, 13, 43, 42, 12, 13, 9, 2…
#> $ dokumentnummer       <chr> "20/22", "20/21", "20/20", "20/19", "20/18", "20/…
#> $ wahlperiode          <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 2…
#> $ herausgeber          <chr> "BT", "BT", "BT", "BT", "BT", "BT", "BT", "BT", "…
#> $ datum                <chr> "2022-03-18", "2022-03-17", "2022-03-16", "2022-0…
#> $ titel                <chr> "Protokoll der 22. Sitzung des 20. Deutschen Bund…
#> $ fundstelle           <list> [<tbl_df[1 x 6]>], [<tbl_df[1 x 7]>], [<tbl_df[1…
#> $ vorgangsbezug        <list> <NULL>, [<tbl_df[4 x 3]>], [<tbl_df[4 x 3]>], [<…
```

## Unnest list-columns

``` r
members <- bt_person(n_max = 200) %>%
  dplyr::glimpse()
#> ✓ Total number of retrievable units: 5369 (Maximum set to 200)
#> 
#> Retrieved 0 documents
#> Retrieved 100 documents
#> Done
#> ✓ Successfully retrieved 200 documents
#> Done
#> Rows: 200
#> Columns: 10
#> $ id           <chr> "7466", "7462", "7405", "7399", "7381", "7360", "7356", "…
#> $ nachname     <chr> "Wundrak", "Wissler", "Schmidt", "Schattner", "Moosdorf",…
#> $ vorname      <chr> "Joachim", "Janine", "Eugen", "Bernd", "Matthias", "Chris…
#> $ typ          <chr> "Person", "Person", "Person", "Person", "Person", "Person…
#> $ wahlperiode  <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 18, 20, 20, 1…
#> $ basisdatum   <chr> "2021-12-15", "2021-12-07", "2021-10-25", "2021-11-12", "…
#> $ datum        <chr> "2022-03-18", "2022-03-18", "2022-03-18", "2022-03-18", "…
#> $ titel        <chr> "Joachim Wundrak, MdB, AfD", "Janine Wissler, MdB, DIE LI…
#> $ person_roles <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, <NULL>, …
#> $ namenszusatz <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N…

roles <- members %>%
  tidyr::unnest(person_roles, names_sep = "_", keep_empty = T) %>%
  dplyr::glimpse()
#> Rows: 250
#> Columns: 18
#> $ id                              <chr> "7466", "7462", "7405", "7399", "7381"…
#> $ nachname                        <chr> "Wundrak", "Wissler", "Schmidt", "Scha…
#> $ vorname                         <chr> "Joachim", "Janine", "Eugen", "Bernd",…
#> $ typ                             <chr> "Person", "Person", "Person", "Person"…
#> $ wahlperiode                     <int> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20…
#> $ basisdatum                      <chr> "2021-12-15", "2021-12-07", "2021-10-2…
#> $ datum                           <chr> "2022-03-18", "2022-03-18", "2022-03-1…
#> $ titel                           <chr> "Joachim Wundrak, MdB, AfD", "Janine W…
#> $ person_roles_funktionszusatz    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
#> $ person_roles_funktion           <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
#> $ person_roles_bundesland         <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
#> $ person_roles_nachname           <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
#> $ person_roles_vorname            <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
#> $ person_roles_wahlperiode_nummer <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL…
#> $ person_roles_fraktion           <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
#> $ person_roles_ressort_titel      <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
#> $ person_roles_wahlkreiszusatz    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
#> $ namenszusatz                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
```

``` r
roles %>%
  dplyr::filter(!is.na(person_roles_funktion)) %>%
  dplyr::count(person_roles_funktion) %>%
  ggplot2::ggplot(ggplot2::aes(person_roles_funktion, n)) +
  ggplot2::geom_col() +
  ggplot2::coord_flip()
```

<img src="man/figures/README-unnamed-chunk-20-1.png" width="100%" />
