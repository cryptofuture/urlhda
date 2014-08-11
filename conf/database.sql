DROP TABLE IF EXISTS "public"."links";
CREATE TABLE "public"."links" (
  "id" serial PRIMARY KEY,
  "uid" varchar(10) NOT NULL COLLATE "default",
  "url" varchar NOT NULL COLLATE "default",
  "created_at" timestamp(6) NULL DEFAULT now()
);

ALTER TABLE "public"."links" ADD CONSTRAINT "uuid" UNIQUE ("uid") NOT DEFERRABLE INITIALLY IMMEDIATE;
