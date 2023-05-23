----------------
--   TASK 5   --
----------------

-- Application context:
-- staff_id, role_level, store_id

CREATE OR REPLACE CONTEXT staff_ctx USING set_staff_ctx_pkg;
/

CREATE OR REPLACE PACKAGE set_staff_ctx_pkg IS
    PROCEDURE set_staff;
END;
/

CREATE OR REPLACE PACKAGE BODY set_staff_ctx_pkg IS
    PROCEDURE set_staff
        IS
        username         VARCHAR2(200);
        staff_id         STAFFS.staff_id% TYPE;
        role_level       STAFFS.role_level% TYPE;
        store_id      STAFFS.store_id% TYPE;

    BEGIN
        username := SYS_CONTEXT('USERENV', 'SESSION_USER');
        SELECT STAFFS.staff_id, STAFFS.role_level, STAFFS.store_id
        INTO staff_id, role_level, store_id
        FROM ADMIN.STAFFS
        WHERE UPPER(SUBSTR(STAFFS.email, 1, INSTR(STAFFS.email, '@') - 1)) = username;

        DBMS_SESSION.SET_CONTEXT('staff_ctx', 'staff_id', staff_id);
        DBMS_SESSION.SET_CONTEXT('staff_ctx', 'role_level', role_level);
        DBMS_SESSION.SET_CONTEXT('staff_ctx', 'store_id', store_id);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN NULL;
    END;
END;
/

CREATE OR REPLACE TRIGGER set_staff_ctx_trig
    AFTER LOGON
    ON DATABASE
BEGIN
    set_staff_ctx_pkg.set_staff;
    EXCEPTION
    WHEN OTHERS THEN dbms_output.put_line('EXCEPTION_OTHERS');
END;

-------------------
-- Staff privacy --
-------------------

---------------------
-- Assigned orders --
---------------------

CREATE OR REPLACE FUNCTION only_assigned(
    schema_var VARCHAR2,
    table_var VARCHAR2)
RETURN VARCHAR2
IS
return_val VARCHAR2(400);
staff_id STAFFS.staff_id% TYPE;
BEGIN
staff_id := SYS_CONTEXT ('staff_ctx', 'staff_id');
return_val := 'ORDERS.staff_id = ' || staff_id;
RETURN return_val;
END only_assigned;
/

BEGIN
SYS.DBMS_RLS.ADD_POLICY(
    OBJECT_SCHEMA =>'ADMIN',
    OBJECT_NAME => 'ORDERS',
    POLICY_NAME => 'VPD_only_assigned',
    FUNCTION_SCHEMA =>'ADMIN',
    POLICY_FUNCTION =>'only_assigned'
);
END;

-------------------
-- Filter stocks --
-------------------
