drop user POLICIA_MUNICIPAL;
create user POLICIA_MUNICIPAL identified by POLICIA_MUNICIPAL;
grant create session,resource to POLICIA_MUNICIPAL;
alter user POLICIA_MUNICIPAL quota unlimited on SIM;
conn POLICIA_MUNICIPAL/POLICIA_MUNICIPAL

alter table POLICIA_MUNICIPAL.ActaDevolucion drop constraint ActaDevolucion_fk;
alter table POLICIA_MUNICIPAL.ActaDevolucion drop constraint ActaDevolucion_fk1;
alter table POLICIA_MUNICIPAL.ActaDevolucion drop constraint ActaDevolucion_fk2;
alter table POLICIA_MUNICIPAL.Objeto drop constraint Objeto_fk; 
alter table POLICIA_MUNICIPAL.ActaDonacion drop constraint ActaDonacion_fk; 
alter table POLICIA_MUNICIPAL.ActaDonacion drop constraint ActaDonacion_fk1;
alter table POLICIA_MUNICIPAL.ActaDecomiso drop constraint ActaDecomiso_fk; 
--alter table POLICIA_MUNICIPAL.ActaDecomiso drop constraint ActaDecomiso_fk1;
--alter table POLICIA_MUNICIPAL.ActaDecomiso drop constraint ActaDecomiso_fk2; 
alter table POLICIA_MUNICIPAL.ActaDestruccion drop constraint ActaDestruccion_fk;
--alter table POLICIA_MUNICIPAL.ActaDestruccion drop constraint ActaDestruccion_fk1;
--alter table POLICIA_MUNICIPAL.ActaDestruccion drop constraint ActaDestruccion_fk2;
drop sequence cod_id_int;
drop sequence sequence_obj;
drop sequence sequence_adecomiso;
drop sequence sequence_adonacion;
drop sequence sequence_adevolucion;
drop sequence sequence_adestruccion;
drop sequence cod_id_test;
drop sequence sequence_user;

drop table POLICIA_MUNICIPAL.Interesado;
drop table POLICIA_MUNICIPAL.ActaDecomiso;
drop table POLICIA_MUNICIPAL.ActaDonacion;
drop table POLICIA_MUNICIPAL.Objeto;
drop table POLICIA_MUNICIPAL.ActaDevolucion;
drop table POLICIA_MUNICIPAL.ActaDestruccion;
drop table POLICIA_MUNICIPAL.RH_EMPLEADO;
drop table POLICIA_MUNICIPAL.Usuario;
drop table POLICIA_MUNICIPAL.Testigos;

CREATE TABLE POLICIA_MUNICIPAL.RH_EMPLEADO
(
  NUM_ENTIDAD               NUMBER(3) NOT NULL,
  NUM_EMPLEADO              NUMBER(15)  NOT NULL,
  DES_NOMBRE                VARCHAR2(60 BYTE)  NOT NULL,
  DES_APELLIDO1             VARCHAR2(80 BYTE)  NOT NULL,
  DES_APELLIDO2             VARCHAR2(80 BYTE)  NOT NULL,
  FEC_INGRESO               DATE  NOT NULL)
  TABLESPACE SIM
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          192K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

  
create table POLICIA_MUNICIPAL.Interesado
(IdInteresado number not null,
cedula varchar2(20)not null,
nombre varchar2(40)not null,
primerapellido varchar2(40)not null,
segundoapellido varchar2(40),
fechanac date,
residencia varchar2(40)not null,
fotografia varchar2(40)not null
)TABLESPACE SIM
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          192K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;



create table POLICIA_MUNICIPAL.ActaDecomiso
(IdDecomiso number not null,
IdPolicia number not null,
IdInteresado number not null,
lugar number,
fecha date,
hora varchar2(10) not null,
Idacompanante number not null,
observaciones varchar2(40),
idtest number
)
TABLESPACE SIM
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          192K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

