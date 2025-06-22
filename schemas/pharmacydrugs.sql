CREATE TABLE pharmacydrugs (
    pharmacyname   VARCHAR2(100),
    tradename      VARCHAR2(100),
    companyname    VARCHAR2(100),
    price          NUMBER(10,2),
    
    PRIMARY KEY (pharmacyname, tradename, companyname),
    CONSTRAINT pharmacyfk FOREIGN KEY (pharmacyname) REFERENCES pharmacy(name),
    CONSTRAINT drugfk FOREIGN KEY (tradename, companyname) REFERENCES drug(tradename, companyname)
);