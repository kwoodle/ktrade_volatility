use test;
select symbol, volume, ntile(5) over (order by volume desc) n_vol
from USE_2016
where tradedate = '2016-01-05'
  and symbol like 'cb%'
order by 3
limit 20;