create table POLICIA_MUNICIPAL.ActaDonacion
(IdDonacion number not null,
fecha date,
Institucion varchar2(20)not null,
IdPolicia number not null,
IdDecomiso number not null,
detalles varchar2(255)not null
)
TABLESPACE SIM
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          192K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


create table POLICIA_MUNICIPAL.Objeto
(
IdObjeto number not null,
descripcion varchar2(255)not null,
cantidad number not null,
IdDecomiso number not null,
categoria varchar2(20)not null
)
TABLESPACE SIM
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          192K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


create table POLICIA_MUNICIPAL.ActaDestruccion
(IdDestruccion number not null,
fecha date,
IdPolicia number not null,
idt1 number,
idt2 number,
lugar varchar2(20)not null,
Encargado varchar2(20)not null,
IdDecomiso number not null)TABLESPACE SIM
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          192K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


create table POLICIA_MUNICIPAL.ActaDevolucion
(
IdDevolucion number not null,
IdPolicia number not null,
IdDecomiso number not null,
IdInteresado number not null,
fecha date
)
TABLESPACE SIM
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          192K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


create table POLICIA_MUNICIPAL.Usuario
(IdUser number not null,
nick varchar2(40)not null,
contrasena varchar2(15)not null
)
TABLESPACE SIM
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          192K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

create table POLICIA_MUNICIPAL.Testigos(
IdTest number,
nombre varchar2(30),
apellido1 varchar2(30),
apellido2 varchar2(30)
)TABLESPACE SIM
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          192K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;



create sequence cod_id_int start with 1 increment by 1;
create sequence sequence_adecomiso start with 1 increment by 1;
create sequence sequence_adestruccion start with 1 increment by 1;
create sequence sequence_adevolucion start with 1 increment by 1;
create sequence sequence_adonacion start with 1 increment by 1;
create sequence sequence_obj start with 1 increment by 1;
create sequence cod_id_test start with 1 increment by 1;
create sequence sequence_user start with 1 increment by 1;


alter table POLICIA_MUNICIPAL.ActaDecomiso add constraint ActaDecomiso_pk primary key(IdDecomiso);
alter table POLICIA_MUNICIPAL.ActaDestruccion add constraint ActaDestruccion_pk primary key(IdDestruccion);
alter table POLICIA_MUNICIPAL.ActaDevolucion add constraint ActaDevolucion_pk primary key(IdDevolucion);
alter table POLICIA_MUNICIPAL.Objeto add constraint Objeto_pk primary key(IdObjeto);
alter table POLICIA_MUNICIPAL.Interesado add constraint Interesado_pk primary key(IdInteresado);
alter table POLICIA_MUNICIPAL.ActaDonacion add constraint ActaDonacion_pk primary key(IdDonacion);
alter table POLICIA_MUNICIPAL.RH_EMPLEADO add constraint RH_EMPLEADO_PK primary key (NUM_EMPLEADO);
alter table POLICIA_MUNICIPAL.Testigos add constraint Testigos_pk primary key(IdTest);
alter table POLICIA_MUNICIPAL.Usuario add constraint UsuarioM_pk primary key(IdUser);



alter table POLICIA_MUNICIPAL.ActaDevolucion add constraint  ActaDevolucion_fk
foreign key (IdPolicia) references POLICIA_MUNICIPAL.RH_EMPLEADO;
alter table POLICIA_MUNICIPAL.ActaDevolucion add constraint  ActaDevolucion_fk1
foreign key (IdDecomiso) references ActaDecomiso;
alter table POLICIA_MUNICIPAL.ActaDevolucion add constraint  ActaDevolucion_fk2
foreign key (IdInteresado) references Interesado;

alter table POLICIA_MUNICIPAL.Objeto add constraint  Objeto_fk
foreign key (IdDecomiso) references ActaDecomiso;

