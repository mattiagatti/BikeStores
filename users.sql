-- top manager
CREATE USER fabiola.jackson IDENTIFIED BY Pwd_123456_pwd;

-- sales manager of store 1
CREATE USER mireya.copeland IDENTIFIED BY Pwd_123456_pwd;
-- senior salesman of store 1
CREATE USER genna.serrano IDENTIFIED BY Pwd_123456_pwd;
-- junior salesman of store 1
CREATE USER virgie.wiggins IDENTIFIED BY Pwd_123456_pwd;
-- warehouse manager of store 1
CREATE USER eve.randall IDENTIFIED BY Pwd_123456_pwd;
-- senior warehouseman of store 1
CREATE USER madeleine.norton IDENTIFIED BY Pwd_123456_pwd;
-- junior warehouseman of store 1
CREATE USER gabriel.howells IDENTIFIED BY Pwd_123456_pwd;

-- sales manager of store 2
CREATE USER jannette.david IDENTIFIED BY Pwd_123456_pwd;
-- senior salesman of store 2
CREATE USER marcelene.boyer IDENTIFIED BY Pwd_123456_pwd;
-- junior salesman of store 2
CREATE USER venita.daniel IDENTIFIED BY Pwd_123456_pwd;
-- warehouse manager of store 2
CREATE USER isobel.price IDENTIFIED BY Pwd_123456_pwd;
-- senior warehouseman of store 2
CREATE USER zoe.mellor IDENTIFIED BY Pwd_123456_pwd;
-- junior warehouseman of store 2
CREATE USER charlie.knight IDENTIFIED BY Pwd_123456_pwd;

-- customers
CREATE USER debra.burks IDENTIFIED BY Pwd_123456_pwd;
CREATE USER kasha.todd IDENTIFIED BY Pwd_123456_pwd;

GRANT CREATE SESSION TO fabiola.jackson;
GRANT CREATE SESSION TO mireya.copeland;
GRANT CREATE SESSION TO genna.serrano;
GRANT CREATE SESSION TO virgie.wiggins;
GRANT CREATE SESSION TO jannette.david;
GRANT CREATE SESSION TO marcelene.boyer;
GRANT CREATE SESSION TO venita.daniel;
GRANT CREATE SESSION TO eve.randall;
GRANT CREATE SESSION TO madeleine.norton;
GRANT CREATE SESSION TO gabriel.howells;
GRANT CREATE SESSION TO isobel.price;
GRANT CREATE SESSION TO zoe.mellor;
GRANT CREATE SESSION TO charlie.knight;
GRANT CREATE SESSION TO debra.burks;
GRANT CREATE SESSION TO kasha.todd;