CREATE TABLE drug (
    tradename     VARCHAR2(100),
    companyname   VARCHAR2(100),
    formula       CLOB,
    
    PRIMARY KEY (tradename, companyname),
    CONSTRAINT fk_drug_company FOREIGN KEY (companyname) REFERENCES pharmacompany(name) ON DELETE CASCADE
);