-- moved zip tables from test to zips for 2016 thru 2020
-- use this for earlier years
-- for 2012, use minizip to zip daily txt files and move result to /var/mariadb/data/USEQ/2012
-- eg kwoodle:post_0722> minizip USE_20120923.zip US*.txt

use zips;
drop table if exists `USE_2015z`;
CREATE TABLE if not exists `USE_2015z`
(
    `symbol`    varchar(10)  NOT NULL,
    `tradedate` date         NOT NULL `date_format`='YYYYMMDD',
    `open`      float(12, 2) NOT NULL,
    `high`      float(12, 2) NOT NULL,
    `low`       float(12, 2) NOT NULL,
    `close`     float(12, 2) NOT NULL,
    `volume`    bigint(20)   NOT NULL DEFAULT 0
) ENGINE = CONNECT
  DEFAULT CHARSET = latin1 `table_type`=CSV `file_name`='/var/mariadb/data/USEQ/2015/*.zip' `header`=0 `sep_char`=',' `zipped`=1 `multiple`=1 `option_list`='Entry=*.txt'
