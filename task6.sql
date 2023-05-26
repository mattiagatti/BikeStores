----------------
--   TASK 6   --
----------------


-- 1) Create the Oracle Label Security Policy Container

BEGIN
SA_SYSDBA.CREATE_POLICY
(
policy_name => 'Prod_OLS_POL',
column_name => 'OLS_COL',
default_options => 'read_control');
END;
/

-- 2) Enable the policy

EXEC SA_SYSDBA.ENABLE_POLICY ('Prod_OLS_POL');
/

-- 3) Create Data Labels for the Label Security Policy

BEGIN
SA_COMPONENTS.CREATE_LEVEL (
Policy_name => 'Prod_OLS_POL',
level_num => 1000,
short_name => 'P',
long_name => 'PUBLIC');
END;
/

BEGIN
SA_COMPONENTS.CREATE_LEVEL (
policy_name => 'Prod_OLS_POL',
level_num => 2000,
short_name => 'S',
long_name => 'SENSITIVE');
END;
/

-- 4) Associating the Policy Components with a Named Data Label

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL (
policy_name => 'PROD_OLS_POL',
label_tag => 1100,
label_value => 'P',
data_label => TRUE);
END;
/

BEGIN
SA_LABEL_ADMIN.CREATE_LABEL (
policy_name => 'PROD_OLS_POL',
label_tag => 2100,
label_value => 'S',
data_label => TRUE);
END;

-- 5) Authorizing Users for Label Security Policies

GRANT SELECT ON PRODUCTS TO FABIOLA_JACKSON;

BEGIN SA_USER_ADMIN.SET_LEVELS(
policy_name => 'PROD_OLS_POL',
user_name => 'FABIOLA_JACKSON',
max_level => 'S',
min_level => 'P',
def_level => 'S',
row_level => 'P');
END;
/

GRANT SELECT ON PRODUCTS TO VIRGIE_WIGGINS;

BEGIN SA_USER_ADMIN.SET_LEVELS(
policy_name => 'PROD_OLS_POL',
user_name => 'VIRGIE_WIGGINS',
max_level => 'P',
min_level => 'P',
def_level => 'P',
row_level => 'P');
END;
/

-- 6) Apply the Policy to a Database Table

BEGIN SA_POLICY_ADMIN.APPLY_TABLE_POLICY (
policy_name => 'PROD_OLS_POL',
schema_name => 'ADMIN',
table_name => 'PRODUCTS');
END;
/

-- 7) Adding a Policy Label to a Table Row

BEGIN
SA_USER_ADMIN.SET_USER_PRIVS (
policy_name => 'PROD_OLS_POL',
user_name => 'ADMIN',
privileges => 'FULL');
END;
/

UPDATE admin.products SET OLS_COL = CHAR_TO_LABEL('PROD_OLS_POL','P')
WHERE list_price != -1;

-- Prototypes
UPDATE admin.products SET OLS_COL = CHAR_TO_LABEL('PROD_OLS_POL','S')
WHERE list_price = -1;
