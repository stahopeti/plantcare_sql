select ((
	select COUNT(*) from FREQ_LIGHT
	where LIGHT >= ( 
		select REQ_LIGHT from PLANT_CONFIGS
		where ID in (
			select PLANT_CONFIG_ID from POTS 
			where ID = 1)) and POT_ID = 1)*100 / COUNT(*)) as PERCENTAGEOFSUFFICIENT1 from FREQ_LIGHT;
			
select ((
	select COUNT(*) from FREQ_LIGHT
	where LIGHT >= ( 
		select REQ_LIGHT from PLANT_CONFIGS
		where ID in (
			select PLANT_CONFIG_ID from POTS 
			where ID = 2)) and POT_ID = 2)*100 / COUNT(*)) as PERCENTAGEOFSUFFICIENT2 from FREQ_LIGHT;

/*			
select SUM(LIGHT)/COUNT(*) from SENSOR_DATA;
*/

/*
select REQ_LIGHT from PLANT_CONFIGS	where ID in ( select PLANT_CONFIG_ID from POTS where ID = 1);

select date_format(TIMESTAMP, '%Y-%m-%d') DATEONLY, date_format(TIMESTAMP,'%H:%i:%s') TIMEONLY from FREQ_LIGHT;

select SUM(LIGHT) from SENSOR_DATA
where cast(TIMESTAMP as time) before (
	select SUNRISE from POTS
	where ID = SENSOR_DATA.POT_ID);*/