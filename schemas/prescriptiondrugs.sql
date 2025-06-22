CREATE TABLE prescriptiondrugs (
    prescriptionid   NUMBER,
    tradename        VARCHAR2(100),
    companyname      VARCHAR2(100),
    quantity         NUMBER,
    
    PRIMARY KEY (prescriptionid, tradename, companyname),
    CONSTRAINT prescriptiondrugfk FOREIGN KEY (tradename, companyname) REFERENCES drug(tradename, companyname),
    CONSTRAINT prescriptionidentity FOREIGN KEY (prescriptionid) REFERENCES prescription(prescriptionid) ON DELETE CASCADE
);