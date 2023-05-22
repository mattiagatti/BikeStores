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
        username         VARCHAR2(200);
        staff_id         STAFFS.staff_id% TYPE;
        role_level       STAFFS.role_level% TYPE;
        staff_department STAFFS.department% TYPE;
        staff_store      STAFFS.store_id% TYPE;

    BEGIN
        username := SYS_CONTEXT('USERENV', 'SESSION_USER');
        SELECT STAFFS.staff_id, STAFFS.role_level, STAFFS.department, STAFFS.store_id
        INTO staff_id, role_level, staff_department, staff_store
        FROM ADMIN.STAFFS
        WHERE SUBSTR(staffs.email, 1, INSTR(staffs.email, '@') - 1) = username;

        DBMS_SESSION.SET_CONTEXT('staff_ctx', 'staff_id', staff_id);
        DBMS_SESSION.SET_CONTEXT('staff_ctx', 'role_level', role_level);
        DBMS_SESSION.SET_CONTEXT('staff_ctx', 'staff_department', staff_department);
        DBMS_SESSION.SET_CONTEXT('staff_ctx', 'staff_store', staff_store);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN NULL;
    END;
END;

/
CREATE OR REPLACE EDITIONABLE TRIGGER "ADMIN"."SET_STAFF_CTX_TRIG"
    AFTER LOGON
    ON DATABASE
BEGIN
    set_staff_ctx_pkg.set_emp;
    -- EXCEPTION
    -- WHEN OTHERS THEN dbms_output.put_line('EXCEPTION_OTHERS');
END;

-- ORDS non è riuscito a eseguire la connessione al database. Ciò può verificarsi se il database non è disponibile, è stato raggiunto il numero massimo di sessioni o il pool non è configurato correttamente. Il connection pool denominato: |ocid1.autonomousdatabase.oc1.eu-milan-1.anwgsljrdur4slqaundpovmh7hc6xk6pq3jls44bjc7kfqgwspe2lnkxhslq|re| ha avuto i seguenti errori: Exception occurred while getting connection: oracle.ucp.UniversalConnectionPoolException: Universal Connection Pool internal error: oracle.ucp.UniversalConnectionPoolException: Cannot get Connection from Datasource: java.sql.SQLSyntaxErrorException: ORA-04098: trigger 'ADMIN.SET_STAFF_CTX_TRIG' is invalid and failed re-validation