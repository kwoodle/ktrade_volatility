use test;
CREATE TABLE if not exists`USE_2020z` (
  `symbol` varchar(10) NOT NULL,
  `tradedate` date NOT NULL `date_format`='YYYYMMDD',
  `open` float(12,2) DEFAULT NULL,
  `high` float(12,2) DEFAULT NULL,
  `low` float(12,2) DEFAULT NULL,
  `close` float(12,2) DEFAULT NULL,
  `volume` bigint(20) DEFAULT NULL
) ENGINE=CONNECT DEFAULT CHARSET=latin1 `table_type`=CSV `file_name`='/var/mariadb/data/USEQ/2020/*.zip' `header`=0 `sep_char`=',' `zipped`=1 `multiple`=1 `option_list`='Entry=*.txt'
