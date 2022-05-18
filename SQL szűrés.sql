SQL szűrési példák

Munkakörök lekérdezése ismétlődéssel/ismétlődés nélkül:

SELECT munkakor
FROM dolgozok;

SELECT DISTINCT munkakor
FROM dolgozok;


Jelenítsük meg az osztalyok táblából, az osztalykod és osztalynev oszlopokat, majd rendezzünk osztalynev szerint csökkenőleg!

SELECT osztalykod, osztalynev
FROM osztalyok
ORDER BY osztalynev DESC;

SELECT osztalykod, osztalynev
FROM osztalyok
ORDER BY 2 DESC;


Írjuk ki azon dolgozókat, akik a 10-es vagy 20-as osztályban dolgoznak!

SELECT *
FROM dolgozok
WHERE osztalykod = 10 OR osztalykod = 20;

SELECT *
FROM dolgozok
WHERE osztalykod IN (10, 20);


Keressük ki a dolgozók nevét, munkakörét és osztálykódját! Az adatokat rendezzük az osztálykód szerint növekvő sorrendbe, egy osztályon belül pedig a dolgozó neve szerinti betűrendi sorrendbe!

SELECT vnev, knev, munkakor, osztalykod
FROM dolgozok
ORDER BY osztalykod, vnev, knev;

SELECT vnev, knev, munkakor, osztalykod
FROM dolgozok
ORDER BY 4, 1, 2;


Keressük ki a 30-as osztályban dolgozó asztalosokat!

SELECT *
FROM dolgozok
WHERE osztalykod = 30 AND munkakor = 'ASZTALOS';


Keressük ki azokat a dolgozókat, akik kapnak jutalékot!

SELECT *
FROM dolgozok
WHERE jutalek IS NOT NULL;


Keressük ki mindazon dolgozókat, akik 1999-ben léptek be a céghez! (A feladat helyes megoldása függ a környezettől, amiben dolgozunk!)

SELECT *
FROM dolgozok
WHERE munkaba_allas LIKE '1999-%';


Keressük ki mindazon dolgozók nevét, éves fizetését és jutalékát, akiknek a havi fizetése nagyobb, mint a jutaléka! Az eredmény sorokat az éves fizetés csökkenő sorrendjében rendezzük! Ha két vagy több dolgozónak azonos a fizetése, akkor ezek a nevük szerinti betűrendi sorrendben szerepeljenek!

SELECT vnev, knev, 12*fizetes, jutalek
FROM dolgozok
WHERE fizetes > fizetes*jutalek/100
ORDER BY 3 DESC, 1, 2;



SQL szűrési példák

1)      Készítsd el a csatolt táblázatnak megfelelő táblát! Valamint legalább egy sort szúrjál be! (4 pont)

CREATE TABLE nevek
(nev VARCHAR(20),
munkakor VARCHAR(20),
megjegyzes VARCHAR(30));

INSERT INTO nevek
VALUES(’Pumukli’,’Denver’,’Weasel’);
INSERT INTO munkakor
VALUES('suhanc',’őslény’,’gengszter’);
INSERT INTO megjegyzes
VALUES(’Én vagyok Menyus’);


2)      Írjuk ki, azoknak a dolgozóknak minden adatát, akik nem kapnak jutalékot. Úgy, hogy a megjelenítéskor a neveket tartalmazó oszlopok nevében ne legyen rövidítés! (3 pont)

SELECT *
FROM dolgozok
WHERE jutalek IS NULL;


3)      Keressük ki a MUNKAKÖR és az OSZTALYKOD párost a DOLGOZOK táblából úgy, hogy az értékek ne ismétlődjenek (3 pont)

SELECT DISTINCT munkakor, osztalykod
FROM dolgozok;


4)      Keressük ki az asztalosok, illetve a 20-as osztályban dolgozók minden adatát a DOLGOZOK táblából! (3 pont)

SELECT *
FROM dolgozok
WHERE osztalykod = 20 AND munkakor = 'ASZTALOS';


