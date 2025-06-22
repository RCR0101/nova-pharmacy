CREATE OR REPLACE PROCEDURE print_contract_details (
    p_pharmacy_name IN VARCHAR2,
    p_company_name  IN VARCHAR2
) IS
    CURSOR cur_contract IS
        SELECT contractid, pharmacyname, companyname,
               startdate, enddate, contractcontent
        FROM contract
        WHERE pharmacyname = p_pharmacy_name
          AND companyname = p_company_name
        ORDER BY startdate;

    v_found BOOLEAN := FALSE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('******** Contract Details Report ********');
    DBMS_OUTPUT.PUT_LINE('Pharmacy: ' || p_pharmacy_name || ' | Company: ' || p_company_name);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------');

    FOR contract_rec IN cur_contract LOOP
        v_found := TRUE;
        DBMS_OUTPUT.PUT_LINE('Contract ID  : ' || contract_rec.contractid);
        DBMS_OUTPUT.PUT_LINE('Start Date   : ' || TO_CHAR(contract_rec.startdate, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('End Date     : ' || TO_CHAR(contract_rec.enddate, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Content      : ' || contract_rec.contractcontent);
        DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
    END LOOP;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE('No contract details found for the specified pharmacy and company.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END print_contract_details;