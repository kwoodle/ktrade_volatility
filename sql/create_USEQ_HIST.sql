use useq;
drop table if exists USEQ_HIST;
CREATE TABLE if not exists USEQ_HIST
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
) ENGINE = MRG_MyISAM
  DEFAULT CHARACTER SET = latin1
  INSERT_METHOD = LAST
  UNION = (USE_2011, USE_2012, USE_2013, USE_2014, USE_2015,
      `USE_2016`,`USE_2017`,`USE_2018`,`USE_2019`,`USE_2020`,`USE_2021`)
