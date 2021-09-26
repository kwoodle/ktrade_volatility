use test;
select symbol,
       round(avg(volume)) as avg_vol,
       round(max(volume)) as max_vol,
       round(min(volume)) as min_vol,
       round(avg(close), 2)  avg_close,
       round(max(close), 2)  max_close,
       round(min(close), 2)  min_close
from USE_2020
group by symbol
order by avg(volume) desc
limit 20;