alter table POLICIA_MUNICIPAL.ActaDonacion add constraint  ActaDonacion_fk
foreign key (IdPolicia) references POLICIA_MUNICIPAL.RH_EMPLEADO;
alter table POLICIA_MUNICIPAL.ActaDonacion add constraint  ActaDonacion_fk1
foreign key (IdDecomiso) references ActaDecomiso;

alter table POLICIA_MUNICIPAL.ActaDecomiso add constraint ActaDecomiso_fk
foreign key (IdPolicia) references POLICIA_MUNICIPAL.RH_EMPLEADO;
--alter table POLICIA_MUNICIPAL.ActaDecomiso add constraint ActaDecomiso_fk1
--foreign key (IdInteresado) references Interesado;
--alter table POLICIA_MUNICIPAL.ActaDecomiso add constraint ActaDecomiso_fk2
--foreign key (Idtest) references POLICIA_MUNICIPAL.RH_EMPLEADO;




alter table POLICIA_MUNICIPAL.ActaDestruccion add constraint ActaDestruccion_fk
foreign key(IdDecomiso) references ActaDecomiso;
--alter table POLICIA_MUNICIPAL.ActaDestruccion add constraint ActaDestruccion_fk1
--foreign key(Idt1) references POLICIA_MUNICIPAL.RH_EMPLEADO;
--alter table POLICIA_MUNICIPAL.ActaDestruccion add constraint ActaDestruccion_fk2
--foreign key(Idt2) references POLICIA_MUNICIPAL.RH_EMPLEADO;



PROMPT PRC_INS_REG

PROMPT PRC_INS_Int
create or replace procedure prc_ins_int
(
Pnombre in varchar2,
Pcedula in varchar2,
Pprimerapellido in varchar2,
Psegundoapellido in varchar2,
Pfechanac in date,
Presidencia in varchar2,
Pfoto in varchar2
)is
begin
insert into POLICIA_MUNICIPAL.Interesado(IdInteresado,nombre,cedula,primerapellido,segundoapellido,fechanac,residencia,fotografia)
values(cod_id_int.nextval,Pnombre,Pcedula,Pprimerapellido,Psegundoapellido,Pfechanac,Presidencia,Pfoto);
commit;
end prc_ins_int;
/
show error;

PROMPT PRC_UPD_Int
create or replace procedure prc_upd_int
(
Pnombre in varchar2,
Pcedula in varchar2,
Pprimerapellido in varchar2,
Psegundoapellido in varchar2,
Pfechanac in date,
Presidencia in varchar2,
Pfoto in varchar2
)is
begin
update POLICIA_MUNICIPAL.Interesado set nombre=Pnombre,primerapellido=Pprimerapellido,segundoapellido=Psegundoapellido,fechanac=Pfechanac,residencia=Presidencia,fotografia=Pfoto
where cedula=Pcedula;
commit;
end prc_upd_int;
/
show error;

PROMPT PRC_INS_Int
create or replace procedure prc_ins_test
(
Pnombre in varchar2,
Pprimerapellido in varchar2,
Psegundoapellido in varchar2
)is
begin
insert into POLICIA_MUNICIPAL.Testigos(IdTest,nombre,apellido1,apellido2)
values(cod_id_test.nextval,Pnombre,Pprimerapellido,Psegundoapellido);
commit;
end prc_ins_test;
/
show error;

create or replace procedure prc_ins_user
(
Pnick in varchar2,
Pcontrasena in varchar2
)is
begin
insert into Usuario(IdUser,nick,contrasena)
values(sequence_user.nextval,Pnick,Pcontrasena);
commit;
end prc_ins_user;
/
show error;

PROMPT PRC_INS_Int
create or replace procedure prc_ins_int
(
Pnombre in varchar2,
Pcedula in varchar2,
Pprimerapellido in varchar2,
Psegundoapellido in varchar2,
Pfechanac in date,
Presidencia in varchar2,
Pfoto in varchar2
)is
begin
insert into POLICIA_MUNICIPAL.Interesado(IdInteresado,nombre,cedula,primerapellido,segundoapellido,fechanac,residencia,fotografia)
values(cod_id_int.nextval,Pnombre,Pcedula,Pprimerapellido,Psegundoapellido,Pfechanac,Presidencia,Pfoto);
commit;
end prc_ins_int;
/
show error;


