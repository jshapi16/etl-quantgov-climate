-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/VEuyYa
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "fed_data" (
    "ID" SERIAL PRIMARY KEY,
    "agencyID" INT,
    "year" INT,
    "agencyName" VARCHAR,
    "totalRegs" INT
     )
);

CREATE TABLE "fema_data" (
    "ID" SERIAL PRIMARY KEY,
    "state" VARCHAR,
    "year" INT,
    "incident_type" VARCHAR,
    "incident_title" VARCHAR,
     )
);

