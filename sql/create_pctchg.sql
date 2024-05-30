use zips;
drop function if exists pctchg;
create function pctchg(last float, prev float) returns float deterministic
    if prev = 0. or prev is null then return 0.;
    else return  (last/prev - 1.)*100.;
    end if;
