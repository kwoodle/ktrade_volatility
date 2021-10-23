use test;
drop table if exists IDX_2021;
create table if not exists IDX_2021
(
    `symbol`    varchar(10)  NOT NULL,
    `tradedate` date         NOT NULL,
    `open`      float(12, 2) NOT NULL,
    `high`      float(12, 2) NOT NULL,
    `low`       float(12, 2) NOT NULL,
    `close`     float(12, 2) NOT NULL,
    `volume`    bigint(20) NOT NULL DEFAULT 0,
    `pct_open`  float      NOT NULL DEFAULT 0,
    `pct_high`  float      NOT NULL DEFAULT 0,
    `pct_low`   float      NOT NULL DEFAULT 0,
    `pct_close` float      NOT NULL DEFAULT 0,
    `pct_hilo`  float      NOT NULL DEFAULT 0,
    `pct_opclo` float      NOT NULL DEFAULT 0,
    PRIMARY KEY (`symbol`, `tradedate`)
) ENGINE=MyISAM
as
        select symbol,
        tradedate,
        open,
        high,
        low,
        close,
        volume,
        pctchg(open,lag(open) over (partition by symbol order by tradedate)) as pct_open,
        pctchg(high,lag(high) over (partition by symbol order by tradedate)) as pct_high,
        pctchg(low,lag(low) over (partition by symbol order by tradedate)) as pct_low,
        pctchg(close,lag(close) over (partition by symbol order by tradedate)) as pct_close,
        pctchg(high,low) as pct_hilo,
        pctchg(open,close) as pct_opclo
        from IDX_2021z
