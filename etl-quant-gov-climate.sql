-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/VEuyYa
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "fed_data" (
    "agencyID" SERIAL   NOT NULL,
    "year" INT   NOT NULL,
    "agencyName" VARCHAR   NOT NULL,
    "totalRegs" INT   NOT NULL,
    CONSTRAINT "pk_fed_data" PRIMARY KEY (
        "agencyID"
     )
);

CREATE TABLE "fema_data" (
    "disaster_id" VARCHAR   NOT NULL,
    "state" VARCHAR   NOT NULL,
    "year" INT   NOT NULL,
    "incident_type" VARCHAR   NOT NULL,
    "incident_title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_fema_data" PRIMARY KEY (
        "disaster_id"
     )
);