PROMPT PROCEDURE SELECCIONAR INT
CREATE OR REPLACE PROCEDURE prc_sel_int
(  P_IDINT IN NUMBER,
   P_NOMBRE OUT VARCHAR2,
   P_CEDULA OUT VARCHAR2,
   P_PRIMERAPELLIDO OUT VARCHAR2,
   P_SEGUNDOAPELLIDO OUT VARCHAR2,
   P_FECHANAC OUT DATE,
   P_RESIDENCIA OUT VARCHAR2,
   P_FOTO OUT VARCHAR2
)
AS
BEGIN
   SELECT nombre,cedula,primerapellido,segundoapellido,fechanac,residencia,fotografia INTO P_NOMBRE,P_CEDULA,P_PRIMERAPELLIDO,P_SEGUNDOAPELLIDO,P_FECHANAC,P_RESIDENCIA,P_FOTO      
   FROM POLICIA_MUNICIPAL.Interesado 
   WHERE Interesado.IdInteresado = P_IDINT;
end prc_sel_int;
/
show error;


PROMPT PRC_INS_OBJ
create or replace procedure prc_ins_obj
(
Pdescripcion in varchar2,
Pcantidad in number,
PIdDecomiso in number,
Pcatego in varchar2
)is
begin
insert into POLICIA_MUNICIPAL.Objeto(IdObjeto,descripcion,cantidad,IdDecomiso,categoria)
values(sequence_obj.nextval,Pdescripcion,Pcantidad,PIdDecomiso,Pcatego);
commit;
end prc_ins_obj;
/
show error;



PROMPT PROCEDURE SELECCIONAR OBJ
CREATE OR REPLACE PROCEDURE prc_sel_obj
( 
P_IDOBJETO IN number,
P_DESCRIPCION OUT varchar2,
P_CANTIDAD OUT number,
P_IDDECOMISO OUT number,
P_CATEGORIA OUT VARCHAR2
)
AS
BEGIN
   SELECT descripcion,cantidad,IdDecomiso,categoria INTO P_DESCRIPCION,P_CANTIDAD,P_IDDECOMISO,P_CATEGORIA      
   FROM POLICIA_MUNICIPAL.Objeto 
   WHERE Objeto.IdObjeto = P_IDOBJETO;
end prc_sel_obj;
/
show error;


PROMPT ACTAS

PROMPT PRC_INS_AD
create or replace procedure prc_ins_adecomiso
(PIdDecomiso in number,
PIdPolicia in number,
PIdInteresado in number,
Plugar in number,
Pfecha in date,
PidAcompanante in varchar2,
Pobservaciones in varchar2,
Pidtest in number,
Phora in varchar2
)is
begin
insert into POLICIA_MUNICIPAL.ActaDecomiso(IdDecomiso,IdPolicia,IdInteresado,lugar,fecha,idacompanante,observaciones,idtest,hora)
values(PIdDecomiso,PIdPolicia,PIdInteresado,Plugar,Pfecha,PidAcompanante,Pobservaciones,Pidtest,Phora);
commit;
end prc_ins_adecomiso;
/
show error;



PROMPT PROCEDURE SELECCIONAR ACTA DECOMISO
CREATE OR REPLACE PROCEDURE prc_sel_adecomiso
(PIdDecomiso in number,
PIdPolicia out number,
PIdInteresado out number,
Plugar out number,
Pfecha out date,
PidAcompanante out varchar2,
Pobservaciones out varchar2,
Pidtest out number,
Phora out varchar2
)
AS
BEGIN
   SELECT IdPolicia,IdInteresado,lugar,fecha,idacompanante,observaciones,idtest,hora INTO PIdPolicia,PIdInteresado,Plugar,Pfecha,PidAcompanante,Pobservaciones,Pidtest,Phora      
   FROM POLICIA_MUNICIPAL.ActaDecomiso 
   WHERE ActaDecomiso.IdDecomiso = PIdDecomiso;
