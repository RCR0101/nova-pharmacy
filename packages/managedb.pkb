CREATE OR REPLACE PACKAGE BODY managedb AS

    -- Doctor Procedures
    PROCEDURE add_doctor(p_aadhaar_id IN VARCHAR2, p_name IN VARCHAR2, p_specialty IN VARCHAR2, p_years_experience IN INT) IS
    BEGIN
        INSERT INTO doctor (aadhaarid, name, specialty, yearsexperience)
        VALUES (p_aadhaar_id, p_name, p_specialty, p_years_experience);
        COMMIT;
    END;

    PROCEDURE update_doctor(p_aadhaar_id IN VARCHAR2, p_name IN VARCHAR2, p_specialty IN VARCHAR2, p_years_experience IN INT) IS
    BEGIN
        UPDATE doctor
        SET name = p_name,
            specialty = p_specialty,
            yearsexperience = p_years_experience
        WHERE aadhaarid = p_aadhaar_id;
        COMMIT;
    END;

    PROCEDURE delete_doctor(p_aadhaar_id IN VARCHAR2) IS
    BEGIN
        DELETE FROM doctor WHERE aadhaarid = p_aadhaar_id;
        COMMIT;
    END;

    -- Patient Procedures
    PROCEDURE add_patient(p_aadhaar_id IN VARCHAR2, p_address IN VARCHAR2, p_age IN INT, p_primary_physician_id IN VARCHAR2) IS
    BEGIN
        INSERT INTO patient (aadhaarid, address, age, primaryphysicianid)
        VALUES (p_aadhaar_id, p_address, p_age, p_primary_physician_id);
        COMMIT;
    END;

    PROCEDURE update_patient(p_aadhaar_id IN VARCHAR2, p_address IN VARCHAR2, p_age IN INT, p_primary_physician_id IN VARCHAR2) IS
    BEGIN
        UPDATE patient
        SET address = p_address,
            age = p_age,
            primaryphysicianid = p_primary_physician_id
        WHERE aadhaarid = p_aadhaar_id;
        COMMIT;
    END;

    PROCEDURE delete_patient(p_aadhaar_id IN VARCHAR2) IS
    BEGIN
        DELETE FROM patient WHERE aadhaarid = p_aadhaar_id;
        COMMIT;
    END;

    -- Supervisor Procedures
    PROCEDURE add_supervisor(p_name IN VARCHAR2, p_aadhaar_id IN VARCHAR2) IS
    BEGIN
        INSERT INTO supervisor (name, aadhaarid) VALUES (p_name, p_aadhaar_id);
        COMMIT;
    END;

    PROCEDURE update_supervisor(p_aadhaar_id IN VARCHAR2, p_name IN VARCHAR2) IS
    BEGIN
        UPDATE supervisor SET name = p_name WHERE aadhaarid = p_aadhaar_id;
        COMMIT;
    END;

    PROCEDURE delete_supervisor(p_aadhaar_id IN VARCHAR2) IS
    BEGIN
        DELETE FROM supervisor WHERE aadhaarid = p_aadhaar_id;
        COMMIT;
    END;

    -- PharmaCompany Procedures
    PROCEDURE add_pharma_company(p_name IN VARCHAR2, p_phone IN VARCHAR2) IS
    BEGIN
        INSERT INTO pharmacompany (name, phone) VALUES (p_name, p_phone);
        COMMIT;
    END;

    PROCEDURE update_pharma_company(p_name IN VARCHAR2, p_phone IN VARCHAR2) IS
    BEGIN
        UPDATE pharmacompany SET phone = p_phone WHERE name = p_name;
        COMMIT;
    END;

    PROCEDURE delete_pharma_company(p_name IN VARCHAR2) IS
    BEGIN
        DELETE FROM pharmacompany WHERE name = p_name;
        COMMIT;
    END;

    -- Pharmacy Procedures
    PROCEDURE add_pharmacy(p_name IN VARCHAR2, p_address IN VARCHAR2, p_phone IN VARCHAR2) IS
    BEGIN
        INSERT INTO pharmacy (name, address, phone) VALUES (p_name, p_address, p_phone);
        COMMIT;
    END;

    PROCEDURE update_pharmacy(p_name IN VARCHAR2, p_address IN VARCHAR2, p_phone IN VARCHAR2) IS
    BEGIN
        UPDATE pharmacy
        SET address = p_address,
            phone = p_phone
        WHERE name = p_name;
        COMMIT;
    END;

    PROCEDURE delete_pharmacy(p_name IN VARCHAR2) IS
    BEGIN
        DELETE FROM pharmacy WHERE name = p_name;
        COMMIT;
    END;

    -- Contract Procedures
    PROCEDURE add_contract(p_contract_id IN INT, p_pharmacy_name IN VARCHAR2, p_company_name IN VARCHAR2,
                           p_start_date IN DATE, p_end_date IN DATE, p_contract_content IN CLOB) IS
    BEGIN
        INSERT INTO contract (contractid, pharmacyname, companyname, startdate, enddate, contractcontent)
        VALUES (p_contract_id, p_pharmacy_name, p_company_name, p_start_date, p_end_date, p_contract_content);
        COMMIT;
    END;

    PROCEDURE update_contract(p_contract_id IN INT, p_pharmacy_name IN VARCHAR2, p_company_name IN VARCHAR2,
                              p_start_date IN DATE, p_end_date IN DATE, p_contract_content IN CLOB, p_supervisor_id IN VARCHAR2) IS
    BEGIN
        UPDATE contract
        SET pharmacyname = p_pharmacy_name,
            companyname = p_company_name,
            startdate = p_start_date,
            enddate = p_end_date,
            contractcontent = p_contract_content,
            supervisorid = p_supervisor_id
        WHERE contractid = p_contract_id;
        COMMIT;
    END;

    PROCEDURE delete_contract(p_contract_id IN INT) IS
    BEGIN
        DELETE FROM contract WHERE contractid = p_contract_id;
        COMMIT;
    END;

    -- Drug Procedures
    PROCEDURE add_drug(p_trade_name IN VARCHAR2, p_company_name IN VARCHAR2, p_formula IN CLOB) IS
    BEGIN
        INSERT INTO drug (tradename, companyname, formula)
        VALUES (p_trade_name, p_company_name, p_formula);
        COMMIT;
    END;

    PROCEDURE update_drug(p_trade_name IN VARCHAR2, p_company_name IN VARCHAR2, p_formula IN CLOB) IS
    BEGIN
        UPDATE drug SET formula = p_formula
        WHERE tradename = p_trade_name AND companyname = p_company_name;
        COMMIT;
    END;

    PROCEDURE delete_drug(p_trade_name IN VARCHAR2, p_company_name IN VARCHAR2) IS
    BEGIN
        DELETE FROM drug
        WHERE tradename = p_trade_name AND companyname = p_company_name;
        COMMIT;
    END;

    -- PharmacyDrugs Procedures
    PROCEDURE add_pharmacy_drug(p_pharmacy_name IN VARCHAR2, p_trade_name IN VARCHAR2,
                                p_company_name IN VARCHAR2, p_price IN NUMBER) IS
    BEGIN
        INSERT INTO pharmacydrugs (pharmacyname, tradename, companyname, price)
        VALUES (p_pharmacy_name, p_trade_name, p_company_name, p_price);
        COMMIT;
    END;

    PROCEDURE update_pharmacy_drug(p_pharmacy_name IN VARCHAR2, p_trade_name IN VARCHAR2,
                                   p_company_name IN VARCHAR2, p_price IN NUMBER) IS
    BEGIN
        UPDATE pharmacydrugs SET price = p_price
        WHERE pharmacyname = p_pharmacy_name AND tradename = p_trade_name AND companyname = p_company_name;
        COMMIT;
    END;

    PROCEDURE delete_pharmacy_drug(p_pharmacy_name IN VARCHAR2, p_trade_name IN VARCHAR2,
                                   p_company_name IN VARCHAR2) IS
    BEGIN
        DELETE FROM pharmacydrugs
        WHERE pharmacyname = p_pharmacy_name AND tradename = p_trade_name AND companyname = p_company_name;
        COMMIT;
    END;

    -- Prescription Procedures
    PROCEDURE add_prescription(p_doctor_id IN VARCHAR2, p_patient_id IN VARCHAR2, p_date IN DATE) IS
    BEGIN
        INSERT INTO prescription (doctorid, patientid, dateprescript)
        VALUES (p_doctor_id, p_patient_id, p_date);
        COMMIT;
    END;

    PROCEDURE update_prescription(p_prescription_id IN INT, p_doctor_id IN VARCHAR2,
                                  p_patient_id IN VARCHAR2, p_date IN DATE) IS
    BEGIN
        UPDATE prescription
        SET doctorid = p_doctor_id,
            patientid = p_patient_id,
            dateprescript = p_date
        WHERE prescriptionid = p_prescription_id;
        COMMIT;
    END;

    PROCEDURE delete_prescription(p_prescription_id IN INT) IS
    BEGIN
        DELETE FROM prescription WHERE prescriptionid = p_prescription_id;
        COMMIT;
    END;

    -- PrescriptionDrugs Procedures
    PROCEDURE add_prescription_drug(p_prescription_id IN INT, p_trade_name IN VARCHAR2,
                                    p_company_name IN VARCHAR2, p_quantity IN INT) IS
    BEGIN
        INSERT INTO prescriptiondrugs (prescriptionid, tradename, companyname, quantity)
        VALUES (p_prescription_id, p_trade_name, p_company_name, p_quantity);
        COMMIT;
    END;

    PROCEDURE update_prescription_drug(p_prescription_id IN INT, p_trade_name IN VARCHAR2,
                                       p_company_name IN VARCHAR2, p_quantity IN INT) IS
    BEGIN
        UPDATE prescriptiondrugs SET quantity = p_quantity
        WHERE prescriptionid = p_prescription_id AND tradename = p_trade_name AND companyname = p_company_name;
        COMMIT;
    END;

    PROCEDURE delete_prescription_drug(p_prescription_id IN INT, p_trade_name IN VARCHAR2,
                                       p_company_name IN VARCHAR2) IS
    BEGIN
        DELETE FROM prescriptiondrugs
        WHERE prescriptionid = p_prescription_id AND tradename = p_trade_name AND companyname = p_company_name;
        COMMIT;
    END;

END managedb;