# daikin_postgres
Postgresql>=11.0

Tested on raspberry pi

postgres database for daikin altherma 3 BRP069A62 

install https://pypi.org/project/python-daikin-altherma/

add lines:

@property
    def tank_consumption(self) -> dict:
        """ Returns the tank energy consumption in kWh per [D]ay, [W]eek, [M]onth """
        return self._requestValueHP("2/Consumption/la", "m2m:rsp/pc/m2m:cin/con")

print(ad.adapter_model,";",ad.outdoor_temperature,";",ad.tank_temperature,";",ad.leaving_water_temperature,";",ad.power_state,";",ad.power_consumption,";",ad.tank_consumption)

save as: daikin_wrapper.py

download daikin.sh to the new folder /var/lib/postgresql/daikin/

create schema: daikin on postgres db with postgres user

run daikin.sql

create new crontab for postgres user:


15,45 * * * * /var/lib/postgresql/daikin/daikin.sh >> /var/lib/postgresql/logs/daikin.log

run views:

daikin_daily

daikin_daily_current

daikin_daily_sum



