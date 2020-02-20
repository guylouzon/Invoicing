CREATE DATABASE invoicing;
USE invoicing

CREATE TABLE invoice (
  incr_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  invoice_id INT(11) UNSIGNED NOT NULL,
  invoice_date TIMESTAMP DEFAULT current_timestamp,
  issuer_id INT(9) NOT NULL,
  receiver_id INT(9) NOT NULL,
  currency_id INT(3) NOT NULL,
  description VARCHAR(64) NOT NULL,
  signature_key VARCHAR(256),
  PRIMARY KEY incr_id (incr_id),
  KEY invoice_id (invoice_id),
  KEY invoice_date (invoice_date),
KEY issuer_id (issuer_id),
KEY receiver_id (receiver_id),
  KEY currency_id (currency_id)
)
;

-- issuer, receiver: customer/ supplier. to link to own DB. out of project scope

CREATE TABLE currencies (
  currency_id INT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  symbol CHAR(3),
  description VARCHAR(32),
  PRIMARY KEY currency_id (currency_id),
  KEY symbol (symbol)
)
;

CREATE TABLE invoice_items (
  ii_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  incr_id INT(9) UNSIGNED NOT NULL,
  product_id INT(9) UNSIGNED NOT NULL,
  product_count INT(5) UNSIGNED NOT NULL,
  product_price FLOAT(9,2) NOT NULL,
  subtotal FLOAT(9,2) NOT NULL,
  PRIMARY KEY ii_id (ii_id),
  KEY incr_id (incr_id),
  KEY product_id (product_id)
)
;
-- sample table. products are out of scope
CREATE TABLE products (
  product_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(32),
  PRIMARY KEY product_id (product_id)
)
;


CREATE TABLE invoice_totals_types (
  iitt_id INT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `iitt_name` VARCHAR(32), -- ('item_total'), ('item_vat'), ('invoice_total'), ('invoice_vat'), ('invoice_total_vat')
  PRIMARY KEY iitt_id (iitt_id)
)
;

CREATE TABLE invoice_totals (
  it_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  invoice_id INT(9) UNSIGNED NOT NULL,
  total_type_id INT(4) UNSIGNED NOT NULL,
  total_amount DECIMAL(9,2) NOT NULL,
  PRIMARY KEY it_id (it_id),
  KEY invoice_id (invoice_id),
  KEY total_type_id (total_type_id)
)
;

CREATE TABLE payments(
	payment_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    payment_datetime TIMESTAMP NOT NULL DEFAULT current_timestamp,
	payer_id INT(9) NOT NULL,
	receiver_id INT(9) NOT NULL,
	pm_id INT(3),
	currency_id INT(3),
	total_amount DECIMAL(9,2) NOT NULL,
	PRIMARY KEY payment_id (payment_id)
);
/*
CREATE TABLE payments_items(
	pi_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
	payment_id INT(9) UNSIGNED NOT NULL,
    total_amount DECIMAL(9,2) NOT NULL,
);
*/
CREATE TABLE payment_methods (
	payment_method_id INT(3),
    payment_method_name VARCHAR(16)
);
CREATE TABLE pm_transactions(
	tran_id,
	payment_id,
	tran_identifier_type VARCHAR, -- voucher, token, trankey
	tran_value VARCHAR, -- a numeric or an alphanumeric code
	tran_amount
);

CREATE TABLE pm_transactions_history(
	history_id,
	tran_id,
	date,
	status_type,
	status_value
);

CREATE TABLE invoices_payments(
	ip_id,
	invoice_id,
	payment_id,
	payment_cover_ratio DECIMAL(9,2) DEFAULT 1.00
);


