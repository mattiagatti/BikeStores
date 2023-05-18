CREATE USER fabiola.jackson IDENTIFIED BY Pwd_123456_pwd;
CREATE USER mireya.copeland IDENTIFIED BY Pwd_123456_pwd;
CREATE USER layla.terrell IDENTIFIED BY Pwd_123456_pwd;
CREATE USER eve.randall IDENTIFIED BY Pwd_123456_pwd;
CREATE USER isobel.price IDENTIFIED BY Pwd_123456_pwd;
CREATE USER elizabeth.edwards IDENTIFIED BY Pwd_123456_pwd;

GRANT CREATE SESSION TO fabiola.jackson;
GRANT CREATE SESSION TO mireya.copeland;
GRANT CREATE SESSION TO layla.terrell;
GRANT CREATE SESSION TO eve.randall;
GRANT CREATE SESSION TO isobel.price;
GRANT CREATE SESSION TO elizabeth.edwards;


----------------
--   TASK 5   --
----------------

-- Application context:
-- username, id, role_level, role

CREATE CONTEXT staff_ctx USING set_staff_ctx_pkg;
-- SELECT * FROM sys.DBA_CONTEXT;
/
CREATE OR REPLACE EDITIONABLE PACKAGE "ADMIN"."set_staff_ctx_pkg" IS
PROCEDURE set_staff;
END;
/
CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ADMIN"."set_staff_ctx_pkg" IS
PROCEDURE set_staff
IS
username VARCHAR2(200);
staff_id STAFF.staff_id% TYPE;
role_level STAFF.role_level% TYPE;
staff_role STAFF.role% TYPE;

BEGIN
    username := SYS_CONTEXT('USERENV', 'SESSION_USER');
    SELECT STAFF.staff_id, STAFF.role_level, STAFF.role
    INTO staff_id, role_level, staff_role
    FROM ADMIN.STAFF WHERE UPPER(staff.username) = username;

    DBMS_SESSION.SET_CONTEXT('staff_ctx', 'staff_id', staff_id);
    DBMS_SESSION.SET_CONTEXT('staff_ctx', 'role_level', role_level);
    DBMS_SESSION.SET_CONTEXT('staff_ctx', 'staff_role', staff_role);
    EXCEPTION
    WHEN NO_DATA_FOUND THEN NULL;
END;
END;

/
CREATE OR REPLACE EDITIONABLE TRIGGER "ADMIN"."SET_STAFF_CTX_TRIG" AFTER LOGON ON DATABASE
    BEGIN
    set_staff_ctx_pkg.set_emp;
    -- EXCEPTION
    -- WHEN OTHERS THEN dbms_output.put_line('EXCEPTION_OTHERS');
    END