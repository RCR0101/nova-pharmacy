CREATE OR REPLACE PROCEDURE report_patient_prescriptions (
    p_patient_id IN VARCHAR2,
    p_start_date IN DATE,
    p_end_date   IN DATE
) IS
    CURSOR cur_prescriptions IS
        SELECT prescriptionid, doctorid, dateprescript
        FROM prescription
        WHERE patientid = p_patient_id
          AND dateprescript BETWEEN p_start_date AND p_end_date
        ORDER BY dateprescript;

    CURSOR cur_prescription_drugs(p_prescription_id IN NUMBER) IS
        SELECT tradename, companyname, quantity
        FROM prescriptiondrugs
        WHERE prescriptionid = p_prescription_id;

    v_found BOOLEAN := FALSE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('********* Prescription Report *********');
    DBMS_OUTPUT.PUT_LINE('Patient ID    : ' || p_patient_id);
    DBMS_OUTPUT.PUT_LINE('Report Period : ' ||
                         TO_CHAR(p_start_date, 'DD-MON-YYYY') || ' to ' ||
                         TO_CHAR(p_end_date,   'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('=======================================');

    FOR presc_rec IN cur_prescriptions LOOP
        v_found := TRUE;

        DBMS_OUTPUT.PUT_LINE(
            'Prescription ID: ' || presc_rec.prescriptionid ||
            ' | Date: ' || TO_CHAR(presc_rec.dateprescript, 'DD-MON-YYYY') ||
            ' | Doctor ID: ' || presc_rec.doctorid
        );
        DBMS_OUTPUT.PUT_LINE('  Drugs:');

        FOR drug_rec IN cur_prescription_drugs(presc_rec.prescriptionid) LOOP
            DBMS_OUTPUT.PUT_LINE(
                '    - ' || drug_rec.tradename ||
                ' (' || drug_rec.companyname || ')' ||
                ', Qty: ' || drug_rec.quantity
            );
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('---------------------------------------');
    END LOOP;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE('No prescriptions found for the given period.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END report_patient_prescriptions;