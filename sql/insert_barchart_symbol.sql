-- Barchart History Download one symbol
-- Time,Open,High,Low,Last,Change,%Chg,Volume
-- 11/18/2021,48.1,48.99,45.6953,47.44,-1.06,-2.19%,359500
-- delete last row

delete
from useq.USEQ_HIST
where symbol = 'BKKT';

drop table if exists useq.BarChartSym;
CREATE TABLE if not exists useq.BarChartSym
(
    --   `symbol`    varchar(10)  NOT NULL,
    `tradedate` date         NOT NULL `date_format`='MM/DD/YYYY',
    `open`      float(12, 2) NOT NULL,
    `high`      float(12, 2) NOT NULL,
    `low`       float(12, 2) NOT NULL,
    `close`     float(12, 2) NOT NULL,
    `volume`    bigint(20)   NOT NULL DEFAULT 0 flag= 8
) ENGINE = CONNECT
  DEFAULT CHARSET = latin1 `table_type`=CSV `file_name`='/var/mariadb/data/BarChart/bkkt_daily_historical-data-11-19-2021.csv' `header`=1 `sep_char`=',';

drop table if exists useq.BarChartPlus;
create table if not exists useq.BarchartPlus
(
    `symbol`    varchar(10)           default 'BKKT',
    `tradedate` date         NOT NULL,
    `open`      float(12, 2) NOT NULL,
    `high`      float(12, 2) NOT NULL,
    `low`       float(12, 2) NOT NULL,
    `close`     float(12, 2) NOT NULL,
    `volume`    bigint(20)   NOT NULL DEFAULT 0,
    `pct_open`  float        NOT NULL DEFAULT 0,
    `pct_high`  float        NOT NULL DEFAULT 0,
    `pct_low`   float        NOT NULL DEFAULT 0,
    `pct_close` float        NOT NULL DEFAULT 0,
    `pct_hilo`  float        NOT NULL DEFAULT 0,
    `pct_opclo` float        NOT NULL DEFAULT 0,
    PRIMARY KEY (`symbol`, `tradedate`)
) ENGINE = MyISAM
  DEFAULT CHARSET = latin1
as
select tradedate,
       open,
       high,
       low,
       close,
       volume,
       useq.pctchg(open, lag(open) over (order by tradedate))   as pct_open,
       useq.pctchg(high, lag(high) over (order by tradedate))   as pct_high,
       useq.pctchg(low, lag(low) over (order by tradedate))     as pct_low,
       useq.pctchg(close, lag(close) over (order by tradedate)) as pct_close,
       useq.pctchg(high, low)                                   as pct_hilo,
       useq.pctchg(open, close)                                 as pct_opclo
from useq.BarChartSym;

insert into useq.USEQ_HIST
select *
from useq.BarchartPlus