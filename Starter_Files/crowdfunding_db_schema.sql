-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/5EFD6p
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "category" (
    "category_id" char(6)   NOT NULL,
    "category" char(20)   ,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" char(12)   NOT NULL,
    "subcategory" char(30)  ,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "contacts" (
    "contact_id" char(8)   NOT NULL,
    "first_name" char(50)  ,
    "last_name" char(50)  ,
    "email" char(50)  ,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "campaign" (
    "cf_id" char(6)   NOT NULL,
    "contact_id" char(8)   NOT NULL,
    "company_name" char(50)  ,
    "description" char(100)  ,
    "goal" float  ,
    "pledged" float  ,
    "outcome" char(12)  ,
    "backers_count" integer  ,
    "country" char(3)  ,
    "currency" char(3)  ,
    "launch_date" timestamp  ,
    "end_date" timestamp  ,
    "category_id" char(6)   NOT NULL,
    "subcategory_id" char(12)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);



ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

