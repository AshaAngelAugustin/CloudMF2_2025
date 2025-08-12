-- File 7: Shipping Management
CREATE PROCEDURE calculate_shipping_cost(
    p_destination IN VARCHAR2,
    p_weight IN NUMBER,
    p_shipping_cost OUT NUMBER
) IS
BEGIN
    IF p_weight <= 1 THEN
        p_shipping_cost := 5.99;
    ELSIF p_weight <= 5 THEN
        p_shipping_cost := 12.99;
    ELSE
        p_shipping_cost := 19.99;
    END IF;
    
    -- International shipping
    IF p_destination != 'US' THEN
        p_shipping_cost := p_shipping_cost * 2;
    END IF;
END;
