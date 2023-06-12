# aplikacja_2

Aplikacja nr 2 na zaliczenie programowania aplikacji mobilnych.

## Polecenie

### Zadanie 3.1. Klasa modelowa
Napisz klasę odpowiadającą za model danych charakteryzujący telefon. Klasa ma zawierać
takie pola jak:
- identyfikator (klucz główny),
- producent,
- model,
- wersja oprogramowania,
- obrazek – awatar telefonu (w postaci nazwy pliku).
### Zadanie 3.2. Obsługa bazy
Napisz klasę zawierającą metody do obsługi bazy danych bazującej na klasie z zadania 3.1.
Muszą istnieć metody do:
- dodawania nowego telefonu do bazy,
- modyfikacji istniejącego telefonu w bazie,
- usuwania telefonu z bazy,
- usuwania wszystkich telefonów z bazy,
- odczytania danych pojedynczego telefonu z bazy,
- odczytania listy wszystkich telefonów z bazy.
### Zadanie 3.3. Aplikacja bazodanowa
Wykorzystując kod z zadania 3.1 i 3.2 napisz aplikację wyświetlającą listę telefonów
znajdujących się w bazie w postaci listy przewijanej. Powinna być wyświetlana tylko aktualna
lista telefonów znajdujących się w bazie.
### Zadanie 3.4. Aplikacja bazodanowa c.d.
Dodaj do aplikacji funkcjonalność dodawania i edycji danych telefonu. Możesz
wykorzystać dowolny widget np. przycisk. Wciśnięcie przycisku (lub inna akcja dla
pozostałych widgetów) otwiera odpowiednio nowy ekran do:
- wypełnienia formularza z danymi telefonu,
- edycji danych telefonu.
W przypadku drugiego przycisku formularz ma zostać wypełniony danymi pobranymi
z bazy dla konkretnego edytowanego telefonu. W formularzu edycji dodaj funkcjonalność
usuwania z bazy.

---

Tworzona aplikacja powinna zawierać
- lokalna baza danych
- wyswietlanie listy telefonow z kontrolkami do edycji i usuwania
- edycja to zaladowanie formularza dodawania z zaladowanymi danymi
- parametry wiersza: producent, model, zdjecie

