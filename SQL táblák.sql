Osztalyok tábla létrehozása:

Oracle:
CREATE TABLE osztalyok
(osztalykod NUMBER(2),
osztalynev VARCHAR(20),
ir_szam NUMBER(5),
hely VARCHAR(20));

MySQL:
CREATE TABLE osztalyok
(osztalykod INT(2),
osztalynev VARCHAR(20),
ir_szam INT(5),
hely VARCHAR(20));


Osztalyok tábla szerkezetének kiírása:

DESCRIBE osztalyok;

DESC osztalyok;


Sorok beszúrása az osztalyok táblába:

INSERT INTO osztalyok
VALUES(10,'KÖNYVELÉS',5630,'BÉKÉS');
INSERT INTO osztalyok
VALUES(20,'FEJLESZTÉS',5700,'GYULA');
INSERT INTO osztalyok
VALUES(30,'TERMELÉS',5600,'BÉKÉSCSABA');
INSERT INTO osztalyok
VALUES(40,'ELADÁS',6725,'SZEGED');
INSERT INTO osztalyok
VALUES(50,'PÉNZÜGY',5222,'ÖRMÉNYES');




Ellenörzése:

SELECT * FROM OSZTALY;


SELECT * FROM `osztalyok`;



Dolgozok tábla létrehozása:

Oracle:
CREATE TABLE dolgozok
(dolgozokod NUMBER(4),
vnev VARCHAR(20),
knev VARCHAR(10),
munkakor VARCHAR(15),
munkaba_allas DATE,
felettes NUMBER(4),
fizetes NUMBER(10,2),
jutalek NUMBER(7,2),
osztalykod NUMBER(2));

MySQL:
CREATE TABLE dolgozok
(DOLGOZOKOD INT(4),
vnev VARCHAR(20),
knev VARCHAR(10),
munkakor VARCHAR(15),
munkaba_allas DATE,
felettes INT(4),
fizetes INT(10),
jutalek INT(7),
osztalykod INT(2));



Sorok beszúrása a dolgozok táblába:
Oracle alatt:
INSERT INTO dolgozok
VALUES(7049,'RÁBAI','BÁLINT','FŐNÖK',
TO_DATE('1988-01-26','YYYY-MM-DD'),'',165,.05,10);
INSERT INTO dolgozok
VALUES(7068,'DIRICZI','ZSOLT','IGAZGATÓ',TO_DATE('1990-10-14','YYYY-MM-DD'),7049,124,'',10);
INSERT INTO dolgozok
VALUES(7220,'TARSOLY','CSABA','KÖNYVELŐ',TO_DATE('1993-04-08','YYYY-MM-DD'),7049,180,'',10);
INSERT INTO dolgozok
VALUES(7338,'SZŰCS','LÁSZLÓ','FŐNÖK',TO_DATE('1995-03-01','YYYY-MM-DD'),'',215,.1,20);
INSERT INTO dolgozok
VALUES(7402,'VIG','MELINDA','FEJLESZTŐ',TO_DATE('1991-02-10','YYYY-MM-DD'),7338,172,'',20);
INSERT INTO dolgozok
VALUES(7410,'SZILÁGYI','ILONA','FEJLESZTŐ',TO_DATE('1992-11-30','YYYY-MM-DD'),7338,163,'',20);
INSERT INTO dolgozok
VALUES(7325,'GOMBKÖTŐ','TAMÁS','FEJLESZTŐ',TO_DATE('1992-11-30','YYYY-MM-DD'),7338,165,'',20);
INSERT INTO dolgozok
VALUES(7500,'FEKETE','LÁSZLÓ','FŐNÖK',TO_DATE('1986-02-18','YYYY-MM-DD'),'',120,0.03,30);
INSERT INTO dolgozok
VALUES(7666,'CSUTA','NORBERT','ASZTALOS',TO_DATE('1988-05-20','YYYY-MM-DD'),7500,105,'',30);
INSERT INTO dolgozok
VALUES(7635,'KORCSOK','TAMÁS','ASZTALOS',TO_DATE('1989-04-01','YYYY-MM-DD'),7500,110,'',30);
INSERT INTO dolgozok
VALUES(7700,'KOMÁR','GYÖRGY','ASZTALOS',TO_DATE('1993-07-21','YYYY-MM-DD'),7500,95,'',30);
INSERT INTO dolgozok
VALUES(7832,'HÜRKECZ','JÁNOS','FŐNÖK',TO_DATE('1988-05-18','YYYY-MM-DD'),'',240,'',40);
INSERT INTO dolgozok
VALUES(7881,'BALOGH','TAMÁS','KERESKEDŐ',TO_DATE('1994-01-31','YYYY-MM-DD'),7832,197,'',40);
INSERT INTO dolgozok
VALUES(7920,'FAZEKAS','BÉLA','KERESKEDŐ',TO_DATE('1989-04-21','YYYY-MM-DD'),7832,210,'',40);
INSERT INTO dolgozok
VALUES(8120,'VAKOND','SZANISZLÓ','KERESKEDŐ',TO_DATE('1980-04-01','YYYY-MM-DD'),'',50,'','');

