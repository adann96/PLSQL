------TRIGGER
/*
1. Zdefiniować wyzwalacz na tabeli EMPLOYEES, który przy wstawieniu lub modyfikowaniu danych pole LAST_NAME i FIRST_NAME będzie zamieniane na duże litery.
create or replace trigger upperCaseNames
before update of FIRST_NAME, LAST_NAME on employees
for each row
begin
    :NEW.FIRST_NAME := UPPER(:NEW.first_name);
    :NEW.LAST_NAME := UPPER(:NEW.LAST_NAME);
end;

update employees set last_name = 'Domanski' where employee_id = 198;
update employees set first_name = 'Adam' where employee_id = 198;
2. Zdefiniować wyzwalacz na tabeli EMPLOYEES, który z wykorzystaniem sekwencji wcześniej utworzonej będzie numerował EMPLOYEE_ID tabeli od wartości 200 i do wartości maksymalnie 999999.
3. Zdefiniować wyzwalacz na tabeli EMPLOYEES, który sprawdzi czy pole HIRE_DATE jest mniejsze lub równe dacie systemowej +-10 dni przy wstawianiu nowego pracownika lub jego modyfikacji. Jeśli nie zwrócony zostanie komunikat o błędzie a transakcja zostanie wycofana.
4. Zdefiniować wyzwalcz na tabeli EMPLOYEES, który wyświetli komunikat na ekranie jaki użytkownik został skasowany, wstawiony lub zmodyfikowany.
5. Zdefiniować wyzwalcz na tabeli EMPLOYEES, który przy kasowaniu lub modyfikowaniu pracownika zapisze wszystkie dane do tabeli EMP_HIST z dodatkowymi polami tj. data_czas_operacji oraz typ_operacji (DELETE, UPDATE) - wcześniej trzeba przygotować daną tabelę.
6. Zdefiniować widok na tabeli EMPLOYEES i DEPARTMENTS. Na widoku zdefiniować wyzwalacz typu INSTEAD OF, który przy poleceniu INSERT na widoku doda użytkownika, który nie będzie miał przypisanego żadnego departamentu.
7. Zdefiniować wyzwalacz, który reaguje na pensję mniejszą od zera i wtedy zmienia jej wartość na 0.   
------PROCEDURE
1. Zdefiniuj procedurę, która wyświetli na ekranie imię, nazwisko oraz pensję pracownika o identyfikatorze podanym jako pierwszy parametr. Jeżeli nie ma takiego id to zwrócony zostanie informacja a braku takiego pracownika.
2. Zdefiniować procedurę, która zwróci liczbę zatrudnionych wszystkich pracowników.
3. Zdefiniować procedurę, która zwróci liczbę departamentów bez pracowników.
4. Zdefiniować procedurę, która zwróci liczbę zatrudnionych w danym departamencie podanym jako pierwszy parametr typu IN.Parametr drugi typu OUT zwróci liczbę zatrudnionych.
5. Zdefiniować procedurę, która zwróci liczbę zatrudnionych w danym departamencie na danym stanowisku pracy podanym odpowiednio jako pierwszy i drugi parametr typu IN. Parametr trzeci typu OUT zwróci liczbę zatrudnionych.
6. Zdefiniuj procedurę, która dla danego departamentu wyświetli wszystkie nazwiska i imiona pracowników.
7. Zdefiniuj procedurę która jako parametr wejściowy przyjmie id managera, a parametrem wyjściowym zwróci średnią zarobków osób podległych pod tego managera.
------FUNCTION
1. Zdefiniować funkcję, która wycina spacje na początku i końcu zmiennej typu VARCHAR2 i zwraca to co zostanie.
create or replace function trimFunc(str IN VARCHAR2)
RETURN varchar2
is
begin
    return ltrim(rtrim(str));
end trimFunc;
2. Zdefiniować funkcję, która sprawdza czy dana liczba całkowita jest parzysta czy nieparzysta i zwraca wartość 'Parzysta' lub 'Nieparzysta'.
3. Zdefiniować funkcję, która zwraca z daty podanej jako parametr wejściowy dzień tygodnia w języku polskim.
4. Zdefiniować funkcję, która będzie zwracać średnią zarobków w dziale, którego numer funkcja będzie przyjmować jako parametr.
5. Zdefiniować funkcję z trzema parametrami, która sprawdzi czy dane boki tworzą trójąt, a jeśli tak to obliczyć jego pole.
6. Zdefiniować funkcję zamieniajacą wszystkie spacje podkreśleniem.
7. Zdefiniować funkcję do odwracania stringu.
8. Zdefiniować funckcję PESEL, która sprawdza czy liczba jest poprawnym typem CHAR o określonej długości zawierający tylko cyfry od 0-9 (nie sprawdzamy poprawności funkcji PESEL)
9. Zdefiniować funkcję, która sprawdza czy dana liczba jest liczbą pierwszą.
10. Zdefiniować funkcję do obliczenia wartości silnia z liczby całkowitej (zdefiniować obsługę błędów w przypadku liczb mniejszych od 1 i takich, które przekroczą zakres wykorzystywaneo typu.
*/