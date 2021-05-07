# Skript na stažení otevřených dat z MS2014+

## Nastavení

Nastavení je pomocí ENV proměnných:
| Proměnná | Hodnota | Výchozí | Popis |
| ---           | --- | --- | --- |
| `OVERWRITE`   | `"true"`/`"false"` | `"false"` | Přepíše data v DB, i když se dle zdrojový soubor dle ETAG nezměnil |
| `SCHEMA`      | `string` | `"PUBLIC"` | Název schématu (postgres), do kterého se mají data vložit. Struktura schématu je ve složce `sql` a musíte ji vytvořit předem.|
| `DB_CLIENT`   | `string` | | typ DB |
| `DB_HOST`     | `string` | | adresa DB |
| `DB_NAME`     | `string` | | název databáze |
| `DB_USER`     | `string` | | uživatelské jméno k DB |
| `DB_PASSWORD` | `string` | | heslo k DB |
