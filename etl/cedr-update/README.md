# Skript na stažení dat z CEDR III

## Spuštění

1) Stahněte si obsah složky cedr-update do počítače

2) Vytvořte strukturu v databázi spuštěním SQL skriptu `cedr-structure.sql`

### A) Lokální prostředí

- Je potřeba mít nainstalovaný NodeJS

3) Nainstalujte závislosti
```bash
npm install
```

4) Spusťte kompilaci
```bash
npm run build
```

5) Spusťte import
```
DB_HOST=example.com DB_USER=postgres DB_PASSWORD=password DB_NAME=postgres npm start
```


### B) Spuštění v Dockeru

 - Je potřeba mít nainstalovaný Docker

3) Vytvořte docker image
```bash
docker build -d cedr-update .
```

4) Spusťte import
```bash
docker run -it -e "DB_USER=postgres" -e "DB_PASSWORD=password" -e "DB_NAME=postgres" -e "DB_HOST=example.com" cedr-update
```


###

## Známé problémy

 - cast_obce chybi v CSV
 - refundace_indikator chybi v dokumentaci
 - inidikatory jsou v CSV jako true/false, ale v dokumentaci jako 1/0


V nové verzi exportů se změnily některé názvy sloupců, není to v dokumentaci:

| Tabulka         | Původní               | Nový                  |
|-----------------|-----------------------|-----------------------|
| adresa_bydliste | obec                  | iri_obec              |
| adresa_sidlo    | iri_cast_obce         | cast_obce             |
| dotace          | projekt_idnetifikator | projekt_identifikator |