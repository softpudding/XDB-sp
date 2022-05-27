drop table IF EXISTS nation CASCADE;
drop table IF EXISTS region CASCADE;
drop table IF EXISTS part CASCADE;
drop table IF EXISTS supplier CASCADE;
drop table IF EXISTS partsupp CASCADE;
drop table IF EXISTS orders CASCADE;
drop table IF EXISTS customer CASCADE;
drop table IF EXISTS lineitem CASCADE;
CREATE TABLE region (
	r_regionkey INTEGER PRIMARY KEY,
	r_name CHAR(25),
	r_comment VARCHAR(152),
	r_dummy VARCHAR(10)
);
copy region from '/home/yx/tpch/region.tbl' delimiter '|' csv;
CREATE TABLE nation (
	n_nationkey INTEGER PRIMARY KEY,
	n_name CHAR(25), 
	n_regionkey INTEGER,
	n_comment VARCHAR(152),
	n_dummy VARCHAR(10)
);
copy nation from '/home/yx/tpch/nation.tbl' delimiter '|' csv;
CREATE TABLE supplier (
	s_suppkey INTEGER PRIMARY KEY,
	s_name CHAR(25),
	s_address VARCHAR(40),
	s_nationkey INTEGER,
	s_phone CHAR(15),
	s_acctbal DECIMAL(12, 2),
	s_comment VARCHAR(101),
	s_dummy VARCHAR(10)
);
copy supplier from '/home/yx/tpch/supplier.tbl' delimiter '|' csv;
CREATE TABLE part (
	p_partkey INTEGER PRIMARY KEY,
	p_name VARCHAR(55),
	p_mfgr CHAR(25),
	p_brand CHAR(10),
	p_type VARCHAR(25),
	p_size INTEGER,
	p_container CHAR(10),
	p_retailprice DECIMAL(12, 2),
	p_comment VARCHAR(23),
	p_dummy VARCHAR(10)
);
copy part from '/home/yx/tpch/part.tbl' delimiter '|' csv;
CREATE TABLE customer (
	c_custkey INTEGER PRIMARY KEY,
	c_name VARCHAR(25),
	c_address VARCHAR(40),
	c_nationkey INTEGER,
	c_phone CHAR(15),
	c_acctbal DECIMAL(12, 2),
	c_mktsegment CHAR(10),
	c_comment VARCHAR(117),
	c_dummy VARCHAR(10)
);
copy customer from '/home/yx/tpch/customer.tbl' delimiter '|' csv;
CREATE TABLE partsupp (
	ps_partkey INTEGER,
	ps_suppkey INTEGER,
	ps_availqty INTEGER,
	ps_supplycost DECIMAL(12, 2),
	ps_comment VARCHAR(199),
	ps_dummy VARCHAR(10),
	PRIMARY KEY (ps_partkey, ps_suppkey)
);
copy partsupp from '/home/yx/tpch/partsupp.tbl' delimiter '|' csv;
CREATE TABLE orders (
	o_orderkey INTEGER PRIMARY KEY,
	o_custkey INTEGER REFERENCES customer(c_custkey),
	o_orderstatus CHAR(1),
	o_totalprice DECIMAL(12, 2),
	o_orderdate DATE,
	o_orderpriority CHAR(15),
	o_clerk CHAR(15),
	o_shippriority INTEGER,
	o_comment VARCHAR(79),
	o_dummy VARCHAR(10)
);
copy orders from '/home/yx/tpch/orders.tbl' delimiter '|' csv;
CREATE TABLE lineitem (
	l_orderkey INTEGER REFERENCES orders(o_orderkey),
	l_partkey INTEGER,
	l_suppkey INTEGER,
	l_linenumber INTEGER,
	l_quantity DECIMAL(12, 2),
	l_extendedprice DECIMAL(12, 2),
	l_discount DECIMAL(12, 2),
	l_tax DECIMAL(12, 2),
	l_returnflag CHAR(1),
	l_linestatus CHAR(1),
	l_shipdate DATE,
	l_commitdate DATE,
	l_receiptdate DATE,
	l_shipinstruct CHAR(25),
	l_shipmode CHAR(10),
	l_comment VARCHAR(44),
	l_dummy VARCHAR(10),
	PRIMARY KEY (l_orderkey, l_linenumber)
);
copy lineitem from '/home/yx/tpch/lineitem.tbl' delimiter '|' csv;