end prc_sel_adecomiso;
/
show error;





PROMPT PRC_INS_ADONACION
create or replace procedure prc_ins_adonacion
(PIdDonacion in number,
PFecha in date,
PInstitucion in varchar2,
PIdPolicia in number,
PIdDecomiso in number,
PDetalles in varchar2
)is
begin
insert into POLICIA_MUNICIPAL.ActaDonacion(IdDonacion,fecha,Institucion,IdPolicia,IdDecomiso,detalles)
values(PIdDonacion,PFecha,PInstitucion,PIdPolicia,PIdDecomiso,PDetalles);
commit;
end prc_ins_adonacion;
/
show error;



PROMPT PROCEDURE SELECCIONAR ACTA DONACION
CREATE OR REPLACE PROCEDURE prc_sel_adonacion
(PIdDonacion in number,
PFecha out date,
PInstitucion out varchar2,
PIdPolicia out number,
PIdDecomiso out number,
PDetalles out varchar2
)
AS
BEGIN
   SELECT Institucion,IdPolicia,IdDecomiso,fecha,detalles INTO PInstitucion,PIdPolicia,PIdDecomiso,PFecha,PDetalles      
   FROM POLICIA_MUNICIPAL.ActaDonacion 
   WHERE ActaDonacion.IdDonacion = PIdDonacion;
end prc_sel_adonacion;
/
show error;





PROMPT PRC_INS_ADESTRUCCION
create or replace procedure prc_ins_adestruccion
(PIdDestruccion in number,
Pfecha in date,
PIdPolicia in number,
Pidt1 in number,
Pidt2 in number,
Plugar in varchar2,
PEncargado in varchar2,
PIdDecomiso in number
)is
begin
insert into POLICIA_MUNICIPAL.ActaDestruccion(IdDestruccion,fecha,IdPolicia,idt1,idt2,lugar,Encargado,IdDecomiso)
values(PIdDestruccion,Pfecha,PIdPolicia,Pidt1,Pidt2,Plugar,PEncargado,PIdDecomiso);
commit;
end prc_ins_adestruccion;
/
show error;



PROMPT PROCEDURE SELECCIONAR ACTA DESTRUCCION
CREATE OR REPLACE PROCEDURE prc_sel_adestruccion
(PIdDestruccion in number,
Pfecha out date,
Pidt1 out number,
Pidt2 out number,
Plugar out varchar2,
PEncargado out varchar2,
PIdDecomiso out number

)
AS
BEGIN
   SELECT fecha,idt1,idt2,lugar,Encargado,IdDecomiso INTO Pfecha,Pidt1,Pidt2,Plugar,PEncargado,PIdDecomiso      
   FROM POLICIA_MUNICIPAL.ActaDestruccion 
   WHERE ActaDestruccion.IdDestruccion = PIdDestruccion;
end prc_sel_adestruccion;
/
show error;


PROMPT PRC_INS_ADEVOLUCION
create or replace procedure prc_ins_adevolucion
(PIdDevolucion in number,
PIdPolicia in number,
PIdDecomiso in number,
PIdInteresado in number,
Pfecha in date
)is
begin
insert into POLICIA_MUNICIPAL.ActaDevolucion(IdDevolucion,IdPolicia,IdDecomiso,IdInteresado,fecha)
values(PIdDevolucion,PIdPolicia,PIdDecomiso,PIdInteresado,Pfecha);
commit;
end prc_ins_adevolucion;
/
show error;


