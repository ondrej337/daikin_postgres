/*
 Navicat PostgreSQL Data Transfer

 Source Server         : postgres
 Source Server Type    : PostgreSQL
 Source Server Version : 110010
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : daikin

 Target Server Type    : PostgreSQL
 Target Server Version : 110010
 File Encoding         : 65001

 Date: 14/03/2021 20:45:08
*/


-- ----------------------------
-- Table structure for daikin_wrap
-- ----------------------------
DROP TABLE IF EXISTS "daikin"."daikin_wrap";
CREATE TABLE "daikin"."daikin_wrap" (
  "adapter_model" varchar(255) COLLATE "pg_catalog"."default",
  "outdoor_temperature" varchar(255) COLLATE "pg_catalog"."default",
  "tank_temperature" varchar(255) COLLATE "pg_catalog"."default",
  "leaving_water_temperature" varchar(255) COLLATE "pg_catalog"."default",
  "power_state" varchar(255) COLLATE "pg_catalog"."default",
  "power_consumption" json,
  "tank_consumption" json,
  "generate_date" timestamp(6) DEFAULT now()
)
;
ALTER TABLE "daikin"."daikin_wrap" OWNER TO "postgres";
