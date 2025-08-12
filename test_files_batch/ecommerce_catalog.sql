-- E-commerce Product Catalog
CREATE TABLE products (
    product_id NUMBER(10) PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    description CLOB,
    price NUMBER(10,2),
    category_id NUMBER(5),
    stock_quantity NUMBER(8),
    created_date DATE DEFAULT SYSDATE,
    modified_date DATE,
    is_active CHAR(1) DEFAULT 'Y'
);

CREATE SEQUENCE product_seq START WITH 1000 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_product_audit
    BEFORE UPDATE ON products
    FOR EACH ROW
BEGIN
    :NEW.modified_date := SYSDATE;
    
    INSERT INTO product_audit_log (
        product_id, old_price, new_price, 
        changed_by, change_date
    ) VALUES (
        :NEW.product_id, :OLD.price, :NEW.price,
        USER, SYSDATE
    );
END;

-- Sample data insert
INSERT INTO products (product_id, product_name, description, price, category_id, stock_quantity)
VALUES (product_seq.NEXTVAL, 'Wireless Headphones', 'High-quality wireless headphones', 99.99, 1, 50);
