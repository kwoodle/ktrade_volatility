CREATE TABLE if not exists `USEtxt` (
  `symbol` varchar(10) NOT NULL,
  `tradedate` date NOT NULL `date_format`='YYYYMMDD',
  `open` float(12,2) NOT NULL,
  `high` float(12,2) NOT NULL,
  `low` float(12,2) NOT NULL,
  `close` float(12,2) NOT NULL,
  `volume` bigint(20) NOT NULL
) ENGINE=CONNECT DEFAULT CHARSET=latin1 `table_type`=CSV `file_name`='/var/mariadb/data/USEQ/USE_20210722.txt' `header`=0 `sep_char`=','