5)      Keressük ki a dolgozók kódját, nevét, munkakörét és osztálykódját! Az adatokat rendezzük osztálykód szerint csökkenő sorrendbe, egy osztályon belül pedig a dolgozó neve szerinti betűrendi sorrendbe! (4 pont)

SELECT dolgozokod, vnev, knev, munkakor, osztalykod
FROM dolgozok
ORDER BY osztalykod DESC, vnev, knev;


6)      Keressük ki azokat a dolgozókat, akiknek a keresztnevében van ’E’ és ’S’ karakter! (4 pont)

SELECT dolgozokod
FROM dolgozok
WHERE vnev LIKE ‘%E%’ AND vnev LIKE ’%S%’;


7)      Minden dolgozónak számítsuk ki az éves jövedelmét, a jutalékkal együtt számítva azt! (Ne felejtsük el, hogy a fizetés havi szinten van megadva! A jutalék pedig százalékban!) (4 pont)

SELECT vnev, knev, 12*fizetes, 12*fizetes+12*fizetes*(jutalek/100)
FROM dolgozok;



SQL szűrési példák

1) Írjuk ki a 'FŐNÖK' munkakörben dolgozók minden adatát! (3 pont)

SELECT dolgozokod, vnev, knev, munkakor, fizetes
FROM dolgozok
WHERE UPPER(munkakor) = 'FŐNÖK';


SELECT * 
FROM dolgozok
WHERE UPPER(munkakor) = 'FŐNÖK';


2) Keressük ki mindazon munkaköröket, ahol 3-nál kevesebben dolgoznak! (3 pont)

SELECT munkakor
FROM dolgozok
GROUP BY munkakor
HAVING COUNT(*) < 3;


3) Írjuk ki az átlagos jutalékot úgy, hogy ha valaki nem kap jutalékot azt is számoljuk bele az átlagba! (3 pont)

SELECT SUM(jutalek)/COUNT(*)
FROM dolgozok;

SELECT AVG(NVL(jutalek, 0))
FROM dolgozok;


4) Írjuk ki minden osztályhoz a legnagyobb és legkisebb fizetés különbségét „Különbség” oszlopban érték szerint növekvő sorba rendezve! (3 pont)

SELECT osztalykod, MAX(fizetes)-MIN(fizetes) "Különbség"
FROM dolgozok
GROUP BY osztalykod
ORDER BY 2;


5) Írjuk ki minden dolgozó nevét, munkakörét, fizetését, valamint osztályának a nevét, ott ahol a hely Sopron!(4 pont)

SELECT d.*, o.*
FROM dolgozok d, osztalyok o
WHERE d.osztalykod = o.osztalykod AND LOWER(o.hely) = 'sopron';

SELECT d.vnev, d.knev, d.munkakor, d.fizetes, o.osztalynev 
FROM dolgozok d, osztalyok o
WHERE d.osztalykod = o.osztalykod AND LOWER(o.hely) = 'sopron';


6) Keressük ki azokat a dolgozókat, akik fizetése kisebb, mint az átlagfizetés! (3 pont)

SELECT *
FROM dolgozok
WHERE fizetes < (SELECT AVG(fizetes)
                 FROM dolgozok);


7) Keressük meg azokat a munkaköröket, melyek a 20 osztályban előfordulnak, de a 30-asban nem! (3 pont)

SELECT munkakor
FROM dolgozok
WHERE osztalykod = 20 AND munkakor IN (SELECT munkakor
				       FROM dolgozok
				       WHERE osztalykod != 30);

SELECT DISTINCT munkakor
FROM dolgozok
WHERE osztalykod = 20 AND munkakor NOT IN (SELECT munkakor
				           FROM dolgozok
				           WHERE osztalykod = 30);


8) Írjuk ki azon dolgozókat és fizetésüket, akik fizetése a legnagyobb a saját osztályukon belül! (4 pont)


SELECT vnev, knev, munkakor, fizetes
FROM dolgozok
WHERE (munkakor, fizetes) IN (SELECT munkakor, MAX(fizetes)
			      FROM dolgozok
			      GROUP BY munkakor);


