CREATE OR REPLACE PROCEDURE print_pharmacy_stock (
    p_pharmacy_name IN VARCHAR2
) IS
    CURSOR cur_stock IS
        SELECT tradename, companyname, price
        FROM pharmacydrugs
        WHERE pharmacyname = p_pharmacy_name;

    v_found BOOLEAN := FALSE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('******** Pharmacy Stock Report ********');
    DBMS_OUTPUT.PUT_LINE('Pharmacy: ' || p_pharmacy_name);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');

    FOR stock_rec IN cur_stock LOOP
        v_found := TRUE;
        DBMS_OUTPUT.PUT_LINE(
            'Drug: ' || stock_rec.tradename ||
            ' | Company: ' || stock_rec.companyname ||
            ' | Price: ' || TO_CHAR(stock_rec.price)
        );
    END LOOP;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE('No drugs found in the stock for pharmacy "' || p_pharmacy_name || '".');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END print_pharmacy_stock;