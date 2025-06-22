CREATE OR REPLACE PROCEDURE print_patients_for_doctor (
    p_doctor_id IN VARCHAR2
) IS
    CURSOR cur_patients IS
        SELECT aadhaarid, name, address, age
        FROM patient
        WHERE primaryphysicianid = p_doctor_id;

    v_found BOOLEAN := FALSE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('******** Patients Assigned to Doctor: ' || p_doctor_id || ' ********');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------');

    FOR patient_rec IN cur_patients LOOP
        v_found := TRUE;
        DBMS_OUTPUT.PUT_LINE(
            'Patient ID: ' || patient_rec.aadhaarid ||
            ' | Name: ' || patient_rec.name ||
            ' | Age: ' || patient_rec.age ||
            ' | Address: ' || patient_rec.address
        );
    END LOOP;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE('No patients found for doctor: ' || p_doctor_id);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END print_patients_for_doctor;