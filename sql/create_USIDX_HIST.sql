use test;
drop table if exists USIDX_HIST;
CREATE TABLE if not exists `USIDX_HIST`
(
    `symbol`    varchar(10) NOT NULL,
    `tradedate` date        NOT NULL,
    `open`      float(12, 2)         NOT NULL,
    `high`      float(12, 2)         NOT NULL,
    `low`       float(12, 2)         NOT NULL,
    `close`     float(12, 2)         NOT NULL,
    `volume`    bigint(20)  NOT NULL DEFAULT 0,
    `pct_open`  float       NOT NULL DEFAULT 0,
    `pct_high`  float       NOT NULL DEFAULT 0,
    `pct_low`   float       NOT NULL DEFAULT 0,
    `pct_close` float       NOT NULL DEFAULT 0,
    `pct_hilo`  float       NOT NULL DEFAULT 0,
    `pct_opclo` float       NOT NULL DEFAULT 0,
    PRIMARY KEY (`symbol`, `tradedate`)
) ENGINE = MRG_MyISAM
  DEFAULT CHARSET = latin1
  INSERT_METHOD = LAST
  UNION = (`USIDX_2016`,`USIDX_2017`,`USIDX_2018`,`USIDX_2019`,`USIDX_2020`,`USIDX_2021`)
