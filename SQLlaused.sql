--kommentaar
--SQL SERVER Managment Stuudio
--Conect TO:
--Server Name:  (localdb)\mssqllocaldb
-- Authentification 2 tüüpi:
--1. Windows Auth - localdb admini õigused
--2. SQL Server Auth - kontrollida varem tehtud kasutajad

CREATE DATABASE merkulovaLOGITpv23;
USE merkulovaLOGITpv23;

--tabeli loomine
--identity(1,1) - ise täidab tabeli 1,2,3,...
CREATE TABLE inimene(
inimeneID int Primary Key identity(1,1),
nimi varchar(50) unique,
synniaeg date,
telefon char(12),
pikkus decimal(5,2),
opilaskodu bit
);
SELECT * FROM inimene;

--tabeli kustutamine
DROP table inimene;
SELECT * FROM inimene;

--tabeli kustutamine
DROP table inimene;

--andmete lisamine
--DDL - data definition language
--DML -data manipulation language

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu)
VALUES
('Peeter Uus', '2021-12-30', '2568952', 90.5, 0),
('Kaarel Oja', '2000-12-30', '2568952', 90.5, 0),
('Kask Mati', '1983-12-30', '33333', 140.5, 0),
('Peeter Oja', '2021-12-30', '333333', 190.5, 0)
;

SELECT * FROM inimene;
--kustuta id=3
DELETE FROM inimene
WHERE inimeneID=3;

--tabel elukoht
CREATE TABLE elukoht(
elukohtID int PRIMARY KEY identity(1,1),
elukoht varchar(50) UNIQUE,
maakond varchar(50)
);
SELECT * FROM elukoht;
--andmete lisamine tabeli elukoht
INSERT INTO elukoht(elukoht, maakond)
VALUES ('Tartu', 'Tartumaa'),
('Pärnu', 'Pärnumaa');

--tabeli muutmine uue veergu lisamine
ALTER TABLE inimene ADD elukohtID int;
SElect * from inimene;
-- foreign key lisamine
Alter table inimene 
ADD Constraint fk_elukoht
FOREIGN KEY (elukohtID) 
references elukoht(elukohtID);

SElect * from inimene;
Select * from elukoht;

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID)
VALUES
('Peeter Vana', '2021-12-30', '2568952' , 90.5 , 0 , 1);

SElect * from inimene join elukoht
ON inimene.elukohtID=elukoht.elukohtID;

SElect inimene.nimi, inimene.synniaeg, elukoht.elukoht
from inimene join elukoht
ON inimene.elukohtID=elukoht.elukohtID;

SElect i.nimi, i.synniaeg, e.elukoht
from inimene i join elukoht e
ON i.elukohtID=e.elukohtID;




