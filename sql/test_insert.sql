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
) ENGINE=CONNECT DEFAULT CHARSET=latin1 `table_type`=CSV `file_name`='/var/mariadb/data/USEQ/post_0722/USE_20210723.txt' `header`=0 `sep_char`=',';

drop table if exists USEQ_TEST;
create table if not exists USEQ_TEST
(
    `symbol`    varchar(10) NOT NULL,
    `tradedate` date        NOT NULL,
    `open`      float(12, 2) DEFAULT NULL,
    `high`      float(12, 2) DEFAULT NULL,
    `low`       float(12, 2) DEFAULT NULL,
    `close`     float(12, 2) DEFAULT NULL,
    `volume`    bigint(20)   DEFAULT NULL,
    `pct_open`  float        DEFAULT NULL,
    `pct_high`  float        DEFAULT NULL,
    `pct_low`   float        DEFAULT NULL,
    `pct_close` float        DEFAULT NULL,
    `pct_hilo`  float        DEFAULT NULL,
    `pct_opclo` float        DEFAULT NULL,
    PRIMARY KEY (`symbol`, `tradedate`)
) as
    select * from USE_2021 where tradedate > '2021-06-15';

insert into USEQ_TEST
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
from USEQ_TEST as u1
         left join USEQ_TEST as u2 on u1.symbol = u2.symbol and u1.tradedate < u2.tradedate
         join USEtxt as txt on u1.symbol = txt.symbol
where u2.symbol is null;