/*
 PostgreSQL Data Transfer

 Source Server         : pi_postgres
 Source Server Type    : PostgreSQL
 Source Server Version : 110010
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : daikin

 Target Server Type    : PostgreSQL
 Target Server Version : 110010
 File Encoding         : 65001

 Date: 14/03/2021 20:48:03
*/


-- ----------------------------
-- Table structure for daikin_index
-- ----------------------------
DROP TABLE IF EXISTS "daikin"."daikin_index";
CREATE TABLE "daikin"."daikin_index" (
  "daikin_idx" int4,
  "daikin_day" int2,
  "daikin_week" int2,
  "daikin_month" int2,
  "daikin_day_text" varchar(255) COLLATE "pg_catalog"."default",
  "daikin_week_text" char(3) COLLATE "pg_catalog"."default",
  "daikin_month_text" varchar(255) COLLATE "pg_catalog"."default",
  "daikin_day_period" int2
)
;
ALTER TABLE "daikin"."daikin_index" OWNER TO "postgres";

-- ----------------------------
-- Records of daikin_index
-- ----------------------------
BEGIN;
INSERT INTO "daikin"."daikin_index" VALUES (11, 0, 5, 12, '22:00 - 00:00', 'FRI', 'december', 95);
INSERT INTO "daikin"."daikin_index" VALUES (12, 2, 6, 1, '00:00 - 02:00', 'SAT', 'january', NULL);
INSERT INTO "daikin"."daikin_index" VALUES (13, 4, 7, 2, '02:00 - 04:00', 'SUN', 'february', NULL);
INSERT INTO "daikin"."daikin_index" VALUES (14, 6, NULL, 3, '04:00 - 06:00', NULL, 'march', NULL);
INSERT INTO "daikin"."daikin_index" VALUES (15, 8, NULL, 4, '06:00 - 08:00', NULL, 'april', NULL);
INSERT INTO "daikin"."daikin_index" VALUES (16, 10, NULL, 5, '08:00 - 10:00', NULL, 'may', NULL);
INSERT INTO "daikin"."daikin_index" VALUES (17, 12, NULL, 6, '10:00 - 12:00', NULL, 'june', NULL);
INSERT INTO "daikin"."daikin_index" VALUES (18, 14, NULL, 7, '12:00 - 14:00', NULL, 'july', NULL);
INSERT INTO "daikin"."daikin_index" VALUES (19, 16, NULL, 8, '14:00 - 16:00', NULL, 'august', NULL);
INSERT INTO "daikin"."daikin_index" VALUES (20, 18, NULL, 9, '16:00 - 18:00', NULL, 'september', NULL);
INSERT INTO "daikin"."daikin_index" VALUES (21, 20, NULL, 10, '18:00 - 20:00', NULL, 'october', NULL);
INSERT INTO "daikin"."daikin_index" VALUES (22, 22, NULL, 11, '20:00 - 22:00', NULL, 'november', NULL);
INSERT INTO "daikin"."daikin_index" VALUES (23, 0, NULL, 12, '22:00 - 00:00', NULL, 'december', NULL);
INSERT INTO "daikin"."daikin_index" VALUES (0, 2, 1, 1, '00:00 - 02:00', 'MON', 'january', 8);
INSERT INTO "daikin"."daikin_index" VALUES (1, 4, 2, 2, '02:00 - 04:00', 'TUE', 'february', 16);
INSERT INTO "daikin"."daikin_index" VALUES (2, 6, 3, 3, '04:00 - 06:00', 'WED', 'march', 24);
INSERT INTO "daikin"."daikin_index" VALUES (3, 8, 4, 4, '06:00 - 08:00', 'THU', 'april', 32);
INSERT INTO "daikin"."daikin_index" VALUES (4, 10, 5, 5, '08:00 - 10:00', 'FRI', 'may', 40);
INSERT INTO "daikin"."daikin_index" VALUES (5, 12, 6, 6, '10:00 - 12:00', 'SAT', 'june', 48);
INSERT INTO "daikin"."daikin_index" VALUES (6, 14, 7, 7, '12:00 - 14:00', 'SUN', 'july', 56);
INSERT INTO "daikin"."daikin_index" VALUES (7, 16, 1, 8, '14:00 - 16:00', 'MON', 'august', 64);
INSERT INTO "daikin"."daikin_index" VALUES (8, 18, 2, 9, '16:00 - 18:00', 'TUE', 'september', 72);
INSERT INTO "daikin"."daikin_index" VALUES (9, 20, 3, 10, '18:00 - 20:00', 'WED', 'october', 80);
INSERT INTO "daikin"."daikin_index" VALUES (10, 22, 4, 11, '20:00 - 22:00', 'THU', 'november', 88);
COMMIT;


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

