
CREATE TABLE if not exists `USEQ_HIST` (
  `symbol` varchar(10) NOT NULL,
  `tradedate` date NOT NULL,
  `open` float(12,2) DEFAULT NULL,
  `high` float(12,2) DEFAULT NULL,
  `low` float(12,2) DEFAULT NULL,
  `close` float(12,2) DEFAULT NULL,
  `volume` bigint(20) DEFAULT NULL,
  `pct_open` float DEFAULT NULL,
  `pct_high` float DEFAULT NULL,
  `pct_low` float DEFAULT NULL,
  `pct_close` float DEFAULT NULL,
  `pct_hilo` float DEFAULT NULL,
  `pct_opclo` float DEFAULT NULL,
  PRIMARY KEY (`symbol`,`tradedate`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=latin1 INSERT_METHOD=LAST UNION=(`USE_2016`,`USE_2017`,`USE_2018`,`USE_2019`,`USE_2020`,`USE_2021`)