MySQL alatt:
INSERT INTO dolgozok
VALUES(7049,'RÁBAI','BÁLINT','FŐNÖK','1988-01-26',NULL,165,15,10);
INSERT INTO dolgozok
VALUES(7068,'DIRICZI','ZSOLT','IGAZGATÓ','1990-10-14',7049,124,NULL,10);
INSERT INTO dolgozok
VALUES(7220,'TARSOLY','CSABA','KÖNYVELŐ','1993-04-08',7049,180,NULL,10);
INSERT INTO dolgozok
VALUES(7338,'SZŰCS','LÁSZLÓ','FŐNÖK','1995-03-01',NULL,215,21,20);
INSERT INTO dolgozok
VALUES(7402,'VIG','MELINDA','FEJLESZTŐ','1991-02-10',7338,172,NULL,20);
INSERT INTO dolgozok
VALUES(7410,'SZILÁGYI','ILONA','FEJLESZTŐ','1992-11-30',7338,163,NULL,20);
INSERT INTO dolgozok
VALUES(7325,'GOMBKÖTŐ','TAMÁS','FEJLESZTŐ','1992-11-30',7338,165,NULL,20);
INSERT INTO dolgozok
VALUES(7500,'FEKETE','LÁSZLÓ','FŐNÖK','1986-02-18',NULL,120,3,30);
INSERT INTO dolgozok
VALUES(7666,'CSUTA','NORBERT','ASZTALOS','1988-05-20',7500,105,NULL,30);
INSERT INTO dolgozok
VALUES(7635,'KORCSOK','TAMÁS','ASZTALOS','1989-04-01',7500,110,NULL,30);
INSERT INTO dolgozok
VALUES(7700,'KOMÁR','GYÖRGY','ASZTALOS','1993-07-21',7500,95,NULL,30);
INSERT INTO dolgozok
VALUES(7832,'HÜRKECZ','JÁNOS','FŐNÖK','1988-05-18',NULL,240,NULL,40);
INSERT INTO dolgozok
VALUES(7881,'BALOGH','TAMÁS','KERESKEDŐ','1994-01-31',7832,197,NULL,40);
INSERT INTO dolgozok
VALUES(7920,'FAZEKAS','BÉLA','KERESKEDŐ','1989-04-21',7832,210,NULL,40);
INSERT INTO dolgozok
VALUES(8120,'VAKOND','SZANISZLÓ','KERESKEDŐ','1980-04-01',NULL,50,NULL,NULL);


SQL Táblák létrehozása 

USE katica;

CREATE TABLE kategoria (
  id INT NOT NULL,
  kategoriaNev NVARCHAR(50) DEFAULT NULL
);

CREATE TABLE forgalom (
  id INT NOT NULL,
  termek NVARCHAR(50) DEFAULT NULL,
  vevo NVARCHAR(20) DEFAULT NULL,
  kategoriaId INT DEFAULT NULL,
  egyseg NVARCHAR(10) DEFAULT NULL,
  nettoar INT DEFAULT NULL,
  mennyiseg INT DEFAULT NULL,
  kiadva BOOLEAN DEFAULT NULL,
  PRIMARY KEY (id)
);


USE katica;

INSERT INTO kategoria(id, kategoriaNev) VALUES
  (1, 'Ételek'),
  (2, 'Italok');

