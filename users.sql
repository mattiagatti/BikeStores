-- top manager
CREATE USER fabiola_jackson IDENTIFIED BY Pwd_123456_pwd;

-- sales manager of store 1
CREATE USER mireya_copeland IDENTIFIED BY Pwd_123456_pwd;
-- senior salesman of store 1
CREATE USER genna_serrano IDENTIFIED BY Pwd_123456_pwd;
-- junior salesman of store 1
CREATE USER virgie_wiggins IDENTIFIED BY Pwd_123456_pwd;
-- warehouse manager of store 1
CREATE USER eve_randall IDENTIFIED BY Pwd_123456_pwd;
-- senior warehouseman of store 1
CREATE USER madeleine_norton IDENTIFIED BY Pwd_123456_pwd;
-- junior warehouseman of store 1
CREATE USER gabriel_howells IDENTIFIED BY Pwd_123456_pwd;

-- sales manager of store 2
CREATE USER jannette_david IDENTIFIED BY Pwd_123456_pwd;
-- senior salesman of store 2
CREATE USER marcelene_boyer IDENTIFIED BY Pwd_123456_pwd;
-- junior salesman of store 2
CREATE USER venita_daniel IDENTIFIED BY Pwd_123456_pwd;
-- warehouse manager of store 2
CREATE USER isobel_price IDENTIFIED BY Pwd_123456_pwd;
-- senior warehouseman of store 2
CREATE USER zoe_mellor IDENTIFIED BY Pwd_123456_pwd;
-- junior warehouseman of store 2
CREATE USER charlie_knight IDENTIFIED BY Pwd_123456_pwd;

-- customers
CREATE USER debra_burks IDENTIFIED BY Pwd_123456_pwd;
CREATE USER kasha_todd IDENTIFIED BY Pwd_123456_pwd;

GRANT CREATE SESSION TO fabiola_jackson;
GRANT CREATE SESSION TO mireya_copeland;
GRANT CREATE SESSION TO genna_serrano;
GRANT CREATE SESSION TO virgie_wiggins;
GRANT CREATE SESSION TO jannette_david;
GRANT CREATE SESSION TO marcelene_boyer;
GRANT CREATE SESSION TO venita_daniel;
GRANT CREATE SESSION TO eve_randall;
GRANT CREATE SESSION TO madeleine_norton;
GRANT CREATE SESSION TO gabriel_howells;
GRANT CREATE SESSION TO isobel_price;
GRANT CREATE SESSION TO zoe_mellor;
GRANT CREATE SESSION TO charlie_knight;
GRANT CREATE SESSION TO debra_burks;
GRANT CREATE SESSION TO kasha_todd;