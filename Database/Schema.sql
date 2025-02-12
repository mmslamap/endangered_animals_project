CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar UNIQUE,
  "password_hash" varchar,
  "role" varchar,
  "country_id" integer,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "animals" (
  "id" integer PRIMARY KEY,
  "common_name" varchar UNIQUE,
  "scientific_name" varchar UNIQUE,
  "vulnerability_status" varchar,
  "conservation_measure" varchar,
  "imageLink" varchar,
  "assoc_habitats" varchar
);

CREATE TABLE "countries" (
  "id" integer PRIMARY KEY,
  "name" varchar UNIQUE
);

CREATE TABLE "threats" (
  "id" integer PRIMARY KEY,
  "name" varchar UNIQUE
);

CREATE TABLE "user_animals" (
  "user_id" integer,
  "animal_id" integer,
  PRIMARY KEY ("user_id", "animal_id")
);

CREATE TABLE "animal_threats" (
  "animal_id" integer,
  "threat_id" integer,
  PRIMARY KEY ("animal_id", "threat_id")
);

CREATE TABLE "animal_countries" (
  "animal_id" integer,
  "country_id" integer,
  PRIMARY KEY ("animal_id", "country_id")
);

ALTER TABLE "users" ADD FOREIGN KEY ("country_id") REFERENCES "countries" ("id");

ALTER TABLE "user_animals" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "user_animals" ADD FOREIGN KEY ("animal_id") REFERENCES "animals" ("id");

ALTER TABLE "animal_threats" ADD FOREIGN KEY ("animal_id") REFERENCES "animals" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "animal_threats" ADD FOREIGN KEY ("threat_id") REFERENCES "threats" ("id");

ALTER TABLE "animal_countries" ADD FOREIGN KEY ("animal_id") REFERENCES "animals" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "animal_countries" ADD FOREIGN KEY ("country_id") REFERENCES "countries" ("id");