SELECT vnev, knev, dolgozokod, fizetes
FROM dolgozok
WHERE (osztalykod, fizetes) IN (SELECT osztalykod, MAX(fizetes)
			       FROM dolgozok
			       GROUP BY osztalykod);


9) Melyik osztály(ok)on nagyobb a maximumfizetés, mint a 10-es osztályon? (4 pont)


SELECT DISTINCT osztalykod, MAX (fizetes)
FROM dolgozok
WHERE fizetes > (SELECT MAX(fizetes)
                 FROM dolgozok
                 WHERE osztalykod = 10);




SQL szűrési példák

1) Keressük ki azokat az asztalosokat, akiknek a fizetésük 100e és 200e között van!

SELECT dolgozokod, vnev, knev, munkakor, fizetes
FROM dolgozok
WHERE LOWER(munkakor) = 'asztalos' AND fizetes BETWEEN 100 AND 200;

SELECT dolgozokod, vnev, knev, munkakor, fizetes
FROM dolgozok
WHERE UPPER(munkakor) = 'ASZTALOS' AND fizetes >= 100 AND fizetes <= 200;


2) Számítsuk ki a napi jövedelmet úgy, hogy a napi jövedelmet kerekítsük ki, valamint kerekítsük le!

Oracle:
SELECT ROUND(fizetes/30), TRUNC(fizetes/30)
FROM dolgozok;

MySQL:
SELECT ROUND(fizetes/30), TRUNCATE(fizetes/30,0)
FROM dolgozok;


3) Keressük ki a dolgozókat és a fizetéseiket! Az eredményben szerepeltessük a fizetés 15%-al megnövelt kerekített értékét Emelés oszlopban!

SELECT *, ROUND(fizetes*1.15) AS "Emelés"
FROM dolgozok;


4) Keressük meg a legkisebb fizetést a Dolgozok táblából!

SELECT MIN(fizetes)
FROM dolgozok;


5) Keressük meg a legkisebb és a legnagyobb fizetést, valamint az átlagfizetést!

SELECT MIN(fizetes), MAX(fizetes), AVG(fizetes)
FROM dolgozok;


6) Minden munkakörhöz keressük meg a legkisebb és a legnagyobb fizetést!

SELECT munkakor, MIN(fizetes), MAX(fizetes)
FROM dolgozok
GROUP BY munkakor;


7) Minden munkakörhöz számítsuk ki az átlagfizetést és az átlagos éves jövedelmet (ne feledkezzünk meg a jutalékról).

SELECT munkakor, AVG(fizetes), AVG(fizetes*12*NVL(1+jutalek/100,1)) AS "Átlagos Éves Jövedelem"
FROM dolgozok
GROUP BY munkakor;


8) Számítsuk ki a legnagyobb és a legkisebb fizetés közti különbséget!

SELECT MAX(fizetes)-MIN(fizetes)
FROM dolgozok;

SELECT ABS(MIN(fizetes)-MAX(fizetes))
FROM dolgozok;


9) Keressük ki mindazon osztályokat, ahol 4-nél nem kevesebben dolgoznak!


Ha nincs szükség az osztalykodon kívül más adatra az osztályokról:

SELECT osztalykod
FROM dolgozok
GROUP BY osztalykod
HAVING COUNT(*) >= 4;


Ha osztályok egyéb adatait is ki szeretnénk írni:
Összekapcsolással:

SELECT o.*
FROM dolgozok d, osztalyok o
WHERE d.osztalykod = o.osztalykod
GROUP BY d.osztalykod
HAVING COUNT(*) >= 4;


Allekérdezéssel:

SELECT *
FROM osztalyok
WHERE osztalykod IN (SELECT osztalykod
		     FROM dolgozok
		     GROUP BY osztalykod
		     HAVING COUNT(*) >= 4);


10) Keressük ki azoknak a dolgozóknak a nevét, osztálykódját, osztályuk nevét, akiknek az osztályában 4-en, vagy többen dolgoznak!