INSERT INTO forgalom(id, termek, vevo, kategoriaId, egyseg, nettoar, mennyiseg, kiadva) VALUES
(246, 'Sajtos hot-dog', 'Lajos', 1, 'db', 450, 2, TRUE),
(247, 'Limonádé', 'Lajos', 2, 'dl', 100, 5, TRUE),
(248, 'Gyrostál', 'Kinga', 1, 'db', 1500, 1, TRUE),
(249, 'Ízes palacsinta', 'Kinga', 1, 'db', 350, 2, TRUE),
(250, 'Túros palacsinta', 'Kinga', 1, 'db', 270, 1, TRUE),
(251, 'Narancslé', 'Kinga', 2, 'dl', 150, 3, TRUE),
(252, 'Főtt virsli', 'Jenő', 1, 'pár', 450, 2, FALSE),
(253, 'Kenyér', 'Jenő', 1, 'szelet', 60, 2, TRUE),
(254, 'Gyrostál', 'Ági', 1, 'db', 1500, 3, FALSE),
(255, 'Málnaszörp', 'Ági', 2, 'dl', 100, 10, FALSE),
(256, 'Sajtos hot-dog', 'Lajos', 2, 'db', 450, 2, FALSE),
(257, 'Málnaszörp', 'Lajos', 2, 'dl', 100, 3, FALSE),
(258, 'Gyrostál', 'Jenő', 1, 'db', 1500, 1, FALSE);



SQL Táblák létrehozása 

CREATE TABLE fajta (
  id int NOT NULL,
  fajtanev varchar(30) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE gazda (
  id int NOT NULL,
  nev varchar(50) DEFAULT NULL,
  kerulet int DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE kezelestipus (
  id int NOT NULL,
  jelleg varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE kutya (
  id int NOT NULL,
  fajtaId int DEFAULT NULL,
  nem tinyint DEFAULT NULL,
  korEv int DEFAULT NULL,
  korHonap int DEFAULT NULL,
  gazdaId int DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_kutya_fajta_id FOREIGN KEY (fajtaId)
  REFERENCES fajta (id),
  CONSTRAINT FK_kutya_gazda_id FOREIGN KEY (gazdaId)
  REFERENCES gazda (id)
);

CREATE TABLE kezeles (
  id int NOT NULL,
  kutyaId int DEFAULT NULL,
  kezelestipusId int DEFAULT NULL,
  kezdet date DEFAULT NULL,
  veg date DEFAULT NULL,
  dij int DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_kezeles_kezelestipus_id FOREIGN KEY (kezelestipusId)
  REFERENCES kezelestipus (id),
  CONSTRAINT FK_kezeles_kutya_id FOREIGN KEY (kutyaId)
  REFERENCES kutya (id)
  );
  
  
SQL Táblák létrehozása 
 
 CREATE TABLE csapat (
  id int,
  nev varchar(255),
  alapitva int,
  PRIMARY KEY (id)
);

CREATE TABLE palya (
  id int,
  nev varchar(255),
  hossz float,
  orszag varchar(255),
  PRIMARY KEY (id)
);

CREATE TABLE versenyzo (
  id int,
  nev varchar(255),
  eletkor int,
  csapatid int,
  PRIMARY KEY (id),
  CONSTRAINT FK_versenyzo_csapat_id FOREIGN KEY(csapatid) REFERENCES csapat(id)
);

CREATE TABLE korido (
  id int,
  palyaid int,
  versenyzoid int,
  korido time DEFAULT NULL,
  kor int DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_korido_palya_id FOREIGN KEY (palyaid) REFERENCES palya(id),
  CONSTRAINT FK_korido_versenyzo_id FOREIGN KEY (versenyzoid) REFERENCES versenyzo(id)
);


SQL Táblák létrehozása 

Create table termekek (
	id int not null AUTO_INCREMENT PRIMARY key,
    megnevezes varchar(40) not null UNIQUE,
    ar numeric(10,0)
);

create table vevok (
	id int not null AUTO_INCREMENT PRIMARY key,
	nev varchar(100) not null,
	iranyitoszam varchar(4),
	telepules varchar(50),
	utcahazszam varchar(100)
);

create table szamlafej (
	id int not null AUTO_INCREMENT PRIMARY key,
	szamlaszam varchar(30) not null unique,
	kelt datetime not null,
	teljesites datetime not null,
	vevoid int not null
);

create table szamlatetel (
	id int not null AUTO_INCREMENT PRIMARY key,
	szamlafejid int not null,
	termekid int not null,
	mennyiseg int not null,
	mennyisegiegyseg varchar(20) not null,
	bruttoegysegar numeric(10,0) not null,
	afaszazalek int not null
);


SQL Táblák létrehozása 

