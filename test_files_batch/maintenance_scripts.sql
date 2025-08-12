-- Data Migration and Cleanup Scripts
-- Archive old records
INSERT INTO archived_transactions 
SELECT * FROM transactions 
WHERE transaction_date < DATEADD(YEAR, -2, GETDATE());

-- Clean up temporary tables
DROP TABLE IF EXISTS temp_import_data;
DROP TABLE IF EXISTS temp_validation_results;

-- Create indexes for performance
CREATE INDEX idx_customer_email ON customers(email);
CREATE INDEX idx_order_date ON orders(order_date);
CREATE INDEX idx_product_category ON products(category_id);

-- Update statistics
UPDATE STATISTICS customers;
UPDATE STATISTICS orders;
UPDATE STATISTICS products;

-- Maintenance tasks
DBCC CHECKDB;
BACKUP DATABASE SalesDB TO DISK = 'C:\Backup\SalesDB_backup.bak';