SELECT d.vnev, d.knev, d.osztalykod, o.osztalynev
FROM dolgozok d, osztalyok o
WHERE d.osztalykod = o.osztalykod
GROUP BY d.osztalykod
HAVING COUNT(*) >= 4;


11) Melyik városban mennyi osztály van?

SELECT hely, COUNT(*)
FROM osztalyok
GROUP BY hely;


12) Keressük ki mindazon osztályokat, ahol 2-nél több olyan dolgozó dolgozik, akinek a DOLGOZOKOD-ja kisebb 7900-nál! Azt is írjuk ki, hány ilyen dolgozó van osztályonként!

SELECT osztalykod, COUNT(*)
FROM dolgozok
WHERE dolgozokod < 7900
GROUP BY osztalykod
HAVING COUNT(*) > 2;


13) Keressük ki a Szegeden dolgozókat, az eredményben szerepeljen a HELY is!

SELECT d.*, o.hely
FROM dolgozok d, osztalyok o
WHERE d.osztalykod = o.osztalykod AND LOWER(o.hely)='szeged';


14) Minden dolgozóhoz, akinek a havi fizetése nem több 150-nél, keressük ki az osztálya telephelyét és megnevezését!

SELECT d.*, o.hely, o.osztalynev
FROM dolgozok d, osztalyok o
WHERE d.osztalykod = o.osztalykod AND d.fizetes <= 150;


15) Keressük ki azokat a munkaköröket, amelyek előfordulnak a 20-as és a 40-es osztályban!

SELECT munkakor
FROM dolgozok
WHERE osztalykod = 20
INTERSECT
SELECT munkakor
FROM dolgozok
WHERE osztalykod = 40;


SELECT munkakor
FROM dolgozok
WHERE osztalykod = 20 AND munkakor IN (SELECT munkakor
				       FROM dolgozok
				       WHERE osztalykod = 40);


16) Keressük meg a legnagyobb fizetésű dolgozókat!

SELECT *
FROM dolgozok
WHERE fizetes = (SELECT MAX(fizetes)
                 FROM dolgozok);


17) Keressünk meg minden dolgozót, akinek a fizetése több, mint az átlagfizetés!

SELECT *
FROM dolgozok
WHERE fizetes > (SELECT AVG(fizetes)
                 FROM dolgozok);


18) Keressük ki a Debrecenben dolgozókat!

SELECT d.*, o.*
FROM dolgozok d, osztalyok o
WHERE d.osztalykod = o.osztalykod AND LOWER(o.hely) = 'debrecen';


19) Keressük meg a legrégebben jött dolgozót!

SELECT *
FROM dolgozok
WHERE munkaba_allas = (SELECT MIN(munkaba_allas)
		       FROM dolgozok);


20) Keressük meg azokat a dolgozókat, akik a legrégebben dolgoznak osztályaikon!

SELECT vnev, knev, munkaba_allas
FROM dolgozok
WHERE (osztalykod, munkaba_allas) IN (SELECT osztalykod, MIN(munkaba_allas)
		                      FROM dolgozok
			              GROUP BY osztalykod);


21) Keressük ki azokat a dolgozókat, akik a saját munkakörükben a legnagyobb fizetéssel rendelkeznek!

SELECT vnev, knev, munkakor, fizetes
FROM dolgozok
WHERE (munkakor, fizetes) IN (SELECT munkakor, MAX(fizetes)
			      FROM dolgozok
			      GROUP BY munkakor);


22) Melyik munkakörben a legalacsonyabb az átlagfizetés?

Oracle:
SELECT munkakor, AVG(fizetes)
FROM dolgozok
GROUP BY munkakor
HAVING AVG(fizetes) = (SELECT MIN(AVG(fizetes))
                       FROM dolgozok
		       GROUP BY munkakor);


MySQL:
SELECT munkakor, AVG(fizetes)
FROM dolgozok
GROUP BY munkakor
HAVING AVG(fizetes) = (SELECT AVG(fizetes)
                       FROM dolgozok
		       GROUP BY munkakor
		       ORDER BY 1
		       LIMIT 1);
			   
			   
