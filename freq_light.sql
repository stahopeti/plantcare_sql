/*select COUNT(*) from FREQ_LIGHT
where LIGHT >= ( 
	select REQ_LIGHT from PLANT_CONFIGS
	where ID in (
		select PLANT_CONFIG_ID from POTS 
		where ID = FREQ_LIGHT.POT_ID));
	*/

select * from FREQ_LIGHT;	
		
select COUNT(*) from FREQ_LIGHT;

select COUNT(*) as BIGGERTHANSUFFICENT from FREQ_LIGHT
	where LIGHT >= ( 
		select REQ_LIGHT from PLANT_CONFIGS
		where ID in (
			select PLANT_CONFIG_ID from POTS 
			where ID = FREQ_LIGHT.POT_ID)); 

select ((
	select COUNT(*) from FREQ_LIGHT
	where LIGHT >= ( 
		select REQ_LIGHT from PLANT_CONFIGS
		where ID in (
			select PLANT_CONFIG_ID from POTS 
			where ID = FREQ_LIGHT.POT_ID)))*100 / COUNT(*)) as COUNTMINUSSUFFICIENT from FREQ_LIGHT;