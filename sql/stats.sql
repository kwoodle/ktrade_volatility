use test;
select symbol,
       round(avg(volume*close)) as vwap,
       round(variance(pct_open), 2)  as var_open,
       round(variance(pct_high), 2)  as var_high,
       round(variance(pct_low), 2)  as var_low,
       round(variance(pct_close), 2)  as var_close
from USE_2021
group by symbol
order by avg(volume*close) desc;