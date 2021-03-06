-- Files from EODData for 2022 don't include 2022-01-01

delete from idx.IDX_2022 where tradedate >= '2022-01-01';
use idx;
insert into IDX_2022
select
       u21.symbol,
       '2022-01-01',
       u21.open,
       u21.high,
       u21.low,
       u21.close,
       0,0.,0.,0.,0.,0.,0.
from IDX_2021 as u21
         left join IDX_2022 as u2 on u21.symbol = u2.symbol
where u2.symbol is null and u21.tradedate = '2021-12-31';

