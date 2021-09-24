-- Must run in order of earliest to latest insertions!
-- third do files in /var/mariadb/data/USEQ/post_0903
use test;
drop table if exists USEtxt;
CREATE TABLE if not exists `USEtxt` (
  `symbol` varchar(10) NOT NULL,
  `tradedate` date NOT NULL `date_format`='YYYYMMDD',
  `open` float(12,2) NOT NULL,
  `high` float(12,2) NOT NULL,
  `low` float(12,2) NOT NULL,
  `close` float(12,2) NOT NULL,
  `volume` bigint(20) NOT NULL
) ENGINE=CONNECT DEFAULT CHARSET=latin1 `table_type`=CSV `file_name`='/var/mariadb/data/USEQ/post_0903/USE_20210923.txt' `header`=0 `sep_char`=',';


insert into USE_2021
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
from USE_2021 as u1
         left join USE_2021 as u2 on u1.symbol = u2.symbol and u1.tradedate < u2.tradedate
         join USEtxt as txt on u1.symbol = txt.symbol
where u2.symbol is null;

