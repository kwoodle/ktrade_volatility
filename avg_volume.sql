use test;
select symbol,
       round(avg(volume))       avg_vol_100s,
       round(max(volume / 100)) max_vol_100s,
       round(min(volume / 100)) min_vol_100s,
       round(avg(close), 2)     avg_close,
       round(max(close), 2)     max_close,
       round(min(close), 2)     min_close
from USE_2020
group by symbol
order by avg(volume) desc
limit 20;