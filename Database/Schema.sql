CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" varchar UNIQUE,
  "password_hash" varchar,
  "role" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "animals" (
  "id" integer PRIMARY KEY,
  "common_name" varchar,
  "scientific_name" varchar UNIQUE,
  "red_list_category" varchar,
  "possibly_extinct_in_the_wild" boolean
);

CREATE TABLE "countries" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE
);

CREATE TABLE "threats" (
  "id" SERIAL PRIMARY KEY,
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

ALTER TABLE "user_animals" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "user_animals" ADD FOREIGN KEY ("animal_id") REFERENCES "animals" ("id");

ALTER TABLE "animal_threats" ADD FOREIGN KEY ("animal_id") REFERENCES "animals" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "animal_threats" ADD FOREIGN KEY ("threat_id") REFERENCES "threats" ("id");

ALTER TABLE "animal_countries" ADD FOREIGN KEY ("animal_id") REFERENCES "animals" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "animal_countries" ADD FOREIGN KEY ("country_id") REFERENCES "countries" ("id");