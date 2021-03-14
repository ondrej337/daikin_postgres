#!/usr/bin/bash
python3 /var/lib/postgresql/daikin/daikin_wrapper.py > /var/lib/postgresql/daikin/daikin_load.csv

sleep 3 

cat /var/lib/postgresql/daikin/daikin_load.csv | psql -d kovals -c "\COPY daikin.daikin_wrap(adapter_model,outdoor_temperature,tank_temperature,leaving_water_temperature,power_state,power_consumption,tank_consumption) FROM '/var/lib/postgresql/daikin/daikin_load.csv'
DELIMITER ';'"

