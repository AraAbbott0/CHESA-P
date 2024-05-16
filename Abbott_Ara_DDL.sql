SET ECHO ON

--1.	Drop Statements for All Objects as needed 
DROP TABLE epigenetic_factors CASCADE CONSTRAINTS;
DROP TABLE complex_factors CASCADE CONSTRAINTS;
DROP TABLE environmental_factors CASCADE CONSTRAINTS;
DROP TABLE genetic_factors CASCADE CONSTRAINTS;
DROP TABLE clinical_research CASCADE CONSTRAINTS;
DROP TABLE birth_defects CASCADE CONSTRAINTS;

DROP INDEX birth_defect_info;
DROP INDEX research_info;

DROP VIEW "Affected Mothers";
DROP VIEW "Pollution Effects";

DROP SEQUENCE genfac_id_seq;
DROP sequence envfac_id_seq;
DROP SEQUENCE comfac_id_seq;

DROP TRIGGER new_genfac_trigger;
DROP TRIGGER new_envfac_trigger;
DROP TRIGGER new_comfac_trigger;


--2.	Create/Alter Statements for All Tables and Constraints
--3.	Create Indexes for Natural, Foreign Key, and Frequently Queried Columns
CREATE TABLE birth_defects(
birth_defect_id VARCHAR(20 CHAR) NOT NULL,
birth_defect_name VARCHAR(100 CHAR) NOT NULL,
birth_defect_type VARCHAR(100 CHAR) NOT NULL,
frequency INTEGER NOT NULL,
other_names VARCHAR(100 CHAR),
treatment VARCHAR(100 CHAR),
PRIMARY KEY(birth_defect_id)
);

CREATE INDEX birth_defect_info
ON birth_defects(
birth_defect_name, 
birth_defect_type
);

CREATE TABLE clinical_research(
topic_id VARCHAR(10 CHAR) NOT NULL,
study_title VARCHAR(100 CHAR) NOT NULL,
factor_type VARCHAR(20 CHAR) NOT NULL,
birth_defect_name VARCHAR(50 CHAR) NOT NULL,
intervention VARCHAR(100 CHAR) NOT NULL,
institute VARCHAR(200 CHAR) NOT NULL,
country VARCHAR(100 CHAR) NOT NULL,
status VARCHAR(20 CHAR) NOT NULL,
updated_date DATE,
PRIMARY KEY (topic_id),
FOREIGN KEY (birth_defect_name) REFERENCES birth_defects(birth_defect_name)
);

CREATE INDEX research_info
ON clinical_research(
topic_id, 
study_title,
birth_defect_name,
intervention
);


CREATE TABLE genetic_factors(
genfac_id VARCHAR(10 CHAR) NOT NULL,
gene_id VARCHAR(10 CHAR) NOT NULL,
allele_id VARCHAR(20 CHAR) NOT NULL,
gene_locus VARCHAR(10 CHAR) NOT NULL,
chromosome NUMERIC(2) NOT NULL,
birth_defect_name VARCHAR(50 CHAR) NOT NULL,
birth_defect_type VARCHAR(20 CHAR) NOT NULL,
affected_parent CHAR(6) NOT NULL,
geographic_region VARCHAR(50 CHAR),
race_ethnicity VARCHAR(20 CHAR),
associated_factors VARCHAR(10 CHAR),
doi VARCHAR(100 CHAR) NOT NULL,
PRIMARY KEY (genfac_id),
FOREIGN KEY (birth_defect_name) REFERENCES birth_defects(birth_defect_name)
);

-- This displays the genetic factor ID, genetic information, and birth defect information for genetic factors where the mother is affected.
CREATE VIEW "Affected Mothers" AS
SELECT genfac_id, gene_id, allele_id, birth_defect_name, birth_defect_type
FROM genetic_factors
WHERE affected_parent = 'mother';

CREATE SEQUENCE genfac_id_seq
START WITH 0001
MINVALUE 1
NOMAXVALUE
INCREMENT BY 1
NOCACHE;


-- This triggers a new genfac_id when a new entry is made on genetic_factors
CREATE OR REPLACE TRIGGER new_genfac_trigger
BEFORE INSERT ON genetic_factors
FOR EACH ROW
BEGIN
	IF :new.genfac_id IS NULL THEN
		SELECT genfac_id_seq.nextval INTO :new.genfac_id FROM DUAL;
	END IF;
END;


CREATE TABLE environmental_factors(
envfac_id VARCHAR(10 CHAR) NOT NULL,
env_condition VARCHAR(50 CHAR) NOT NULL,
env_type VARCHAR(20 CHAR),
birth_defect_name VARCHAR(50 CHAR),
birth_defect_type VARCHAR(20 CHAR) NOT NULL,
affected_parent CHAR(6),
geographic_region VARCHAR(50 CHAR),
associated_factors VARCHAR(10 CHAR),
doi VARCHAR(100 CHAR),
PRIMARY KEY(envfac_id),
FOREIGN KEY (birth_defect_name) REFERENCES birth_defects(birth_defect_name)
);

-- This displays the environmental factor ID, birth defect information, and georgraphic area affected by pollution.
CREATE VIEW "Pollution Effects" AS
SELECT envfac_id, birth_defect_name, birth_defect_type, geographic_region
FROM environmental_factors
WHERE env_condition = 'pollution';

CREATE SEQUENCE envfac_id_seq
START WITH 0001
MINVALUE 1
NOMAXVALUE
INCREMENT BY 1
NOCACHE;


-- This triggers a new genfac_id when a new entry is made on environmental_factors
CREATE OR REPLACE TRIGGER new_envfac_trigger
BEFORE INSERT ON environmental_factors
FOR EACH ROW
BEGIN
	IF :new.envfac_id IS NULL THEN
		SELECT envfac_id_seq.nextval INTO :new.envfac_id FROM DUAL;
	END IF;
END;

CREATE TABLE complex_factors(
comfac_id VARCHAR(10 CHAR) NOT NULL,
complex_condition VARCHAR(50 CHAR) NOT NULL,
birth_defect_name VARCHAR(50 CHAR),
birth_defect_type VARCHAR(50 CHAR) NOT NULL,
affected_parent CHAR(6) NOT NULL,
geographic_region VARCHAR(100 CHAR),
race_ethnicity VARCHAR(50 CHAR),
associated_factors VARCHAR(10 CHAR),
doi VARCHAR(100 CHAR),
PRIMARY KEY (comfac_id),
FOREIGN KEY (birth_defect_name) REFERENCES birth_defects(birth_defect_name)
);

CREATE SEQUENCE comfac_id_seq
START WITH 0001
MINVALUE 1
NOMAXVALUE
INCREMENT BY 1
NOCACHE;

-- This triggers a new genfac_id when a new entry is made on complex_factors
CREATE OR REPLACE TRIGGER new_comfac_trigger
BEFORE INSERT ON complex_factors
FOR EACH ROW
BEGIN
	IF :new.comfac_id IS NULL THEN
		SELECT comfac_id_seq.nextval INTO :new.comfac_id FROM DUAL;
	END IF;
END;

CREATE TABLE epigenetic_factors(
comfac_id VARCHAR(10 CHAR) NOT NULL,
alteration_type VARCHAR(50 CHAR),
expression VARCHAR(20 CHAR),
gene_id VARCHAR(10 CHAR),
molecule_name VARCHAR(20 CHAR),
associated_factors VARCHAR(10 CHAR),
FOREIGN KEY(comfac_id) REFERENCES complex_factors(comfac_id)
);