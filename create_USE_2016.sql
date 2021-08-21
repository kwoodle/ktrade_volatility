use test;
CREATE TABLE if not exists `USE_2016` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1
