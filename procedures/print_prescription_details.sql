CREATE OR REPLACE PROCEDURE print_prescription_details (
    p_patient_id        IN VARCHAR2,
    p_prescription_date IN DATE
) IS
    CURSOR cur_prescriptions IS
        SELECT prescriptionid, doctorid, dateprescript
        FROM prescription
        WHERE patientid = p_patient_id
          AND dateprescript = p_prescription_date
        ORDER BY prescriptionid;

    v_found BOOLEAN := FALSE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('*** Prescription Details Report ***');
    DBMS_OUTPUT.PUT_LINE('Patient ID        : ' || p_patient_id);
    DBMS_OUTPUT.PUT_LINE('Prescription Date : ' || TO_CHAR(p_prescription_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');

    FOR presc_rec IN cur_prescriptions LOOP
        v_found := TRUE;
        DBMS_OUTPUT.PUT_LINE(
            'Prescription ID: ' || presc_rec.prescriptionid ||
            ' | Doctor ID: ' || presc_rec.doctorid
        );

        FOR drug_rec IN (
            SELECT tradename, companyname, quantity
            FROM prescriptiondrugs
            WHERE prescriptionid = presc_rec.prescriptionid
        ) LOOP
            DBMS_OUTPUT.PUT_LINE(
                '  - Drug: ' || drug_rec.tradename ||
                ', Company: ' || drug_rec.companyname ||
                ', Quantity: ' || drug_rec.quantity
            );
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------');
    END LOOP;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE(
            'No prescription found for patient "' || p_patient_id ||
            '" on ' || TO_CHAR(p_prescription_date, 'DD-MON-YYYY') || '.'
        );
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END print_prescription_details;