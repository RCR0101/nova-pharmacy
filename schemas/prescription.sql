CREATE TABLE prescription (
    prescriptionid   NUMBER PRIMARY KEY,
    doctorid         VARCHAR2(255),
    patientid        VARCHAR2(255),
    dateprescript    DATE,
    
    CONSTRAINT patientfk FOREIGN KEY (patientid) REFERENCES patient(aadhaarid),
    CONSTRAINT doctorfk FOREIGN KEY (doctorid) REFERENCES doctor(aadhaarid) ON DELETE SET NULL
);