PROMPT PROCEDURE SELECCIONAR ACTA DEVOLUCION
CREATE OR REPLACE PROCEDURE prc_sel_adevolucion
(PIdDevolucion in number,
PIdPolicia out number,
PIdDecomiso out number,
PIdInteresado out number,
Pfecha out date

)
AS
BEGIN
   SELECT IdPolicia,IdDecomiso,IdInteresado,fecha INTO PIdPolicia,PIdDecomiso,PIdInteresado,Pfecha      
   FROM POLICIA_MUNICIPAL.ActaDevolucion 
   WHERE ActaDevolucion.IdDevolucion = PIdDevolucion;
end prc_sel_adevolucion;
/
show error;


insert into POLICIA_MUNICIPAL.Interesado(IdInteresado,cedula,nombre,primerapellido,segundoapellido,fechanac,residencia,fotografia) 
values (12221,'402260222','ALLAN','MURILLO','ESTRADA',sysdate-200,'SAN PABLO','PERECEDERO');
insert into POLICIA_MUNICIPAL.RH_EMPLEADO (NUM_ENTIDAD,NUM_EMPLEADO,DES_NOMBRE,DES_APELLIDO1,DES_APELLIDO2,FEC_INGRESO)
values (112,1200,'Marco','Canales','Mesen',sysdate);
insert into POLICIA_MUNICIPAL.RH_EMPLEADO (NUM_ENTIDAD,NUM_EMPLEADO,DES_NOMBRE,DES_APELLIDO1,DES_APELLIDO2,FEC_INGRESO)
values (112,1201,'Bayron','Picado','Obando',sysdate);
insert into POLICIA_MUNICIPAL.ActaDecomiso (IdDecomiso,IdPolicia,IdInteresado,lugar,fecha,Idacompanante,observaciones,idtest, hora)
values (002,1200,12221,2,sysdate,1201,'Robo',1201, '4:00 P.M');
insert into POLICIA_MUNICIPAL.Objeto(IdObjeto,descripcion,cantidad,IdDecomiso, categoria) values(003,'Droga',3,002,'perecedero');
exec prc_ins_user('mario','123');
commit;

CREATE OR REPLACE PROCEDURE prc_prueba(PIdPolicia in number,catCur OUT SYS_REFCURSOR)
is 
BEGIN 
OPEN catCur FOR
SELECT a.IdDecomiso, a.fecha,a.lugar,a.hora,b.nombre,c.categoria,d.DES_NOMBRE
FROM POLICIA_MUNICIPAL.ActaDecomiso a
INNER JOIN POLICIA_MUNICIPAL.Interesado b
ON a.IdInteresado=b.IdInteresado
INNER JOIN POLICIA_MUNICIPAL.Objeto c
ON a.IdDecomiso = c.IdDecomiso
INNER JOIN POLICIA_MUNICIPAL.RH_EMPLEADO d
ON a.IdPolicia = d.NUM_EMPLEADO
where a.IdPolicia=PIdPolicia;
end prc_prueba;
/
show error;


CREATE OR REPLACE PROCEDURE prc_prueba1(PIdPolicia in number,Pfechai in date,Pfechat in date,catCur OUT SYS_REFCURSOR)
is 
BEGIN 
OPEN catCur FOR
SELECT a.IdDecomiso, a.fecha,a.lugar,a.hora,b.nombre,c.categoria,d.DES_NOMBRE
FROM POLICIA_MUNICIPAL.ActaDecomiso a
INNER JOIN POLICIA_MUNICIPAL.Interesado b
ON a.IdInteresado=b.IdInteresado
INNER JOIN POLICIA_MUNICIPAL.Objeto c
ON a.IdDecomiso = c.IdDecomiso
INNER JOIN POLICIA_MUNICIPAL.RH_EMPLEADO d
ON a.IdPolicia = d.NUM_EMPLEADO
where a.IdPolicia=PIdPolicia
and a.fecha BETWEEN Pfechai AND Pfechat;
end prc_prueba1;
/
show error;

