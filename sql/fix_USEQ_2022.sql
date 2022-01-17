-- Files from EODData for 2022 don't include 2022-01-01

delete from useq.USE_2022 where tradedate >= '2022-01-01';
use useq;
insert into USE_2022
select
       u21.symbol,
       '2022-01-01',
       u21.close,
       u21.close,
       u21.close,
       u21.close,
       0,0.,0.,0.,0.,0.,0.
from USE_2021 as u21
         left join USE_2022 as u2 on u21.symbol = u2.symbol
where u2.symbol is null and u21.tradedate = '2021-12-31';

