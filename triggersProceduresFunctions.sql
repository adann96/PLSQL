------Oracle
/*
1. Write a PL/SQL block to calculate the incentive of an employee whose ID is 110. (salary * 0.12)?
declare
    incentive number(8,2);
begin
    select salary * 0.12 into incentive from hr.employees
    where EMPLOYEE_ID = 110;
    dbms_output.put_line('Employee incentive is: ' || incentive);
end;

2. Show me what You got:
SELECT owner, table_name FROM all_tables

3. Switch case for determining salary: < 5000, between 5000 and 10000, > 10000.
select employees.first_name, employees.last_name, employees.salary,
case
    when employees.SALARY < 5000 then 'Niska pensja'
    when employees.SALARY between 5000 and 10000 then 'Srednia pensja'
    when employees.SALARY > 10000 then 'Wysoka pensja'
end
from hr.employees;

4. Use NVL, NVL2, Coalesce, Decode to switch from 'null' to 0.

--NVL('Jakiś string', 'Weź go zamien na to co jest tu')
select COMMISSION_PCT,
case
    when COMMISSION_PCT is null or COMMISSION_PCT = '' then NVL('Jakiś string', 'Weź go zamien na to co jest tu')(COMMISSION_PCT, '0')
    else COMMISSION_PCT
end AS "NewCOMMISSION_PCT"
from hr.employees;

--NVL2('Jakiś string','Jak null, to to','Jak nie null, to to')
select COMMISSION_PCT,
case
    when COMMISSION_PCT is null or COMMISSION_PCT = '' then NVL2(COMMISSION_PCT, COMMISSION_PCT, '0')
end AS "NewCOMMISSION_PCT"
from hr.employees;

--COALESCE('is not null','it is')
select COALESCE(COMMISSION_PCT, 0) from hr.employees;


SELECT First_Name || ' ' || Last_Name as Employee,
DECODE(COMMISSION_PCT, null, '0'
                     , '-' , '0',COMMISSION_PCT) result
FROM hr.employees;

5. All Employees table with null values in COMMISSION_PCT without 'where':

select * from hr.employees order by COMMISSION_PCT nulls first;

6. Select current user:

SELECT USERNAME FROM V$SESSION;

7. Select current logged user with his ID and current date with time using an appropriate format:

SELECT USER#, username FROM V$SESSION;
select TO_CHAR(SYSTIMESTAMP, 'YY:MM:DD HH:MI:SS') from dual;

8. Select current date and convert from string to date:

begin
 dbms_output.put_line(TO_DATE('2020:01:27','yyyy/mm/dd'));
end;

9. Calculate difference between the earliest and the latest hired employees:

declare
    date1 date;
    date2 date;
    monthsNo number;
begin
    select HIRE_DATE into date1
    from hr.employees
    order by HIRE_DATE desc fetch first 1 row only;
    
    select HIRE_DATE into date2
    from hr.employees
    order by HIRE_DATE asc fetch first 1 row only;
    
    monthsNo := MONTHS_BETWEEN(date1, date2);
    
    dbms_output.put_line(round(monthsNo));
end;

/*
------TRIGGER
/*
1. Zdefiniować wyzwalacz na tabeli EMPLOYEES, który przy wstawieniu lub modyfikowaniu danych pole LAST_NAME i FIRST_NAME będzie zamieniane na duże litery.
create or replace trigger upperCaseNames
before update or update of FIRST_NAME, LAST_NAME on employees
for each row
begin
    :NEW.FIRST_NAME := UPPER(:NEW.first_name);
    :NEW.LAST_NAME := UPPER(:NEW.LAST_NAME);
end;

update employees set last_name = 'Domanski' where employee_id = 198;
update employees set first_name = 'Adam' where employee_id = 198;
2. Zdefiniować wyzwalacz na tabeli EMPLOYEES, który z wykorzystaniem sekwencji wcześniej utworzonej będzie numerował EMPLOYEE_ID tabeli od wartości 200 i do wartości maksymalnie 999999.
3. Zdefiniować wyzwalacz na tabeli EMPLOYEES, który sprawdzi czy pole HIRE_DATE jest mniejsze lub równe dacie systemowej +-10 dni przy wstawianiu nowego pracownika lub jego modyfikacji. Jeśli nie zwrócony zostanie komunikat o błędzie a transakcja zostanie wycofana.

create or replace trigger lowerOrHigherThanSysDate
before insert or update of hire_date on employees
for each row
declare
    systemDate date;
begin
    select sysdate into systemDate from dual;
    if (:new.hire_date > (systemDate + 10)) or (:new.hire_date < (systemDate - 10)) Then
        :new.hire_date := :old.hire_date;
        DBMS_OUTPUT.PUT_LINE('Transakcja wycofana');
    else
        DBMS_OUTPUT.PUT_LINE('Nowa data zatrudnienia -> OK!');
    end if;
end;

4. Zdefiniować wyzwalcz na tabeli EMPLOYEES, który wyświetli komunikat na ekranie jaki użytkownik został skasowany, wstawiony lub zmodyfikowany.
5. Zdefiniować wyzwalcz na tabeli EMPLOYEES, który przy kasowaniu lub modyfikowaniu pracownika zapisze wszystkie dane do tabeli EMP_HIST z dodatkowymi polami tj. data_czas_operacji oraz typ_operacji (DELETE, UPDATE) - wcześniej trzeba przygotować daną tabelę.
6. Zdefiniować widok na tabeli EMPLOYEES i DEPARTMENTS. Na widoku zdefiniować wyzwalacz typu INSTEAD OF, który przy poleceniu INSERT na widoku doda użytkownika, który nie będzie miał przypisanego żadnego departamentu.
7. Zdefiniować wyzwalacz, który reaguje na pensję mniejszą od zera i wtedy zmienia jej wartość na 0.

create or replace TRIGGER notMinusSalary
before update of salary on employees
for each row
begin
    if :new.salary < 0 then
        dbms_output.put_line('Wartość poniżej zera!');
        :new.salary := 0;
    end if;
end;

update employees set salary = -3000 where employee_id = 198;

------PROCEDURE
1. Zdefiniuj procedurę, która wyświetli na ekranie imię, nazwisko oraz pensję pracownika o identyfikatorze podanym jako pierwszy 
parametr. Jeżeli nie ma takiego id to zwrócony zostanie informacja a braku takiego pracownika.
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
create or replace FUNCTION isOddorNo(liczba IN number)
return varchar2
is
begin
    If mod(liczba,2) = 0 Then
        return 'Parzysta';
    else
        return 'Nieparzysta';
    end if;
end;

begin
dbms_output.put_line(isoddorno(105));
end;

3. Zdefiniować funkcję, która zwraca z daty podanej jako parametr wejściowy dzień tygodnia w języku polskim.

create or replace FUNCTION getDay(yourDate in date)
return char
is
begin
    if extract(day from yourdate) < 10 then
        return '0' || to_char(extract(day from yourdate));
    else
        return extract(day from yourdate);
    end if;
end;

begin
DBMS_OUTPUT.PUT_LINE(getDay('1998-03-07'));
end;

4. Zdefiniować funkcję, która będzie zwracać średnią zarobków w dziale, którego numer funkcja będzie przyjmować jako parametr.

create or replace function getAvgAndDep(dep in number)
return number
is
    avgDep number;
begin
    select round(avg(salary),2) into avgDep
    from employees where department_id = dep;
    return avgDep;
end;

begin
DBMS_OUTPUT.PUT_LINE(getAvgAndDep(50));
end;

5. Zdefiniować funkcję z trzema parametrami, która sprawdzi czy dane boki tworzą trójąt, a jeśli tak to obliczyć jego pole.
6. Zdefiniować funkcję zamieniajacą wszystkie spacje podkreśleniem.
7. Zdefiniować funkcję do odwracania stringu.
8. Zdefiniować funckcję PESEL, która sprawdza czy liczba jest poprawnym typem CHAR o określonej długości zawierający tylko cyfry od 0-9 (nie sprawdzamy poprawności funkcji PESEL)
9. Zdefiniować funkcję, która sprawdza czy dana liczba jest liczbą pierwszą.
10. Zdefiniować funkcję do obliczenia wartości silnia z liczby całkowitej (zdefiniować obsługę błędów w przypadku liczb mniejszych od 1 i takich, które przekroczą zakres wykorzystywaneo typu.
*/
