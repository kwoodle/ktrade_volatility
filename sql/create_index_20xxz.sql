drop table if exists idxzips.IDX_2021z;
CREATE TABLE if not exists idxzips.IDX_2021z
(
    `symbol`    varchar(10)  NOT NULL,
    `tradedate` date         NOT NULL `date_format`='YYYYMMDD',
    `open`      float(12, 2) NOT NULL,
    `high`      float(12, 2) NOT NULL,
    `low`       float(12, 2) NOT NULL,
    `close`     float(12, 2) NOT NULL,
    `volume`    bigint(20)   NOT NULL DEFAULT 0
) ENGINE = CONNECT
  DEFAULT CHARSET = latin1 `table_type`=CSV `file_name`='/var/mariadb/data/Index/2021/INDEX*.zip'
    `header`=0 `sep_char`=',' `zipped`=1 `multiple`=1 `option_list`='Entry=*.txt'
