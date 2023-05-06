-- a junior salesman
CREATE USER salesman1 IDENTIFIED BY Pwd_123456_pwd;
-- a senior salesman
CREATE USER salesman2 IDENTIFIED BY Pwd_123456_pwd;
-- salesmen manager
CREATE USER salesman3 IDENTIFIED BY Pwd_123456_pwd;
-- a junior warehouseman
CREATE USER warehouseman1 IDENTIFIED BY Pwd_123456_pwd;
-- a senior warehouseman
CREATE USER warehouseman2 IDENTIFIED BY Pwd_123456_pwd;
-- warehousemen manager
CREATE USER warehouseman3 IDENTIFIED BY Pwd_123456_pwd;
-- top manager
CREATE USER topmanager IDENTIFIED BY Pwd_123456_pwd;
-- customers
CREATE USER customers1 IDENTIFIED BY Pwd_123456_pwd;
CREATE USER customers2 IDENTIFIED BY Pwd_123456_pwd;
CREATE USER customers3 IDENTIFIED BY Pwd_123456_pwd;

GRANT CREATE SESSION TO salesman1;
GRANT CREATE SESSION TO salesman2;
GRANT CREATE SESSION TO salesman3;
GRANT CREATE SESSION TO warehouseman1;
GRANT CREATE SESSION TO warehouseman2;
GRANT CREATE SESSION TO warehouseman3;
GRANT CREATE SESSION TO customers1;
GRANT CREATE SESSION TO customers2;
GRANT CREATE SESSION TO customers3;
GRANT CREATE SESSION TO topmanager;