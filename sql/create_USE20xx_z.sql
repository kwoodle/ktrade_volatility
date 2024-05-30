-- May 2024. New PopOS machine. Mariadb secure_file_priv causes problem. Solution is to create directory on /

use zips;
-- drop table if exists `AMEX_2004Z`;
CREATE TABLE if not exists `USEQ_2024Z`
(
    `symbol`    varchar(10)  NOT NULL,
    `tradedate` date         NOT NULL `date_format`='YYYYMMDD',
    `open`      float(12, 2) NOT NULL,
    `high`      float(12, 2) NOT NULL,
    `low`       float(12, 2) NOT NULL,
    `close`     float(12, 2) NOT NULL,
    `volume`    bigint(20)   NOT NULL DEFAULT 0
) ENGINE = CONNECT
  DEFAULT CHARSET = latin1 `table_type`=CSV `file_name`='/KWdata/EODDATA/zips/*_2024.zip' `header`=0 `sep_char`=',' `zipped`=1 `multiple`=1 `option_list`='Entry=*.txt'
