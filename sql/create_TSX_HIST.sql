use tsx;
drop table if exists TSX_HIST;
CREATE TABLE if not exists TSX_HIST
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
  UNION = (TSX_2011, TSX_2012, TSX_2013, TSX_2014, TSX_2015, TSX_2016, TSX_2017, TSX_2018,
      TSX_2019, TSX_2020, TSX_2021)
