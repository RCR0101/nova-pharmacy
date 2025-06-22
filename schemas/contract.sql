CREATE TABLE contract (
    contractid        NUMBER PRIMARY KEY,
    pharmacyname      VARCHAR2(100),
    companyname       VARCHAR2(100),
    startdate         DATE,
    enddate           DATE,
    contractcontent   CLOB,
    supervisorid      VARCHAR2(12) NOT NULL,
    
    CONSTRAINT contractpharma FOREIGN KEY (pharmacyname) REFERENCES pharmacy(name),
    CONSTRAINT contractcomp FOREIGN KEY (companyname) REFERENCES pharmacompany(name),
    CONSTRAINT contract_supervisor_fk FOREIGN KEY (supervisorid) REFERENCES supervisor(aadhaarid)
);