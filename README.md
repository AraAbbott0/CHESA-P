# CHESA-P

I.	Introduction 

The Comprehensive Health and Environmental Statistics Assembly for Preconception (CHESA-P) is a relational database intended for the categorization and nexus of birth defects studies published in various research journals, the Centers for Disease Control and Prevention (CDC), and ClinicalTrials.gov.  It contains information on genetic, environmental, and complex correlated factors investigated pertaining to congenital anomalies.

II.	Overview 

Birth defects occur in one in every 33 babies born in the United States each year and account for 20% of all infant deaths (Centers for Disease Control and Prevention, 2020).  This database is designed to be a decision-making resource for physicians when requiring possible screening information and current research on birth defects.

III.	Literature Review 

The birth defect data was acquired from the CDC’s Data and Statistics page for Birth Defects (Centers for Disease Control and Prevention, 2022).  For the clinical research table, I searched for keyword, “birth defects” on ClinicalTrials.gov and selected pertinent studies with the information needed to populate the table.  The multifactorial tables contain the DOI of the research articles where the data for the respective tables were collected.
	
IV.	Assumptions and considerations

A.	Birth defects names

Some articles may provide different names for specific birth defects.  The name provided in the Center for Disease Control and Prevention (CDC) website will be used for consistency.

B.	Attribute names
Some attribute names may change depending on the common ways the articles identify them. For example, some articles may discuss single nucleotide polymorphisms (SNPs) rather than alleles.  This may result in changes in the attribute name but may still refer to the allele/variant, depending on the naming convention used or is available.

V.	Design Decisions 

A. Associated factors

Because of the complexity of possible causes involved in pregnancies resulting in birth defects, this initiative will focus of categorizing associated causes as genetic, environmental, and complex (Czeizel, 2005), which each of the associated group as a table. 
 
B. Clinical research

The clinical_research table will contain clinical studies investigating a specific birth defect and potential treatment(s).  The reason for having this table is for physicians and counselors to connect with researchers on current research that may be able to help patients with a history of a pregnancy or pregnancies affected by a birth defect.  

C. Epigenetic factors as a subtype for complex factors

The epigenetic_factors table is a subtype of the complex_factors table because epigenetic mechanisms are involved in processes also affected by the other factors such as environmental and genetic components in reproduction.  These downstream effects are characterized by cellular function and phenotypical characteristics, leading to congenital malformations (Greene & Pisano, 2018).

VI.	Statement of Work (SOW) 

A.	Purpose and Objectives
CHESA-P will function as a repository for researchers to submit multi-omic associated causes of birth defects and as a resource for physicians who require inclusive information for their patients’ precision preconception care.  By having access to the database, researchers can input pertinent genetic, epigenetic, and environmental components that have been associated with a birth defect.  Physicians who are seeking guidance for prospective parents who may be carriers of a certain disease, have metabolic disorders, or other factors that may affect a potential pregnancy may access CHESA-P to mitigate possible negative effects.  

The completion of this project will be executed with the following objectives:

a.	Initialization, preparation, and planning

i.	The goal of the project at this stage is to create a statement of work (SOW) that outlines the background and to articulate the purpose of the database. 

b.	System analysis and requirement definition

i.	With the SOW as a general guideline, the business rules must identify the entities, attributes and the cardinalities that exist between these entities.  The SOW remarks will be noted, and changes will be made to the SOW.
  
ii.	The requirements definition document draft includes the descriptions of each entity, attribute, relationship, and cardinality. 

iii.	The entity relationship diagram abides by the following requirements:

1.	Entities: minimum 5, maximum 6
2.	Attributes: minimum 5
3.	Relationships with Crow’s feet notation
4.	Keys:
a.	Primary keys
b.	Foreign keys
5.	Translation of the rules/requirements onto the diagram
6.	Labels and comments
iv.	A review of the requirements definition and ERD diagram drafts was conducted.

c.	Database design

i.	Following any changes required to the requirements and the ERD, a structure query language (SQL) script will be created.  To maintain data integrity and build the actual database, the entity relationship diagram (ERD) must capture the articulated requirements per the business rules and staying true to the purposes expanded upon by the SOW.  The SQL script will contain data definition language (DDL) for required database objects. 

ii.	The minimum requirements include drop statements, create/alter statements, indexes, 2 views minimum, 2 sequences minimum, 2 triggers minimum, and comments.  The submission also includes an output report from all the execution statements.  Creation begins after the requirements definition and ERD changes have been.

