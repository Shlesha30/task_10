Select (season,state_id,production,annual_rainfall) from agricultural_data as a

select (state_id,candidate_name,party) from election_data as e


select a.season,e.state_id,a.production from agricultural_data as a
inner join election_data as e
on a.state_id=e.state_id
where e.state_id= 'Karnataka'
	

create or replace function total_production()
RETURNS TRIGGER AS $$
	DECLARE tp int;
BEGIN
     select a.season,e.state_id,a.production from agricultural_data as a
     inner join election_data as e
     on a.state_id=e.state_id
     where a.state_id = NEW.Production+ 100;
 update  agricultural_data set total_production= tp where a.season = NEW.Production+ 100;

END
$$ LANGUAGE plpgsql;

create trigger trigger_totalproduction
BEFORE INSERT ON agricultural_data
for EACH ROW
EXECUTE FUNCTION total_production()

select * from election_data
 insert into agricultural_data(state_id, production) values ('Sikkim','5000')


