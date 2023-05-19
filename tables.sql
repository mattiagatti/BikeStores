DROP TABLE stocks;
DROP TABLE order_items;
DROP TABLE orders;
DROP TABLE staffs;
DROP TABLE stores;
DROP TABLE customers;
DROP TABLE products;
DROP TABLE brands;
DROP TABLE categories;

-- create tables
CREATE TABLE categories (
	category_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	category_name VARCHAR2(255) NOT NULL
);

CREATE TABLE brands (
	brand_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	brand_name VARCHAR2(255) NOT NULL
);

CREATE TABLE products (
	product_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	product_name VARCHAR2(255) NOT NULL,
	brand_id INT NOT NULL,
	category_id INT NOT NULL,
	model_year SMALLINT NOT NULL,
	list_price DECIMAL(10, 2) NOT NULL,
	cost_price DECIMAL(10, 2) DEFAULT 0.01,
	FOREIGN KEY (category_id) REFERENCES categories (category_id) ON DELETE CASCADE, -- ON UPDATE CASCADE,
	FOREIGN KEY (brand_id) REFERENCES brands (brand_id) ON DELETE CASCADE -- ON UPDATE CASCADE
);

CREATE TABLE customers (
	customer_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	first_name VARCHAR2(255) NOT NULL,
	last_name VARCHAR2(255) NOT NULL,
	phone VARCHAR2(25),
	email VARCHAR2(255) NOT NULL,
	street VARCHAR2(255),
	city VARCHAR2(50),
	state VARCHAR2(25),
	zip_code VARCHAR2(5)
);

CREATE TABLE stores (
	store_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	store_name VARCHAR2(255) NOT NULL,
	phone VARCHAR2(25),
	email VARCHAR2(255),
	street VARCHAR2(255),
	city VARCHAR2(255),
	state VARCHAR2(10),
	zip_code VARCHAR2(5)
);

CREATE TABLE staffs (
	staff_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	first_name VARCHAR2(50) NOT NULL,
	last_name VARCHAR2(50) NOT NULL,
	email VARCHAR2(255) NOT NULL UNIQUE,
	phone VARCHAR2(25),
	active NUMBER(1) NOT NULL,
	store_id INT NOT NULL,
	manager_id INT,
	department VARCHAR2(50),
	-- department: "SALES"; "WAREHOUSE"
	role_level NUMBER(1) DEFAULT 1 NOT NULL,
	-- Role level: 1-4
	salary NUMBER(10) DEFAULT 1000 NOT NULL,
	FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE CASCADE, -- ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES staffs (staff_id) -- ON DELETE NO ACTION, ON UPDATE NO ACTION
);

CREATE TABLE orders (
	order_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	customer_id INT,
	order_status NUMBER(1) NOT NULL,
	-- Order status: 1 = Pending; 2 = Processing; 3 = Rejected; 4 = Completed
	order_date DATE NOT NULL,
	required_date DATE NOT NULL,
	shipped_date DATE,
	store_id INT NOT NULL,
	staff_id INT NOT NULL,
	address VARCHAR2(255) DEFAULT 'Foo address',
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE, -- ON UPDATE CASCADE,
	FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE CASCADE, -- ON UPDATE CASCADE,
	FOREIGN KEY (staff_id) REFERENCES staffs (staff_id) -- ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE order_items (
	order_id INT,
	item_id INT,
	product_id INT NOT NULL,
	quantity INT NOT NULL,
	list_price DECIMAL(10, 2) NOT NULL,
	discount DECIMAL(4, 2) DEFAULT 0 NOT NULL,
	PRIMARY KEY (order_id, item_id),
	FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE CASCADE, -- ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE -- ON UPDATE CASCADE
);

CREATE TABLE stocks (
	store_id INT,
	product_id INT,
	quantity INT,
	PRIMARY KEY (store_id, product_id),
	FOREIGN KEY (store_id) REFERENCES stores (store_id) ON DELETE CASCADE, -- ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE -- ON UPDATE CASCADE
);