-- ----------------------------
-- Function structure for fcie_daikin_index
-- ----------------------------
DROP FUNCTION IF EXISTS "daikin"."fcie_daikin_index"("generate_date" timestamp);
CREATE OR REPLACE FUNCTION "daikin"."fcie_daikin_index"("generate_date" timestamp)
  RETURNS "pg_catalog"."int4" AS $BODY$
declare
   daikin_index integer;
begin
 case 
       when to_char(generate_date, 'HH24') = '00' then
               daikin_index = 11;
		   when to_char(generate_date, 'HH24') = '02' then
               daikin_index = 12;
       when to_char(generate_date, 'HH24') = '04' then
               daikin_index = 13;
			 when to_char(generate_date, 'HH24') = '06' then
               daikin_index = 14;
			 when to_char(generate_date, 'HH24') = '08' then
               daikin_index = 15;
			 when to_char(generate_date, 'HH24') = '10' then
               daikin_index = 16;
			 when to_char(generate_date, 'HH24') = '12' then
               daikin_index = 17;
			 when to_char(generate_date, 'HH24') = '14' then
               daikin_index = 18;
			 when to_char(generate_date, 'HH24') = '16' then
               daikin_index = 19;
			 when to_char(generate_date, 'HH24') = '18' then
               daikin_index = 20;
			 when to_char(generate_date, 'HH24') = '20' then
               daikin_index = 21;
			 when to_char(generate_date, 'HH24') = '22' then
               daikin_index = 22;
           else
               daikin_index = 23;
        end case;
   
   return daikin_index;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION "daikin"."fcie_daikin_index"("generate_date" timestamp) OWNER TO "postgres";

-- ----------------------------
-- View structure for daikin_daily
-- ----------------------------
DROP VIEW IF EXISTS "daikin"."daikin_daily";
CREATE VIEW "daikin"."daikin_daily" AS  WITH daikin_wrap_json AS (
         SELECT json_array_elements('[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]'::json)::text::numeric AS idx,
            json_array_elements(((daikin_wrap.power_consumption -> 'Electrical'::text) -> 'Heating'::text) -> 'D'::text) AS heating_daily,
            json_array_elements(((daikin_wrap.power_consumption -> 'Electrical'::text) -> 'Heating'::text) -> 'W'::text) AS heating_weekly,
            json_array_elements(((daikin_wrap.power_consumption -> 'Electrical'::text) -> 'Heating'::text) -> 'M'::text) AS heating_monthly,
            json_array_elements(((daikin_wrap.tank_consumption -> 'Electrical'::text) -> 'Heating'::text) -> 'D'::text) AS tank_daily,
            json_array_elements(((daikin_wrap.tank_consumption -> 'Electrical'::text) -> 'Heating'::text) -> 'W'::text) AS tank_weekly,
            json_array_elements(((daikin_wrap.tank_consumption -> 'Electrical'::text) -> 'Heating'::text) -> 'M'::text) AS tank_monthly,
            daikin_wrap.adapter_model,
            daikin_wrap.outdoor_temperature,
            daikin_wrap.tank_temperature,
            daikin_wrap.leaving_water_temperature,
            daikin_wrap.power_state,
            daikin_wrap.power_consumption,
            daikin_wrap.tank_consumption,
            daikin_wrap.generate_date
           FROM daikin.daikin_wrap
        ), daikin_temperature AS (
         SELECT to_char(daikin_wrap.generate_date, 'yyyymmdd'::text) AS generate_date,
            max(daikin_wrap.outdoor_temperature::numeric) AS max_temp,
            min(daikin_wrap.outdoor_temperature::numeric) AS min_temp
           FROM daikin.daikin_wrap
          GROUP BY (to_char(daikin_wrap.generate_date, 'yyyymmdd'::text))
        )
 SELECT to_char(dwj.generate_date - '1 day'::interval, 'yyyymm'::text) AS generate_month,
    to_char(dwj.generate_date - '1 day'::interval, 'yyyymmdd'::text) AS generate_date,
    di.daikin_idx,
    di.daikin_day_period,
    di.daikin_day AS daikin_hours,
    di.daikin_day_text,
    dwj.heating_daily::text::numeric AS heating_kw_per_2h,
    dwj.tank_daily::text::numeric AS tank_kw_per_2h,
    dt.max_temp,
    dt.min_temp,
    round((dt.max_temp + dt.min_temp) / 2::numeric, 1) AS avg_temp
   FROM daikin_wrap_json dwj
     JOIN daikin.daikin_index di ON di.daikin_idx::numeric = dwj.idx
     JOIN daikin_temperature dt ON dt.generate_date = to_char(dwj.generate_date - '1 day'::interval, 'yyyymmdd'::text)
  WHERE to_char(dwj.generate_date, 'HH24:MI'::text) = '00:15'::text AND di.daikin_idx < 12
  ORDER BY (to_char(dwj.generate_date - '1 day'::interval, 'yyyymmdd'::text)), di.daikin_idx;
