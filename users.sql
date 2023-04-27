CREATE USER bikestores IDENTIFIED BY Pwd_123456_pwd;
CREATE USER salesman1 IDENTIFIED BY Pwd_123456_pwd;
CREATE USER salesman2 IDENTIFIED BY Pwd_123456_pwd;
CREATE USER salesman3 IDENTIFIED BY Pwd_123456_pwd;
CREATE USER salesman4 IDENTIFIED BY Pwd_123456_pwd;
CREATE USER warehouseman1 IDENTIFIED BY Pwd_123456_pwd;
CREATE USER warehouseman2 IDENTIFIED BY Pwd_123456_pwd;
CREATE USER warehouseman3 IDENTIFIED BY Pwd_123456_pwd;
CREATE USER warehouseman4 IDENTIFIED BY Pwd_123456_pwd;

GRANT CREATE SESSION TO bikestores;
GRANT CREATE SESSION TO salesman1;
GRANT CREATE SESSION TO salesman2;
GRANT CREATE SESSION TO salesman3;
GRANT CREATE SESSION TO salesman4;
GRANT CREATE SESSION TO warehouseman1;
GRANT CREATE SESSION TO warehouseman2;
GRANT CREATE SESSION TO warehouseman3;
GRANT CREATE SESSION TO warehouseman4;

GRANT CREATE ANY TABLE TO BIKESTORES;
GRANT UNLIMITED TABLESPACE TO bikestores;