SQL szűrési példák

http://infojegyzet.hu/vizsgafeladatok/okj-mysql/rendszeruzemelteto-190514/


1. feladat: 

CREATE DATABASE katica 
DEFAULT CHARACTER SET UTF8 COLLATE utf8 hungarian ci


3. feladat: 

ALTER TABLE kategoria 
ADD CONSTRAINT PRIMARY KEY (id); 


4. feladat:

ALTER TABLE forgalom 
ADD FOREIGN KEY (kategoriaId) REFERENCES kategoria(id);


6. feladat: 

INSERT INTO kategoria (kategoriaNev) 
VALUES ('Ajándéktárgyak');


7. feladat: 

UPDATE forgalom 
SET termek = 'Gyros tál' 
WHERE termek = 'Gyrostál'; 


8. feladat: 

SELECT termek, vevo 
FROM forgalom 
WHERE kiadva=0 
ORDER BY vevo;


9. feladat: 

SELECT k.kategoriaNEV AS "Kategória", 
SUM(f.nettoar*f.mennyiseg) AS "Nettó bevétel", 
SUM(f.nettoar*f.mennyiseg)*0,27 AS "Forgalmi adó" 
FROM kategoria k, forgalom f
WHERE k.id = f.kategoriaId
GROUP BY k.kategoriaNEV;


SQL szűrési példák

/* 1. feladat:  */

CREATE DATABASE centrum DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci

/* 3. feladat:  */
SELECT kezeles.id,kezeles.kezdet,kezeles.veg,kezeles.dij FROM kezeles 

/* 4. feladat:  */
SELECT gazda.nev,gazda.kerulet 
FROM gazda
WHERE gazda.kerulet=17 OR gazda.kerulet=18
ORDER BY gazda.kerulet,gazda.nev

/* 5. feladat:  */
SELECT kezelestipus.jelleg,COUNT(kezeles.id) AS darabszám
FROM kezelestipus INNER JOIN kezeles ON kezelestipus.id=kezeles.kezelestipusId
GROUP BY kezelestipus.jelleg
ORDER BY darabszám DESC

/* 6. feladat:  */
SELECT kezelestipus.jelleg,kezeles.kezdet,kezeles.veg,kezeles.dij
FROM kezelestipus INNER JOIN kezeles ON kezelestipus.id=kezeles.kezelestipusId
WHERE kezeles.veg BETWEEN '2017-10-01' AND '2017-12-31' AND kezelestipus.jelleg LIKE "%gyógy%"

/* 7. feladat:  */
SELECT gazda.nev AS név,COUNT(kezeles.id) AS alkalom,SUM(kezeles.dij) AS összesen
FROM gazda INNER JOIN kutya ON gazda.id=kutya.gazdaId
INNER JOIN kezeles ON kutya.id=kezeles.kutyaId
GROUP BY gazda.nev
HAVING gazda.nev LIKE "%Medgyessy%"

/* 1. feladat*/
CREATE DATABASE verseny
DEFAULT CHARACTER SET UTF8 COLLATE utf8_hungarian_ci;

/* 3. feladat*/
SELECT nev
FROM versenyzo
ORDER BY eletkor DESC;

/* 4. feladat*/
SELECT COUNT(*) AS "palyak_szama"
FROM palya;

/* 5. feladat*/
SELECT cs.nev AS "csapat", v.nev AS "versenyzo"
FROM csapat cs, versenyzo v
WHERE cs.id = v.csapatid AND cs.nev LIKE '%z%'
ORDER BY 1;

/* 6. feladat*/
SELECT p.nev AS "palyanev", v.nev AS "versenyzonev", k.korido
FROM palya p, korido k, versenyzo v
WHERE p.id = k.palyaid AND v.id = k.versenyzoid AND p.orszag = 'Olaszország' AND k.kor = 1;

﻿/* 1. feladat*/
CREATE DATABASE verseny
DEFAULT CHARACTER SET UTF8 COLLATE utf8_hungarian_ci;

/* 3. feladat*/
SELECT nev
FROM versenyzo
ORDER BY eletkor DESC;

