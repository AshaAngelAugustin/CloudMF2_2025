CREATE PROCEDURE TopCustomer (
    OUT TopCompany CHAR(35),
    OUT TopValue INT
)
BEGIN
    DECLARE err_notfound EXCEPTION FOR SQLSTATE '02000';

    DECLARE curThisCust CURSOR FOR
        SELECT CompanyName,
               CAST(SUM(SalesOrderItems.Quantity * Products.UnitPrice) AS INTEGER) AS VALUE
        FROM Customers
        LEFT OUTER JOIN SalesOrders ON Customers.CustomerID = SalesOrders.CustomerID
        LEFT OUTER JOIN SalesOrderItems ON SalesOrders.OrderID = SalesOrderItems.OrderID
        LEFT OUTER JOIN Products ON SalesOrderItems.ProductID = Products.ProductID
        GROUP BY CompanyName;

    DECLARE ThisValue INT;
    DECLARE ThisCompany CHAR(35);
    SET TopValue = 0;

    OPEN curThisCust;

    CustomerLoop:
    LOOP
        FETCH NEXT curThisCust INTO ThisCompany, ThisValue;
        IF SQLSTATE = err_notfound THEN
            LEAVE CustomerLoop;
        END IF;

        IF ThisValue > TopValue THEN
            SET TopValue = ThisValue;
            SET TopCompany = ThisCompany;
        END IF;
    END LOOP CustomerLoop;

    CLOSE curThisCust;
END;
