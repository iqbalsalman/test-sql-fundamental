
Nama         : Muhamad Iqbal Salman
Universitas  : Telkom Universitas




CREATE TABLE MST_CIF  (
		  CIFID VARCHAR(10) NOT NULL , 
		  AOID VARCHAR(10) NOT NULL , 
		  DTJOIN DATE NOT NULL , -- tanggal pembukaan
		  FULLNM VARCHAR(60) NOT NULL , 
		  NPWP VARCHAR(20) , 
		  CIFTYPE SMALLINT NOT NULL , -- jenis cif 0 - perorangan , 1 - non perorangan
		  COUNTRYID CHAR(2) NOT NULL , 
		  FLGRELATED Boolean NOT NULL,
		  STATUS CHAR(1), 
		  FLGAPPRV SMALLINT, 
		  USRCRT VARCHAR(5) NOT NULL, 
		  DTCRT TIMESTAMP NOT NULL, 
		  USRUPD VARCHAR(5), 
		  DTUPD TIMESTAMP, 
		  USRAPV VARCHAR(5), 
		  DTAPPRV TIMESTAMP );  

    ALTER TABLE  MST_CIF 
	ADD CONSTRAINT PK_MST_CIF PRIMARY KEY
		(CIFID) ;

		CREATE TABLE MST_CIFPERSNL  (
		  CIFID VARCHAR(10)  NOT NULL , 
		  AOID VARCHAR(10) NOT NULL , 
		  FULLNM VARCHAR(80) NOT NULL , 
		  PREDEGREE VARCHAR(16) , 
		  POSTDEGREE VARCHAR(16) , 
		  SURENM VARCHAR(50) NOT NULL , 
		  MOTHRNM VARCHAR(50) NOT NULL , 
		  RELIGIONID CHAR(1) NOT NULL , 
		  MARRIAGEID CHAR(1) NOT NULL , 
		  LASTEDUID VARCHAR(4) NOT NULL , 
		  NPWP VARCHAR(20) , 
		  BRTDT DATE NOT NULL , 
		  BRTPLACE VARCHAR(32) NOT NULL , 
		  TYPEID CHAR(2) NOT NULL , 
		  IDNBR VARCHAR(32) NOT NULL , 
		  ADDR VARCHAR(64) NOT NULL , 
		  RT VARCHAR(3) , 
		  RW VARCHAR(3) , 
		  KELNM VARCHAR(32) , 
		  POSTALCODE VARCHAR(5) NOT NULL , 
		  KECNM VARCHAR(32) , 
		  CITYID VARCHAR(4) NOT NULL , 
		  PROVID VARCHAR(2) NOT NULL , 
		  COUNTRYID VARCHAR(2) NOT NULL , 
		  NOTELP VARCHAR(16) , 
		  NOFAX VARCHAR(16) , 
		  EXPDT DATE NOT NULL , --masa berlaku jenis identitas
		  STSNATION SMALLINT NOT NULL  , 
		  SEX SMALLINT NOT NULL  , 
		  NOHP VARCHAR(16) , 
		  BLOODTYPE VARCHAR(2) , 
		  HOBBY VARCHAR(20) , 
		  INSURED SMALLINT NOT NULL  , 
		  HOMEID CHAR(1) NOT NULL , 
		  OWNID VARCHAR(4) NOT NULL , 
		  ALIAS VARCHAR(80) , 
		  FLGCITIZEN SMALLINT NOT NULL , 
		  NOTE VARCHAR(150) , 
		  NIP VARCHAR(20) , 
		  JOBID VARCHAR(3));  

ALTER TABLE MST_CIFPERSNL 
	ADD CONSTRAINT PK_MST_CIFPERSNL PRIMARY KEY
		(CIFID) ;




     create table mst_cifcom(
     CIFID CIFID VARCHAR(10) primary key not null,
     COMPNM varchar (225),
     DTBUILD date
     );


ALTER TABLE mst_cifcom 
	ADD CONSTRAINT PK_mst_cifcom PRIMARY KEY
		(CIFID) ;


ALTER TABLE MST_CIF
ADD CONSTRAINT fk_MST_CIF FOREIGN KEY (CIFID)
REFERENCES MST_CIFPERSNL(CIFID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE MST_CIFPERSNL
ADD CONSTRAINT fk_MST_CIFPERSNL FOREIGN KEY (CIFID)
REFERENCES mst_cifcom (CIFID) ON UPDATE CASCADE ON DELETE CASCADE;



insert into mst_cif values('000127752','000006','2016-08-18')
insert into mst_cif values('0001274427','000006','2016-08-04')
insert into mst_cif values('0001277638','00000023')
insert into mst_cif values('0001277952','00000023')
insert into mst_cif values('000397673','00000023')
insert into mst_cif values('000418566','00000023')

--A
select *from mst_cif cif 
join mst_cifpersnl cifp 
       on (cif.cifid=cifp.cifid)
join mst_cifcom com on (cifp.cifid=com.cifid)
where cif.status=2;
--B

select cifid,dtjoin from MST_CIF
where to_char(dtjoin,'months')='08';

--C
select a.aoid, count(a.cifid) as joinedcif
from mst_cif a
left join mst_cifpersnl b on a.cifid=b.cifid
group by a.aoid;

--hasilnya adalah data AOID, dan jumlah CIFID setiap barisnya di group kan berdasarkan AOID ditabel mst_cif

--D
select cifid,aoid,dtjoin,status from mst_cif
where cifid in ('0001277352','0001277638');