/* 4. feladat*/
SELECT COUNT(*) AS "palyak_szama"
FROM palya;

/* 5. feladat*/
SELECT cs.nev AS "csapat", v.nev AS "versenyzo"
FROM csapat cs, versenyzo v
WHERE cs.id = v.csapatid AND cs.nev LIKE '%z%'
ORDER BY 1;

/* 6. feladat*/
SELECT p.nev AS "palyanev", v.nev AS "versenyzonev", k.korido
FROM palya p, korido k, versenyzo v
WHERE p.id = k.palyaid AND v.id = k.versenyzoid AND p.orszag = 'Olaszország' AND k.kor = 1;


SQL szűrési példák

1)

CREATE DATABASE autoberles
DEFAULT CHARSET UTF8 COLLATE utf8_hungarian_ci;

USE autoberles;


2)

A,

CREATE TABLE berlok
(id INT AUTO_INCREMENT PRIMARY KEY,
 nev VARCHAR(100) NOT NULL,
 jogositvany VARCHAR(15) NOT NULL,
 telefonszam VARCHAR(20));
 
B,

CREATE TABLE autok
(id INT AUTO_INCREMENT PRIMARY KEY,
 rendszam VARCHAR(6) NOT NULL UNIQUE,
 tipus VARCHAR(100) NOT NULL,
 evjarat INT,
 szin VARCHAR(30));

C,
 
CREATE TABLE kolcsonzes
(id INT AUTO_INCREMENT PRIMARY KEY,
 berloid INT,
 autoid INT,
 berletkezdete DATE NOT NULL,
 napokszama INT,
 napidij INT NOT NULL,
 FOREIGN KEY (berloid) REFERENCES berlok(id),
 FOREIGN KEY (autoid) REFERENCES autok(id));


3)

INSERT INTO autok (rendszam, tipus, evjarat, szin)
VALUES
('ABC456', 'Ford Ka', 2003, 'Pink'),
('ABC123', 'Volkswagen Golf', 2011, 'Fehér'),
('ABC157', 'Ford Mondeo', 2015, 'Fekete'),
('ABC448', 'Volkswagen Golf', 2012, 'Kék');
 

INSERT INTO berlok (nev, jogositvany, telefonszam)
VALUES
('Kandúr Károly', 'LR337157', '06-41-334112'),
('Gipsz Jakab', 'VE445112', '06-41-555223');



4)

INSERT INTO kolcsonzes (berloid, autoid, berletkezdete, napidij)
VALUES
((SELECT id FROM berlok WHERE UPPER(nev) = 'KANDÚR KÁROLY'),
(SELECT id FROM autok WHERE UPPER(rendszam) = 'ABC157'),
'2017-04-23', 12500);


INSERT INTO kolcsonzes (berloid, autoid, berletkezdete, napidij)
VALUES
((SELECT id FROM berlok WHERE UPPER(nev) = 'GIPSZ JAKAB'),
(SELECT id FROM autok WHERE UPPER(rendszam) = 'ABC123'),
'2017-04-25', 9999);


UPDATE kolcsonzes
SET napokszama = DATE('2017-04-28') - berletkezdete + 1
WHERE berloid = (SELECT id
                 FROM berlok
				 WHERE UPPER(nev) = 'KANDÚR KÁROLY');


5)

SELECT berloid, SUM(napokszama * napidij) AS "Bérleti díj"
FROM kolcsonzes
GROUP BY berloid
HAVING berloid IN (SELECT id
                   FROM berlok
				   WHERE UPPER(nev) = 'KANDÚR KÁROLY');


SELECT berloid, napokszama * napidij AS "Bérleti díj"
FROM kolcsonzes
WHERE berloid IN (SELECT id
                  FROM berlok
				  WHERE UPPER(nev) = 'KANDÚR KÁROLY');

SELECT a.rendszam, b.nev
FROM autok a, berlok b, kolcsonzes k
WHERE a.id = k.autoid AND b.id = k.berloid AND k.napokszama IS NULL;