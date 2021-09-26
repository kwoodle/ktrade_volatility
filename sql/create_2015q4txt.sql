use test;
CREATE TABLE if not exists `2015q4txt` (
  `cik` int(10) NOT NULL `flag`=2,
  `name` varchar(350) NOT NULL `flag`=3,
  `fye` int(11) NOT NULL `flag`=25,
  `form` varchar(10) NOT NULL `flag`=26,
  `period` date NOT NULL `date_format`='YYYYMMDD' `flag`=27,
  `fy` date DEFAULT NULL `date_format`='YYYY' `flag`=28,
  `fp` varchar(2) DEFAULT NULL `flag`=29
) ENGINE=CONNECT DEFAULT CHARSET=latin1 `table_type`=CSV `file_name`='/var/mariadb/data/Edgar/2015q4_sub.txt' `header`=1 `sep_char`='	'
