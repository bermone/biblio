INSERT INTO ACTEUR(DT_INSCRIPTION, ENABLED, NOM, PASSWORD, PRENOM, USERNAME, VERSION) VALUES(CURRENT_TIMESTAMP, 1, 'BERMONE', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Antoine', 'bermone', 0);

-- ROLES
INSERT INTO ROLE(ID, DT_CREATION, ROLE, VERSION, ACTEUR) VALUES(SEQ_ROLE.NEXTVAL, CURRENT_DATE, 'ROLE_ADMIN', 0, 'bermone');
INSERT INTO ROLE(ID, DT_CREATION, ROLE, VERSION, ACTEUR) VALUES(SEQ_ROLE.NEXTVAL, CURRENT_DATE, 'ROLE_SUPER_ADMIN', 0, 'bermone');
INSERT INTO ROLE(ID, DT_CREATION, ROLE, VERSION, ACTEUR) VALUES(SEQ_ROLE.NEXTVAL, CURRENT_DATE, 'ROLE_USER', 0, 'bermone');