d.	Database implementation

i.	Upon the completion of the design model, the database can be physically created with an error-free SQL script containing data manipulation language (DML) with minimum requirements including 10 rows in all tables, automatic population of all surrogate keys, and separate DML for different tables.  20 queries are also included. 

ii.	Updates to the previous documents will be made upon receiving the remarks.

iii.	The DML script will be started upon completion of the previous step.

iv.	A comprehensive review is completed.

 
B.	Project Scope

a.	This project includes within its scope:
i.	Project requirements and design
ii.	Entity-relationship model
iii.	SQL script containing DDL statements
iv.	SQL script containing DML statements
v.	The creation of the CHESA-P with data from the Birth Defects Research journal, Centers for Disease Control and Prevention (CDC), and clinical trials

b.	This project DOES NOT include within its scope:
i.	The security authorizations for the users
ii.	The user interface

C.	Database Goals, Expectations, and Deliverables

CHESA-P is designed to be an evolving project, updated when new studies are available to be catalogued.  With the initial completion of this project, this database should contain birth defects information with queries resulting in information that can help guide the user into potential personalized screening and treatment.  The expectation for this project is that it can grow into multiple resources that can be applied not only for preconception (-P), but also for other conditions in other areas such as oncology (-O), aging (-A), and development (-D). Upon completion of this project, the following documents will have been finalized:  SOW document, ERD, DDL scripts, example DML and SQL scripts.  

D.	Database Benefits

Congenital anomalies, otherwise known as birth defects, are preventable.  There is no single cure for any birth defect, but 85.3% of cases can potentially be mitigated using information regarding three main group causes: genetic, environmental, and complex (Czeizel, 2005).  This database project expands on these group causes by functioning as a resource containing genetic, epigenetic, and environmental associated causes of birth defects, as well as clinical trials.

Prospective parents have the most benefit from CHESA-P.  When starting a family, they can consult with a physician who, upon reviewing their genome, epigenome, and environmental components, can access the database and find if one or multiple of their components match a potential birth defect.  The physician can then advise them on any screening and targeted treatments that can help the prospective parents with having a healthy pregnancy.  If a birth defect has been determined of highly likely, the physician can contact researchers regarding clinical studies that are available for the parents to consider participation.  On the bench side of the treatment, researchers can input their results into the database, query for other results, and connect with physicians.
This database will hopefully make it easier for patients to have their concerns addressed by a physician and the physician to contact researchers.  With most birth defects being preventable, CHESA-P can help many parents be spared from losing a child, or a child being born and suffering with a disease that could have been avoided.

E.	Project Hardware and Software Tools

a.	Diagramming and designing tool: ER-Assistant Version 2.10, running on Windows 10 via UMGC VDA connection
b.	Word processing: Microsoft Office
c.	Database: Oracle database, SQL Plus Version 19.3
d.	Access methods:
i.	From Windows 10 desktop with ER-Assistant installed
ii.	From macOS laptop via UMGC Virtual Desktop
e.	Hardware and software: 
i.	HP Pavilion running Windows 10
ii.	MacBook Air M1 running macOS Monterey
f.	Research journal: Birth Defects Research
g.	Notes: Microsoft OneNote

F.	SQL Usage and Style Guide (Martins, 2021)
a.	SQL statement structure for readability and maintenance 
i.	Uppercase for keywords
ii.	Indentation and white space for formatting
iii.	Splitting into multiple, smaller lines as needed
b.	Script format
i.	SELECT allele_id,
   gene_id
FROM genetic_factors
c.	Comment usage
i.	Comments for script grouping
ii.	Comments for lines as needed
iii.	Begin comments with “/*” and end with “*/”
d.	Object naming conventions
i.	Object names will begin with a letter
ii.	Snake case for tables and attributes
e.	DDL statements
i.	All uppercase for keywords
f.	DML statements
i.	All uppercase for keywords
 
VII.	Requirements Definition Document 

The entities and relationships are in the entity-relationship diagram included in the package with this document.  The following information contains the summary of the ERD which include:
•	6 entities
•	5-10 attributes in entities
•	Relationships (Crow’s Feet Notation in ERD)
•	Primary keys (labeled)
•	Foreign keys (FK_ prefix in attributes)
•	ERD matching definitions
•	Labels and comments on each entity, attribute, and relationship
