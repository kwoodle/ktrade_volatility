use test;
drop table if exists IDXtxt;
CREATE TABLE if not exists `IDXtxt` (
  `symbol` varchar(10) NOT NULL,
  `tradedate` date NOT NULL `date_format`='YYYYMMDD',
  `open` float(12,2) NOT NULL,
  `high` float(12,2) NOT NULL,
  `low` float(12,2) NOT NULL,
  `close` float(12,2) NOT NULL,
  `volume` bigint(20) NOT NULL
) ENGINE=CONNECT DEFAULT CHARSET=latin1 `table_type`=CSV `file_name`='/var/mariadb/data/Index/2021/INDEX_20211026.txt' `header`=0 `sep_char`=',';


insert into IDX_2021
select
       txt.symbol,
       txt.tradedate,
       txt.open,
       txt.high,
       txt.low,
       txt.close,
       txt.volume,
       pctchg(txt.open, u1.open),
       pctchg(txt.high, u1.high),
       pctchg(txt.low, u1.low),
       pctchg(txt.close, u1.close),
       pctchg(txt.high, txt.low),
       pctchg(txt.open, txt.close)
from IDX_2021 as u1
         left join IDX_2021 as u2 on u1.symbol = u2.symbol and u1.tradedate < u2.tradedate
         join IDXtxt as txt on u1.symbol = txt.symbol
where u2.symbol is null;

