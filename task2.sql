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
    genna.serrano, virgie.wiggins, madeleine.norton, gabriel.howells;

-- juniors and seniors store 2
GRANT SELECT ON STAFF_INFO_STORE_2 TO
    marcelene.boyer, venita.daniel, zoe.mellor, charlie.knight;

-- managers
GRANT SELECT ON STAFFS TO
    fabiola.jackson, mireya.copeland, eve.randall, jannette.david, isobel.price;

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

GRANT SELECT ON ORDERS_SALESMAN_2 TO mireya.copeland;
GRANT SELECT ON ORDERS_SALESMAN_3 TO genna.serrano;
GRANT SELECT ON ORDERS_SALESMAN_4 TO virgie.wiggins;
GRANT SELECT ON ORDERS_SALESMAN_8 TO jannette.david;
GRANT SELECT ON ORDERS_SALESMAN_9 TO marcelene.boyer;
GRANT SELECT ON ORDERS_SALESMAN_10 TO venita.daniel;

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

GRANT SELECT ON ORDERS_CUSTOMER_1 TO debra.burks;
GRANT SELECT ON ORDERS_CUSTOMER_2 TO kasha.todd;

--------------------------
-- Product cost policy --
--------------------------

CREATE VIEW PRODUCT_WO_COST AS
SELECT product_id, product_name, brand_id, category_id, model_year, list_price
FROM PRODUCTS
ORDER BY product_name;

-- juniors and seniors
GRANT SELECT ON PRODUCT_WO_COST TO
    genna.serrano, virgie.wiggins, madeleine.norton, gabriel.howells,
    marcelene.boyer, venita.daniel, zoe.mellor, charlie.knight;

-- managers
GRANT SELECT ON PRODUCTS TO
    fabiola.jackson, mireya.copeland, eve.randall, jannette.david, isobel.price;

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
    virgie.wiggins, gabriel.howells;

-- juniors store 2
GRANT SELECT ON STOCKS_STORE_2 TO
    venita.daniel, charlie.knight;

-- seniors and above
GRANT SELECT ON STOCKS TO
    fabiola.jackson, mireya.copeland, genna.serrano, eve.randall, madeleine.norton,
    jannette.david, marcelene.boyer, isobel.price, zoe.mellor;

--------------------------
-- New products policy --
--------------------------

-- warehousemen
GRANT SELECT, UPDATE, INSERT ON CATEGORIES TO
    eve.randall, madeleine.norton, gabriel.howells,
    isobel.price, zoe.mellor, charlie.knight;
GRANT SELECT, UPDATE, INSERT ON BRANDS TO
    eve.randall, madeleine.norton, gabriel.howells,
    isobel.price, zoe.mellor, charlie.knight;
GRANT SELECT, UPDATE, INSERT ON PRODUCTS TO
    eve.randall, madeleine.norton, gabriel.howells,
    isobel.price, zoe.mellor, charlie.knight;
