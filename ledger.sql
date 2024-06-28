-- Create the Accounts table
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    AccountName VARCHAR(100) NOT NULL,
    AccountType VARCHAR(50) NOT NULL,
    Balance DECIMAL(15, 2) DEFAULT 0.00
);

-- Create the TransactionTypes table
CREATE TABLE TransactionTypes (
    TransactionTypeID INT PRIMARY KEY AUTO_INCREMENT,
    TypeName VARCHAR(50) NOT NULL,
    Description VARCHAR(255)
);

-- Create the Transactions table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    TransactionDate DATE NOT NULL,
    Description VARCHAR(255),
    Amount DECIMAL(15, 2) NOT NULL,
    DebitAccountID INT,
    CreditAccountID INT,
    TransactionTypeID INT,
    FOREIGN KEY (DebitAccountID) REFERENCES Accounts(AccountID),
    FOREIGN KEY (CreditAccountID) REFERENCES Accounts(AccountID),
    FOREIGN KEY (TransactionTypeID) REFERENCES TransactionTypes(TransactionTypeID)
);

-- Create an index on TransactionDate for faster queries
CREATE INDEX idx_transaction_date ON Transactions(TransactionDate);

-- Insert common transaction types
INSERT INTO TransactionTypes (TypeName, Description) VALUES
('Sale', 'Revenue from sales of goods or services'),
('Purchase', 'Expenses for buying goods or services'),
('Salary Payment', 'Payment of employee salaries'),
('Rent Payment', 'Payment for rent of premises'),
('Utility Payment', 'Payment for utilities like electricity, water, etc.'),
('Tax Payment', 'Payment of various taxes'),
('Loan Repayment', 'Repayment of loans'),
('Interest Income', 'Income from interest on investments or loans given'),
('Dividend Payment', 'Payment of dividends to shareholders'),
('Asset Purchase', 'Purchase of long-term assets'),
('Asset Sale', 'Sale of long-term assets'),
('Transfer', 'Transfer between accounts'),
('Refund', 'Refund of previously received money'),
('Fee Income', 'Income from various fees charged'),
('Insurance Payment', 'Payment for insurance premiums'),
('Depreciation', 'Recording depreciation of assets'),
('Amortization', 'Amortization of intangible assets or loans'),
('Bad Debt', 'Writing off uncollectible accounts'),
('Donation', 'Charitable donations made'),
('Grant Received', 'Grants or subsidies received');