----------------
--   TASK 2   --
----------------

--------------------------
-- Staff privacy policy --
--------------------------

CREATE VIEW STAFF_INFO_STORE_1 AS
SELECT staff_id, first_name, last_name, email, phone, store_id, manager_id
FROM STAFFS
WHERE active = 1
  AND store_id = 1;

CREATE VIEW STAFF_INFO_STORE_2 AS
SELECT staff_id, first_name, last_name, email, phone, store_id, manager_id
FROM STAFFS
WHERE active = 1
  AND store_id = 2;

-- juniors and seniors store 1
GRANT SELECT ON STAFF_INFO_STORE_1 TO
    genna_serrano, virgie_wiggins, madeleine_norton, gabriel_howells;

-- juniors and seniors store 2
GRANT SELECT ON STAFF_INFO_STORE_2 TO
    marcelene_boyer, venita_daniel, zoe_mellor, charlie_knight;

-- managers
GRANT SELECT ON STAFFS TO
    fabiola_jackson, mireya_copeland, eve_randall, jannette_david, isobel_price;

----------------------------
-- Assigned orders policy --
----------------------------

CREATE VIEW ORDERS_SALESMAN_2 AS
SELECT *
FROM ORDERS
WHERE staff_id = 2
ORDER BY order_date;

CREATE VIEW ORDERS_SALESMAN_3 AS
SELECT *
FROM ORDERS
WHERE staff_id = 3
ORDER BY order_date;

CREATE VIEW ORDERS_SALESMAN_4 AS
SELECT *
FROM ORDERS
WHERE staff_id = 4
ORDER BY order_date;

CREATE VIEW ORDERS_SALESMAN_8 AS
SELECT *
FROM ORDERS
WHERE staff_id = 8
ORDER BY order_date;

CREATE VIEW ORDERS_SALESMAN_9 AS
SELECT *
FROM ORDERS
WHERE staff_id = 9
ORDER BY order_date;

CREATE VIEW ORDERS_SALESMAN_10 AS
SELECT *
FROM ORDERS
WHERE staff_id = 10
ORDER BY order_date;

GRANT SELECT ON ORDERS_SALESMAN_2 TO mireya_copeland;
GRANT SELECT ON ORDERS_SALESMAN_3 TO genna_serrano;
GRANT SELECT ON ORDERS_SALESMAN_4 TO virgie_wiggins;
GRANT SELECT ON ORDERS_SALESMAN_8 TO jannette_david;
GRANT SELECT ON ORDERS_SALESMAN_9 TO marcelene_boyer;
GRANT SELECT ON ORDERS_SALESMAN_10 TO venita_daniel;

----------------------------
-- Customer orders policy --
----------------------------

CREATE VIEW ORDERS_CUSTOMER_1 AS
SELECT *
FROM ORDERS
WHERE customer_id = 1
ORDER BY order_date;

CREATE VIEW ORDERS_CUSTOMER_2 AS
SELECT *
FROM ORDERS
WHERE customer_id = 2
ORDER BY order_date;

GRANT SELECT ON ORDERS_CUSTOMER_1 TO debra_burks;
GRANT SELECT ON ORDERS_CUSTOMER_2 TO kasha_todd;

--------------------------
-- Product cost policy --
--------------------------

CREATE VIEW PRODUCT_WO_COST AS
SELECT product_id, product_name, brand_id, category_id, model_year, list_price
FROM PRODUCTS
ORDER BY product_name;

-- juniors and seniors
GRANT SELECT ON PRODUCT_WO_COST TO
    genna_serrano, virgie_wiggins, madeleine_norton, gabriel_howells,
        marcelene_boyer, venita_daniel, zoe_mellor, charlie_knight;

-- managers
GRANT SELECT ON PRODUCTS TO
    fabiola_jackson, mireya_copeland, eve_randall, jannette_david, isobel_price;

-------------------
-- Stocks policy --
-------------------

CREATE VIEW STOCKS_STORE_1 AS
SELECT p.product_id, p.product_name, p.brand_id, p.category_id, p.model_year, p.list_price, s.quantity
FROM STOCKS s
         JOIN PRODUCTS p ON s.product_id = p.product_id
WHERE s.store_id = 1;

CREATE VIEW STOCKS_STORE_2 AS
SELECT p.product_id, p.product_name, p.brand_id, p.category_id, p.model_year, p.list_price, s.quantity
FROM STOCKS s
         JOIN PRODUCTS p ON s.product_id = p.product_id
WHERE s.store_id = 2;

-- juniors store 1
GRANT SELECT ON STOCKS_STORE_1 TO
    virgie_wiggins, gabriel_howells;

-- juniors store 2
GRANT SELECT ON STOCKS_STORE_2 TO
    venita_daniel, charlie_knight;

-- seniors and above
GRANT SELECT ON STOCKS TO
    fabiola_jackson, mireya_copeland, genna_serrano, eve_randall, madeleine_norton,
        jannette_david, marcelene_boyer, isobel_price, zoe_mellor;

--------------------------
-- New products policy --
--------------------------

-- warehousemen
GRANT SELECT, UPDATE, INSERT ON CATEGORIES TO
    eve_randall, madeleine_norton, gabriel_howells,
        isobel_price, zoe_mellor, charlie_knight;
GRANT SELECT, UPDATE, INSERT ON BRANDS TO
    eve_randall, madeleine_norton, gabriel_howells,
        isobel_price, zoe_mellor, charlie_knight;
GRANT SELECT, UPDATE, INSERT ON PRODUCTS TO
    eve_randall, madeleine_norton, gabriel_howells,
        isobel_price, zoe_mellor, charlie_knight;
