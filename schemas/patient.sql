CREATE TABLE patient (
    aadhaarid            VARCHAR2(255) PRIMARY KEY,
    address              VARCHAR2(255),
    age                  NUMBER,
    primaryphysicianid   VARCHAR2(255),
    name                 VARCHAR2(100),
    
    CONSTRAINT physicianfk FOREIGN KEY (primaryphysicianid) REFERENCES doctor(aadhaarid) ON DELETE SET NULL
);