ALTER TABLE "daikin"."daikin_daily" OWNER TO "postgres";

-- ----------------------------
-- View structure for daikin_daily_sum
-- ----------------------------
DROP VIEW IF EXISTS "daikin"."daikin_daily_sum";
CREATE VIEW "daikin"."daikin_daily_sum" AS  SELECT daikin_daily.generate_month,
    daikin_daily.generate_date,
    sum(daikin_daily.heating_kw_per_2h) AS heating_kwh,
    sum(daikin_daily.tank_kw_per_2h) AS tank_kwh,
    max(daikin_daily.max_temp) AS max_temp,
    min(daikin_daily.min_temp) AS min_temp,
    round(avg(daikin_daily.avg_temp), 1) AS avg_temp
   FROM daikin.daikin_daily
  GROUP BY GROUPING SETS ((daikin_daily.generate_month, daikin_daily.generate_date, daikin_daily.max_temp, daikin_daily.min_temp, daikin_daily.avg_temp), (daikin_daily.generate_month))
  ORDER BY daikin_daily.generate_month, daikin_daily.generate_date;
ALTER TABLE "daikin"."daikin_daily_sum" OWNER TO "postgres";

-- ----------------------------
-- View structure for daikin_daily_current
-- ----------------------------
DROP VIEW IF EXISTS "daikin"."daikin_daily_current";
CREATE VIEW "daikin"."daikin_daily_current" AS  SELECT
        CASE
            WHEN to_char(daikin_wrap.generate_date, 'HH24'::text) = '00'::text THEN to_char(daikin_wrap.generate_date - '1 day'::interval, 'yyyymmdd'::text)
            ELSE to_char(daikin_wrap.generate_date, 'yyyymmdd'::text)
        END AS generate_date,
    (to_char(daikin_wrap.generate_date - '02:00:00'::interval, 'HH24:00'::text) || ' - '::text) || to_char(daikin_wrap.generate_date, 'HH24:00'::text) AS generate_hour,
    (((daikin_wrap.power_consumption -> 'Electrical'::text) -> 'Heating'::text) -> 'D'::text) -> daikin.fcie_daikin_index(daikin_wrap.generate_date) AS heating_kwh,
    (((daikin_wrap.tank_consumption -> 'Electrical'::text) -> 'Heating'::text) -> 'D'::text) -> daikin.fcie_daikin_index(daikin_wrap.generate_date) AS tank_kwh,
    daikin_wrap.outdoor_temperature,
    daikin_wrap.leaving_water_temperature,
    daikin_wrap.tank_temperature
   FROM daikin.daikin_wrap
  WHERE to_char(daikin_wrap.generate_date, 'yyyymmdd HH24:MI'::text) >= to_char(CURRENT_DATE::timestamp with time zone, 'yyyymmdd 00:15'::text) AND (to_char(daikin_wrap.generate_date, 'HH24'::text)::numeric % 2::numeric) = 0::numeric AND to_char(daikin_wrap.generate_date, 'MI'::text) = '15'::text;
ALTER TABLE "daikin"."daikin_daily_current" OWNER TO "postgres";
