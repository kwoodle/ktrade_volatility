use test;
select distinct us.symbol, avg(us.volume*us.close) as vwp from USEQ_HIST us
join US_SymsWithOptions USWO on us.symbol = USWO.Symbol
where USWO.`Symbol Type` = 'Equity'
group by us.symbol having vwp > 50000000. order by vwp desc;