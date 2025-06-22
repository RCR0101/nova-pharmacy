CREATE OR REPLACE PACKAGE managedb AS

    -- Doctor
    PROCEDURE add_doctor(p_aadhaar_id IN VARCHAR2, p_name IN VARCHAR2, p_specialty IN VARCHAR2, p_years_experience IN INT);
    PROCEDURE update_doctor(p_aadhaar_id IN VARCHAR2, p_name IN VARCHAR2, p_specialty IN VARCHAR2, p_years_experience IN INT);
    PROCEDURE delete_doctor(p_aadhaar_id IN VARCHAR2);

    -- Patient
    PROCEDURE add_patient(p_aadhaar_id IN VARCHAR2, p_address IN VARCHAR2, p_age IN INT, p_primary_physician_id IN VARCHAR2);
    PROCEDURE update_patient(p_aadhaar_id IN VARCHAR2, p_address IN VARCHAR2, p_age IN INT, p_primary_physician_id IN VARCHAR2);
    PROCEDURE delete_patient(p_aadhaar_id IN VARCHAR2);

    -- Supervisor
    PROCEDURE add_supervisor(p_name IN VARCHAR2, p_aadhaar_id IN VARCHAR2);
    PROCEDURE update_supervisor(p_aadhaar_id IN VARCHAR2, p_name IN VARCHAR2);
    PROCEDURE delete_supervisor(p_aadhaar_id IN VARCHAR2);

    -- PharmaCompany
    PROCEDURE add_pharma_company(p_name IN VARCHAR2, p_phone IN VARCHAR2);
    PROCEDURE update_pharma_company(p_name IN VARCHAR2, p_phone IN VARCHAR2);
    PROCEDURE delete_pharma_company(p_name IN VARCHAR2);

    -- Pharmacy
    PROCEDURE add_pharmacy(p_name IN VARCHAR2, p_address IN VARCHAR2, p_phone IN VARCHAR2);
    PROCEDURE update_pharmacy(p_name IN VARCHAR2, p_address IN VARCHAR2, p_phone IN VARCHAR2);
    PROCEDURE delete_pharmacy(p_name IN VARCHAR2);

    -- Contract
    PROCEDURE add_contract(p_contract_id IN INT, p_pharmacy_name IN VARCHAR2, p_company_name IN VARCHAR2,
                           p_start_date IN DATE, p_end_date IN DATE, p_contract_content IN CLOB);
    PROCEDURE update_contract(p_contract_id IN INT, p_pharmacy_name IN VARCHAR2, p_company_name IN VARCHAR2,
                              p_start_date IN DATE, p_end_date IN DATE, p_contract_content IN CLOB, p_supervisor_id IN VARCHAR2);
    PROCEDURE delete_contract(p_contract_id IN INT);

    -- Drug
    PROCEDURE add_drug(p_trade_name IN VARCHAR2, p_company_name IN VARCHAR2, p_formula IN CLOB);
    PROCEDURE update_drug(p_trade_name IN VARCHAR2, p_company_name IN VARCHAR2, p_formula IN CLOB);
    PROCEDURE delete_drug(p_trade_name IN VARCHAR2, p_company_name IN VARCHAR2);

    -- PharmacyDrugs
    PROCEDURE add_pharmacy_drug(p_pharmacy_name IN VARCHAR2, p_trade_name IN VARCHAR2,
                                p_company_name IN VARCHAR2, p_price IN NUMBER);
    PROCEDURE update_pharmacy_drug(p_pharmacy_name IN VARCHAR2, p_trade_name IN VARCHAR2,
                                   p_company_name IN VARCHAR2, p_price IN NUMBER);
    PROCEDURE delete_pharmacy_drug(p_pharmacy_name IN VARCHAR2, p_trade_name IN VARCHAR2,
                                   p_company_name IN VARCHAR2);

    -- Prescription
    PROCEDURE add_prescription(p_doctor_id IN VARCHAR2, p_patient_id IN VARCHAR2, p_date IN DATE);
    PROCEDURE update_prescription(p_prescription_id IN INT, p_doctor_id IN VARCHAR2, p_patient_id IN VARCHAR2, p_date IN DATE);
    PROCEDURE delete_prescription(p_prescription_id IN INT);

    -- PrescriptionDrugs
    PROCEDURE add_prescription_drug(p_prescription_id IN INT, p_trade_name IN VARCHAR2,
                                    p_company_name IN VARCHAR2, p_quantity IN INT);
    PROCEDURE update_prescription_drug(p_prescription_id IN INT, p_trade_name IN VARCHAR2,
                                       p_company_name IN VARCHAR2, p_quantity IN INT);
    PROCEDURE delete_prescription_drug(p_prescription_id IN INT, p_trade_name IN VARCHAR2,
                                       p_company_name IN VARCHAR2);

END managedb;