----------------
--   TASK 3   --
----------------

--- SALESMAN ---
-- Junior Salesman --
-- View definition --

-- ALREADY EXISTS
-- TODO: Check whether the "IF NOT EXISTS" is implicit or not
CREATE VIEW PRODUCT_WO_COST AS
SELECT product_id, product_name, brand_id, category_id, model_year, list_price
FROM ADMIN.PRODUCTS
ORDER BY product_name;

CREATE VIEW CUSTOMER_INFO AS
SELECT customer_id, first_name, last_name, email
FROM ADMIN.CUSTOMERS;

-- Role definition --
CREATE ROLE JUNIOR_SALESMAN;

GRANT SELECT ON PRODUCT_WO_COST TO JUNIOR_SALESMAN;
GRANT SELECT ON ORDERS TO JUNIOR_SALESMAN;
GRANT SELECT ON ORDER_ITEMS TO JUNIOR_SALESMAN;
GRANT SELECT ON CUSTOMER_INFO TO JUNIOR_SALESMAN;

---------------------
-- Senior Salesman --
-- View definition --

CREATE VIEW STAFF_SALE_L2 AS
SELECT staff_id, first_name, last_name, email, phone, store_id, manager_id
FROM ADMIN.STAFFS
WHERE active = 1
AND role_level < 3
AND role = 'SALESMAN';

-- Role Definition --
CREATE ROLE SENIOR_SALESMAN;

GRANT JUNIOR_SALESMAN TO SENIOR_SALESMAN;
GRANT INSERT ON ORDERS TO SENIOR_SALESMAN;
GRANT INSERT ON ORDER_ITEMS TO SENIOR_SALESMAN;
GRANT SELECT ON STOCKS TO SENIOR_SALESMAN;
GRANT UPDATE ON STOCKS TO SENIOR_SALESMAN;
GRANT SELECT ON STAFF_SALE_L2 TO SENIOR_SALESMAN;

----------------------
-- Salesman Manager --
-- View definition --
CREATE VIEW STAFF_L3 AS
SELECT staff_id, first_name, last_name, email, phone, store_id, manager_id
FROM ADMIN.STAFFS
WHERE role_level < 4;

-- Role definition --
CREATE ROLE SALESMAN_MANAGER;

GRANT SENIOR_SALESMAN TO SALESMAN_MANAGER;
GRANT SELECT ON STAFF_L3 TO SALESMAN_MANAGER;
GRANT SELECT ON PRODUCTS TO SALESMAN_MANAGER;

--------------------
--- WAREHOUSEMAN ---

-- Junior Warehouseman --
-- View definition --
CREATE VIEW CUSTOMER_WO_ADDRESS AS
SELECT customer_id, first_name, last_name, phone, email
FROM CUSTOMERS;

-- Role definition --
CREATE ROLE JUNIOR_WAREHOUSEMAN;

GRANT SELECT ON CATEGORIES TO JUNIOR_WAREHOUSEMAN;
GRANT SELECT ON BRANDS TO JUNIOR_WAREHOUSEMAN;
GRANT SELECT ON PRODUCTS TO JUNIOR_WAREHOUSEMAN;
GRANT SELECT ON CUSTOMER_WO_ADDRESS TO JUNIOR_WAREHOUSEMAN;

-- Senior Warehouseman --
CREATE VIEW STAFF_WAREHOUSE_L2 AS
SELECT staff_id, first_name, last_name, email, phone, store_id, manager_id
FROM ADMIN.STAFFS
WHERE active = 1
AND role_level < 3
AND role = 'WAREHOUSEMAN';
-- Role definition --

CREATE ROLE SENIOR_WAREHOUSEMAN;

GRANT JUNIOR_WAREHOUSEMAN TO SENIOR_WAREHOUSEMAN;
GRANT SELECT ON STOCKS TO SENIOR_WAREHOUSEMAN;
GRANT UPDATE ON STOCKS TO SENIOR_WAREHOUSEMAN;
GRANT SELECT ON STAFF_WAREHOUSE_L2 TO SENIOR_WAREHOUSEMAN;

