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
    payment_method_id INT(3),
  total_amount DECIMAL(9,2) NOT NULL,
  PRIMARY KEY payment_id (payment_id)
);
CREATE TABLE payments_items(
	pi_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
	payment_id INT(9) UNSIGNED NOT NULL,
    total_amount DECIMAL(9,2) NOT NULL,
);
CREATE TABLE payment_methods (
	payment_method_id INT(3),
    payment_method_name VARCHAR(16)
);
CREATE TABLE pm_transactions( 
);
CREATE TABLE pm_transactions_history(
);

INSERT INTO invoicing.invoice_totals_types (iitt_name) VALUES ('item_total'), ('item_vat'), ('invoice_total'), ('invoice_vat'), ('invoice_total_vat');

INSERT INTO invoicing.currencies (symbol) VALUES
('AED','United Arab Emirates, Dirhams'),
('AFA','Afghanistan, Afghanis'),
('ALL','Albania, Leke'),
('AMD','Armenia, Drams'),
('ANG','Netherlands Antilles, Guilders (Florins)'),
('AOA','Angola, Kwanza'),
('ARS','Argentina, Pesos'),
('AUD','Australia, Dollars'),
('AWG','Aruba, Guilders (Florins)'),
('AZM','Azerbaijan, Manats'),
('BAM','Bosnia and Herzegovina, Convertible Marka'),
('BBD','Barbados, Dollars'),
('BDT','Bangladesh, Taka'),
('BGN','Bulgaria, Leva'),
('BHD','Bahrain, Dinars'),
('BIF','Burundi, Francs'),
('BMD','Bermuda, Dollars'),
('BND','Brunei Darussalam, Dollars'),
('BOB','Bolivia, Bolivianos'),
('BRL','Brazil, Brazil Real'),
('BSD','Bahamas, Dollars'),
('BTN','Bhutan, Ngultrum'),
('BWP','Botswana, Pulas'),
('BYR','Belarus, Rubles'),
('BZD','Belize, Dollars'),
('CAD','Canada, Dollars'),
('CDF','Congo/Kinshasa, Congolese Francs'),
('CHF','Switzerland, Francs'),
('CLP','Chile, Pesos'),
('CNY','China, Yuan Renminbi'),
('COP','Colombia, Pesos'),
('CRC','Costa Rica, Colones'),
('CSD','Serbia, Dinars'),
('CUP','Cuba, Pesos'),
('CVE','Cape Verde, Escudos'),
('CYP','Cyprus, Pounds'),
('CZK','Czech Republic, Koruny'),
('DJF','Djibouti, Francs'),
('DKK','Denmark, Kroner'),
('DOP','Dominican Republic, Pesos'),
('DZD','Algeria, Algeria Dinars'),
('EEK','Estonia, Krooni'),
('EGP','Egypt, Pounds'),
('ERN','Eritrea, Nakfa'),
('ETB','Ethiopia, Birr'),
('EUR','Euro Member Countries, Euro'),
('FJD','Fiji, Dollars'),
('FKP','Falkland Islands (Malvinas), Pounds'),
('GBP','United Kingdom, Pounds'),
('GEL','Georgia, Lari'),
('GGP','Guernsey, Pounds'),
('GHC','Ghana, Cedis'),
('GIP','Gibraltar, Pounds'),
('GMD','Gambia, Dalasi'),
('GNF','Guinea, Francs'),
('GTQ','Guatemala, Quetzales'),
('GYD','Guyana, Dollars'),
('HKD','Hong Kong, Dollars'),
('HNL','Honduras, Lempiras'),
('HRK','Croatia, Kuna'),
('HTG','Haiti, Gourdes'),
('HUF','Hungary, Forint'),
('IDR','Indonesia, Rupiahs'),
('ILS','Israel, New Shekels'),
('IMP','Isle of Man, Pounds'),
('INR','India, Rupees'),
('IQD','Iraq, Dinars'),
('IRR','Iran, Rials'),
('ISK','Iceland, Kronur'),
('JEP','Jersey, Pounds'),
('JMD','Jamaica, Dollars'),
('JOD','Jordan, Dinars'),
('JPY','Japan, Yen'),
('KES','Kenya, Shillings'),
('KGS','Kyrgyzstan, Soms'),
('KHR','Cambodia, Riels'),
('KMF','Comoros, Francs'),
('KPW','Korea (North), Won'),
('KRW','Korea (South), Won'),
('KWD','Kuwait, Dinars'),
('KYD','Cayman Islands, Dollars'),
('KZT','Kazakhstan, Tenge'),
('LAK','Laos, Kips'),
('LBP','Lebanon, Pounds'),
('LKR','Sri Lanka, Rupees'),
('LRD','Liberia, Dollars'),
('LSL','Lesotho, Maloti'),
('LTL','Lithuania, Litai'),
('LVL','Latvia, Lati'),
('LYD','Libya, Dinars'),
('MAD','Morocco, Dirhams'),
('MDL','Moldova, Lei'),
('MGA','Madagascar, Ariary'),
('MKD','Macedonia, Denars'),
('MMK','Myanmar (Burma), Kyats'),
('MNT','Mongolia, Tugriks'),
('MOP','Macau, Patacas'),
('MRO','Mauritania, Ouguiyas'),
('MTL','Malta, Liri'),
('MUR','Mauritius, Rupees'),
('MVR','Maldives (Maldive Islands), Rufiyaa'),
('MWK','Malawi, Kwachas'),
('MXN','Mexico, Pesos'),
('MYR','Malaysia, Ringgits'),
('MZM','Mozambique, Meticais'),
('NAD','Namibia, Dollars'),
('NGN','Nigeria, Nairas'),
('NIO','Nicaragua, Cordobas'),
('NOK','Norway, Krone'),
('NPR','Nepal, Nepal Rupees'),
('NZD','New Zealand, Dollars'),
('OMR','Oman, Rials'),
('PAB','Panama, Balboa'),
('PEN','Peru, Nuevos Soles'),
('PGK','Papua New Guinea, Kina'),
('PHP','Philippines, Pesos'),
('PKR','Pakistan, Rupees'),
('PLN','Poland, Zlotych'),
('PYG','Paraguay, Guarani'),
('QAR','Qatar, Rials'),
('ROL','Romania, Lei'),
('RUB','Russia, Rubles'),
('RWF','Rwanda, Rwanda Francs'),
('SAR','Saudi Arabia, Riyals'),
('SBD','Solomon Islands, Dollars'),
('SCR','Seychelles, Rupees'),
('SDD','Sudan, Dinars'),
('SEK','Sweden, Kronor'),
('SGD','Singapore, Dollars'),
('SHP','Saint Helena, Pounds'),
('SIT','Slovenia, Tolars'),
('SKK','Slovakia, Koruny'),
('SLL','Sierra Leone, Leones'),
('SOS','Somalia, Shillings'),
('SPL','Seborga, Luigini'),
('SRD','Suriname, Dollars'),
('STD','São Tome and Principe, Dobras'),
('SVC','El Salvador, Colones'),
('SYP','Syria, Pounds'),
('SZL','Swaziland, Emalangeni'),
('THB','Thailand, Baht'),
('TJS','Tajikistan, Somoni'),
('TMM','Turkmenistan, Manats'),
('TND','Tunisia, Dinars'),
('TOP','Tonga, Pa’anga'),
('TRL','Turkey, Liras (obsolete)'),
('TRY','Turkey, New Lira'),
('TTD','Trinidad and Tobago, Dollars'),
('TVD','Tuvalu, Tuvalu Dollars'),
('TWD','Taiwan, New Dollars'),
('TZS','Tanzania, Shillings'),
('UAH','Ukraine, Hryvnia'),
('UGX','Uganda, Shillings'),
('USD','United States of America, Dollars'),
('UYU','Uruguay, Pesos'),
('UZS','Uzbekistan, Sums'),
('VEB','Venezuela, Bolivares'),
('VND','Viet Nam, Dong'),
('VUV','Vanuatu, Vatu'),
('WST','Samoa, Tala'),
('XAF','Communauté Financière Africaine, Francs'),
('XAG','Silver, Ounces'),
('XAU','Gold, Ounces'),
('XCD','East Caribbean Dollars'),
('XDR','International Monetary Fund (IMF) Special Drawing Rights'),
('XOF',''),
('XPD','Palladium Ounces'),
('XPF','Comptoirs Français du Pacifique Francs'),
('XPT','Platinum, Ounces'),
('YER','Yemen, Rials'),
('ZAR','South Africa, Rand'),
('ZMK','Zambia, Kwacha'),
('ZWD','Zimbabwe, Zimbabwe Dollars');
