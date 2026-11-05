# Programovací jazyky a překladače – cvičení (flex, bison)

Cvičení z předmětu **Programovací jazyky a překladače** (VŠPJ, LS 2025/26) – od konečného automatu v C až po parsery s tabulkou symbolů. Navazuje na ně semestrální [pjp-compiler](../../../pjp-compiler).

| Složka | Téma |
|---|---|
| `Cv_01` | sestavení programu v C přes `make` |
| `Cv_02` | regulární výrazy (`egrep`) |
| `Cv_03` | první skenery ve flexu – filtry textu, rozpoznání jazyků `abba`, `abc` |
| `Cv_04` | počítání slov, odstranění komentářů, zpracování přípon a parametrů příkazové řádky |
| `Cv_05` | tokenizer jazyka, statická a dynamická tabulka symbolů |
| `CV6`–`CV7` | syntaktická analýza – ruční parser v C a první gramatiky v bisonu, zotavení z chyb |
| `CV8` | aritmetické výrazy a celočíselná kalkulačka (priority operátorů) |
| `CV9` | kalkulačka v `double`, `sqrt`/`log`, proměnné, deklarace a tabulka symbolů |

## Technologie

C · flex · bison · make (Linux / WSL)

## Jak spustit

```bash
cd CV9
make
./symtab < test.txt
```

Vygenerované soubory (`*.yy.c`, `*.tab.c`) a binárky nejsou v repozitáři – vzniknou příkazem `make`.

---
*Školní úkoly – každý commit odpovídá jednomu odevzdání v Moodlu (s původním datem).*
