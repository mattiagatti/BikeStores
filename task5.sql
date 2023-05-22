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
        staff_id         STAFF.staff_id% TYPE;
        role_level       STAFF.role_level% TYPE;
        staff_department STAFF.department% TYPE;
        staff_store      STAFF.store_id% TYPE;

    BEGIN
        username := SYS_CONTEXT('USERENV', 'SESSION_USER');
        SELECT STAFF.staff_id, STAFF.role_level, STAFF.role
        INTO staff_id, role_level, staff_department
        FROM ADMIN.STAFF
        WHERE SUBSTR(staff.email, 1, INSTR(staff.email, '@') - 1) = username;

        DBMS_SESSION.SET_CONTEXT('staff_ctx', 'staff_id', staff_id);
        DBMS_SESSION.SET_CONTEXT('staff_ctx', 'role_level', role_level);
        DBMS_SESSION.SET_CONTEXT('staff_ctx', 'staff_department', staff_department);
        DBMS_SESSION.SET_CONTEXT('staff_ctx', 'staff_store', store_id);
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