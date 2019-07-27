------TRIGGER
/*
1. Zdefiniowaæ wyzwalacz na tabeli EMPLOYEES, który przy wstawieniu lub modyfikowaniu danych pole LAST_NAME i FIRST_NAME bêdzie zamieniane na du¿e litery.
create or replace trigger upperCaseNames
before update of FIRST_NAME, LAST_NAME on employees
for each row
begin
    :NEW.FIRST_NAME := UPPER(:NEW.first_name);
    :NEW.LAST_NAME := UPPER(:NEW.LAST_NAME);
end;

update employees set last_name = 'Domanski' where employee_id = 198;
update employees set first_name = 'Adam' where employee_id = 198;
2. Zdefiniowaæ wyzwalacz na tabeli EMPLOYEES, który z wykorzystaniem sekwencji wczeœniej utworzonej bêdzie numerowa³ EMPLOYEE_ID tabeli od wartoœci 200 i do wartoœci maksymalnie 999999.
3. Zdefiniowaæ wyzwalacz na tabeli EMPLOYEES, który sprawdzi czy pole HIRE_DATE jest mniejsze lub równe dacie systemowej +-10 dni przy wstawianiu nowego pracownika lub jego modyfikacji. Jeœli nie zwrócony zostanie komunikat o b³êdzie a transakcja zostanie wycofana.
4. Zdefiniowaæ wyzwalcz na tabeli EMPLOYEES, który wyœwietli komunikat na ekranie jaki u¿ytkownik zosta³ skasowany, wstawiony lub zmodyfikowany.
5. Zdefiniowaæ wyzwalcz na tabeli EMPLOYEES, który przy kasowaniu lub modyfikowaniu pracownika zapisze wszystkie dane do tabeli EMP_HIST z dodatkowymi polami tj. data_czas_operacji oraz typ_operacji (DELETE, UPDATE) - wczeœniej trzeba przygotowaæ dan¹ tabelê.
6. Zdefiniowaæ widok na tabeli EMPLOYEES i DEPARTMENTS. Na widoku zdefiniowaæ wyzwalacz typu INSTEAD OF, który przy poleceniu INSERT na widoku doda u¿ytkownika, który nie bêdzie mia³ przypisanego ¿adnego departamentu.
7. Zdefiniowaæ wyzwalacz, który reaguje na pensjê mniejsz¹ od zera i wtedy zmienia jej wartoœæ na 0.   
------PROCEDURE
1. Zdefiniuj procedurê, która wyœwietli na ekranie imiê, nazwisko oraz pensjê pracownika o identyfikatorze podanym jako pierwszy parametr. Je¿eli nie ma takiego id to zwrócony zostanie informacja a braku takiego pracownika.
2. Zdefiniowaæ procedurê, która zwróci liczbê zatrudnionych wszystkich pracowników.
3. Zdefiniowaæ procedurê, która zwróci liczbê departamentów bez pracowników.
4. Zdefiniowaæ procedurê, która zwróci liczbê zatrudnionych w danym departamencie podanym jako pierwszy parametr typu IN.Parametr drugi typu OUT zwróci liczbê zatrudnionych.
5. Zdefiniowaæ procedurê, która zwróci liczbê zatrudnionych w danym departamencie na danym stanowisku pracy podanym odpowiednio jako pierwszy i drugi parametr typu IN. Parametr trzeci typu OUT zwróci liczbê zatrudnionych.
6. Zdefiniuj procedurê, która dla danego departamentu wyœwietli wszystkie nazwiska i imiona pracowników.
7. Zdefiniuj procedurê która jako parametr wejœciowy przyjmie id managera, a parametrem wyjœciowym zwróci œredni¹ zarobków osób podleg³ych pod tego managera.
------FUNCTION
1. Zdefiniowaæ funkcjê, która wycina spacje na pocz¹tku i koñcu zmiennej typu VARCHAR2 i zwraca to co zostanie.
2. Zdefiniowaæ funkcjê, która sprawdza czy dana liczba ca³kowita jest parzysta czy nieparzysta i zwraca wartoœæ 'Parzysta' lub 'Nieparzysta'.
3. Zdefiniowaæ funkcjê, która zwraca z daty podanej jako parametr wejœciowy dzieñ tygodnia w jêzyku polskim.
4. Zdefiniowaæ funkcjê, która bêdzie zwracaæ œredni¹ zarobków w dziale, którego numer funkcja bêdzie przyjmowaæ jako parametr.
5. Zdefiniowaæ funkcjê z trzema parametrami, która sprawdzi czy dane boki tworz¹ trój¹t, a jeœli tak to obliczyæ jego pole.
6. Zdefiniowaæ funkcjê zamieniajac¹ wszystkie spacje podkreœleniem.
7. Zdefiniowaæ funkcjê do odwracania stringu.
8. Zdefiniowaæ funckcjê PESEL, która sprawdza czy liczba jest poprawnym typem CHAR o okreœlonej d³ugoœci zawieraj¹cy tylko cyfry od 0-9 (nie sprawdzamy poprawnoœci funkcji PESEL)
9. Zdefiniowaæ funkcjê, która sprawdza czy dana liczba jest liczb¹ pierwsz¹.
10. Zdefiniowaæ funkcjê do obliczenia wartoœci silnia z liczby ca³kowitej (zdefiniowaæ obs³ugê b³êdów w przypadku liczb mniejszych od 1 i takich, które przekrocz¹ zakres wykorzystywaneo typu.
*/
