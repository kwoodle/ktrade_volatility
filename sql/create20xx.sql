drop table if exists useq.USE_2021;
create table if not exists useq.USE_2021
(
    `symbol`    varchar(10)  NOT NULL,
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
select symbol,
       tradedate,
       open,
       high,
       low,
       close,
       volume,
       useq.pctchg(open, lag(open) over (partition by symbol order by tradedate))   as pct_open,
       useq.pctchg(high, lag(high) over (partition by symbol order by tradedate))   as pct_high,
       useq.pctchg(low, lag(low) over (partition by symbol order by tradedate))     as pct_low,
       useq.pctchg(close, lag(close) over (partition by symbol order by tradedate)) as pct_close,
       useq.pctchg(high, low)                                                       as pct_hilo,
       useq.pctchg(open, close)                                                     as pct_opclo
from zips.USE_2021z
