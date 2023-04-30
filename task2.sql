----------------
--   TASK 2   --
----------------

-- Staff privacy policy

CREATE VIEW STAFF_INFO_STORE_1 AS
SELECT staff_id, first_name, last_name, email, phone, store_id, manager_id
FROM STAFFS
WHERE active = 1
  AND store_id = 1;

-- salesman1 is a junior employee that works in the store 1
GRANT SELECT ON STAFF_INFO_STORE_1 TO salesman1;

-- salesman4 is a manager
GRANT SELECT ON STAFFS TO salesman4;

------------------------------------------------------------

-- Assigned order policy

CREATE VIEW ORDERS_SALESMAN_1 AS
SELECT *
FROM ORDERS
WHERE staff_id = 1
ORDER BY order_date;

-- salesman1 is the salesman with staff_id equals to 1
GRANT SELECT ON ORDERS_SALESMAN_1 TO salesman1;

------------------------------------------------------------

-- Customer order policy

CREATE VIEW ORDERS_CUSTOMER_1 AS
SELECT *
FROM ORDERS
WHERE customer_id = 1
ORDER BY order_date;

-- customer1 is the customer with customer_id equals to 1
GRANT SELECT ON ORDERS_CUSTOMER_1 TO customers1;

-------------------------------------------------------------

-- Product cost policy

CREATE VIEW PRODUCT_WO_COST AS
SELECT product_id, product_name, brand_id, category_id, model_year, list_price
FROM PRODUCTS
ORDER BY product_name;

GRANT SELECT ON PRODUCT_WO_COST TO salesman1;
GRANT SELECT ON PRODUCTS TO salesman4;

-------------------------------------------------------------

-- Stocks policy

CREATE VIEW STOCKS_STORE_1 AS
SELECT p.product_id, p.product_name, p.brand_id, p.category_id, p.model_year, p.list_price, s.quantity
FROM STOCKS s
JOIN PRODUCTS p ON s.product_id = p.product_id
WHERE s.store_id = 1;

GRANT SELECT ON STOCKS_STORE_1 TO salesman1;

--------------------------------------------------------------

-- New product
GRANT SELECT, UPDATE, INSERT ON CATEGORIES TO warehouseman1;
GRANT SELECT, UPDATE, INSERT ON BRANDS TO warehouseman1;
GRANT SELECT, UPDATE, INSERT ON PRODUCTS TO warehouseman1;
