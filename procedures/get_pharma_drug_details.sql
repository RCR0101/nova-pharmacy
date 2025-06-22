CREATE OR REPLACE PROCEDURE get_pharma_drug_details (
    p_company_name IN VARCHAR2
) IS
    CURSOR cur_drugs IS
        SELECT trade_name, company_name, formula
        FROM drug
        WHERE company_name = p_company_name;

    v_found BOOLEAN := FALSE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('******** Drug Details Report ********');
    DBMS_OUTPUT.PUT_LINE('Pharmaceutical Company: ' || p_company_name);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------');

    FOR drug_rec IN cur_drugs LOOP
        v_found := TRUE;
        DBMS_OUTPUT.PUT_LINE('Trade Name   : ' || drug_rec.trade_name);
        DBMS_OUTPUT.PUT_LINE('Company Name : ' || drug_rec.company_name);
        DBMS_OUTPUT.PUT_LINE('Formula      : ' || drug_rec.formula);
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    END LOOP;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE('No drugs found for the company "' || p_company_name || '".');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END get_pharma_drug_details;