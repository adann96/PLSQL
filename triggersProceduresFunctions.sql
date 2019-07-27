------TRIGGER
/*
1. Zdefiniowa� wyzwalacz na tabeli EMPLOYEES, kt�ry przy wstawieniu lub modyfikowaniu danych pole LAST_NAME i FIRST_NAME b�dzie zamieniane na du�e litery.
create or replace trigger upperCaseNames
before update of FIRST_NAME, LAST_NAME on employees
for each row
begin
    :NEW.FIRST_NAME := UPPER(:NEW.first_name);
    :NEW.LAST_NAME := UPPER(:NEW.LAST_NAME);
end;

update employees set last_name = 'Domanski' where employee_id = 198;
update employees set first_name = 'Adam' where employee_id = 198;
2. Zdefiniowa� wyzwalacz na tabeli EMPLOYEES, kt�ry z wykorzystaniem sekwencji wcze�niej utworzonej b�dzie numerowa� EMPLOYEE_ID tabeli od warto�ci 200 i do warto�ci maksymalnie 999999.
3. Zdefiniowa� wyzwalacz na tabeli EMPLOYEES, kt�ry sprawdzi czy pole HIRE_DATE jest mniejsze lub r�wne dacie systemowej +-10 dni przy wstawianiu nowego pracownika lub jego modyfikacji. Je�li nie zwr�cony zostanie komunikat o b��dzie a transakcja zostanie wycofana.
4. Zdefiniowa� wyzwalcz na tabeli EMPLOYEES, kt�ry wy�wietli komunikat na ekranie jaki u�ytkownik zosta� skasowany, wstawiony lub zmodyfikowany.
5. Zdefiniowa� wyzwalcz na tabeli EMPLOYEES, kt�ry przy kasowaniu lub modyfikowaniu pracownika zapisze wszystkie dane do tabeli EMP_HIST z dodatkowymi polami tj. data_czas_operacji oraz typ_operacji (DELETE, UPDATE) - wcze�niej trzeba przygotowa� dan� tabel�.
6. Zdefiniowa� widok na tabeli EMPLOYEES i DEPARTMENTS. Na widoku zdefiniowa� wyzwalacz typu INSTEAD OF, kt�ry przy poleceniu INSERT na widoku doda u�ytkownika, kt�ry nie b�dzie mia� przypisanego �adnego departamentu.
7. Zdefiniowa� wyzwalacz, kt�ry reaguje na pensj� mniejsz� od zera i wtedy zmienia jej warto�� na 0.   
------PROCEDURE
1. Zdefiniuj procedur�, kt�ra wy�wietli na ekranie imi�, nazwisko oraz pensj� pracownika o identyfikatorze podanym jako pierwszy parametr. Je�eli nie ma takiego id to zwr�cony zostanie informacja a braku takiego pracownika.
2. Zdefiniowa� procedur�, kt�ra zwr�ci liczb� zatrudnionych wszystkich pracownik�w.
3. Zdefiniowa� procedur�, kt�ra zwr�ci liczb� departament�w bez pracownik�w.
4. Zdefiniowa� procedur�, kt�ra zwr�ci liczb� zatrudnionych w danym departamencie podanym jako pierwszy parametr typu IN.Parametr drugi typu OUT zwr�ci liczb� zatrudnionych.
5. Zdefiniowa� procedur�, kt�ra zwr�ci liczb� zatrudnionych w danym departamencie na danym stanowisku pracy podanym odpowiednio jako pierwszy i drugi parametr typu IN. Parametr trzeci typu OUT zwr�ci liczb� zatrudnionych.
6. Zdefiniuj procedur�, kt�ra dla danego departamentu wy�wietli wszystkie nazwiska i imiona pracownik�w.
7. Zdefiniuj procedur� kt�ra jako parametr wej�ciowy przyjmie id managera, a parametrem wyj�ciowym zwr�ci �redni� zarobk�w os�b podleg�ych pod tego managera.
------FUNCTION
1. Zdefiniowa� funkcj�, kt�ra wycina spacje na pocz�tku i ko�cu zmiennej typu VARCHAR2 i zwraca to co zostanie.
2. Zdefiniowa� funkcj�, kt�ra sprawdza czy dana liczba ca�kowita jest parzysta czy nieparzysta i zwraca warto�� 'Parzysta' lub 'Nieparzysta'.
3. Zdefiniowa� funkcj�, kt�ra zwraca z daty podanej jako parametr wej�ciowy dzie� tygodnia w j�zyku polskim.
4. Zdefiniowa� funkcj�, kt�ra b�dzie zwraca� �redni� zarobk�w w dziale, kt�rego numer funkcja b�dzie przyjmowa� jako parametr.
5. Zdefiniowa� funkcj� z trzema parametrami, kt�ra sprawdzi czy dane boki tworz� tr�j�t, a je�li tak to obliczy� jego pole.
6. Zdefiniowa� funkcj� zamieniajac� wszystkie spacje podkre�leniem.
7. Zdefiniowa� funkcj� do odwracania stringu.
8. Zdefiniowa� funckcj� PESEL, kt�ra sprawdza czy liczba jest poprawnym typem CHAR o okre�lonej d�ugo�ci zawieraj�cy tylko cyfry od 0-9 (nie sprawdzamy poprawno�ci funkcji PESEL)
9. Zdefiniowa� funkcj�, kt�ra sprawdza czy dana liczba jest liczb� pierwsz�.
10. Zdefiniowa� funkcj� do obliczenia warto�ci silnia z liczby ca�kowitej (zdefiniowa� obs�ug� b��d�w w przypadku liczb mniejszych od 1 i takich, kt�re przekrocz� zakres wykorzystywaneo typu.
*/
