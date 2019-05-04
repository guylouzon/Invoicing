CREATE DATABASE invoicing;

CREATE TABLE invoicing.invoice (
  id,
  invoice_id,
  invoice_date,
  issuer_id,
  receiver_id,
  total,
  currecny_id,
  description,
  signature_key
)
;

-- issuer, receiveer: customer/ supplier. out of scope

CREATE TABLE currencies (
  currecny_id,
  symbol
)
;
CREATE TABLE invoicing.invoice_items (
  ii_id,
  invoice_id,
  product_id,
  product_count,
  product_price,
  subtotal
)
;
-- sample table. products are out of scope
CREATE TABLE products (
  product_id,
  product_name
)
;


CREATE TABLE invoice_totals_types (
  iitt_id,
  `iitt_name` VARCHAR(32) -- item_total, item_vat, invoice_total, invoice_vat, invoice_total_vat
)

CREATE TABLE invoice_totals (
  it_id,
  invoice_id,
  total_type_id,
  total_amount
)
;
