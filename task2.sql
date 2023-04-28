----------------
--   TASK 2   --
----------------

-- Staff policy policy

CREATE VIEW STAFF_L2_S1 AS
SELECT staff_id, first_name, last_name, email, phone, store_id, manager_id
FROM ADMIN.STAFFS
WHERE active = 1
  AND role_level < 2
  AND store.id = 1;

GRANT SELECT ON STAFF_L2_S1 TO STAFF2;

------------------------------------------------------------

-- Assigned order policy

CREATE VIEW STAFF_ORDER_1 AS
SELECT *
FROM ADMIN.ORDERS
WHERE staff_id = 1
ORDER BY order_date;

GRANT SELECT ON STAFF_L2_S1 TO STAFF2;


-- ??? --
CREATE VIEW STAFF_ORDER_1 AS
SELECT *
FROM ADMIN.ORDERS o
         JOIN ADMIN.ORDER_ITEMS i ON o.order_id = i.order_id
         JOIN ADMIN.PRODUCTS p ON p.item_id = i.item_id
WHERE o.staff_id = 1
ORDER BY o.order_date;
-- ??? --

-------------------------------------------------------------

-- Customer order policy

CREATE VIEW CUSTOMER_ORDERS_1 AS
SELECT *
FROM ADMIN.ORDERS o
WHERE customer_id = 1;

GRANT SELECT ON ADMIN.CUSTOMER_ORDERS_1 TO CUSTOMER1;

-------------------------------------------------------------

-- Product cost policy

CREATE VIEW PRODUCT_WO_COST AS
SELECT product_id, product_name, brand_id, category_id, model_year, list_price
FROM ADMIN.PRODUCTS
ORDER BY product_name;

GRANT SELECT ON PRODUCT_WO_COST TO STAFF3;

-------------------------------------------------------------

-- Stocks policy

CREATE VIEW STORE_STOCKS AS
SELECT p.product_id, p.product_name, p.brand_id, p.category_id, p.model_year, p.list_price, s.quantity
FROM ADMIN.STOCKS s
         JOIN ADMIN.PRODUCT p ON s.product_id = p.product_id
WHERE s.store_id = 1;

GRANT SELECT ON STORE_STOCKS TO STAFF3;

--------------------------------------------------------------

-- New product
GRANT SELECT ON ADMIN.CATEGORIES TO WAREHOUSEMAN1;
GRANT SELECT ON ADMIN.BRANDS TO WAREHOUSEMAN1;
GRANT SELECT ON ADMIN.PRODUCTS TO WAREHOUSEMAN1;
GRANT INSERT ON ADMIN.CATEGORIES TO WAREHOUSEMAN1;
GRANT INSERT ON ADMIN.BRANDS TO WAREHOUSEMAN1;
GRANT INSERT ON ADMIN.PRODUCTS TO WAREHOUSEMAN1;
GRANT UPDATE ON ADMIN.PRODUCTS TO WAREHOUSEMAN1;
