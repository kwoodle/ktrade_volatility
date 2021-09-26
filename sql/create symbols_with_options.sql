use test;
drop table if exists US_SymsWithOptions;
create table if not exists US_SymsWithOptions
(
    `Symbol`       varchar(10)  NOT NULL flag=1,
    `Company`      varchar(150) NOT NULL flag=2,
    `Extended Hrs` varchar(5)   NOT NULL flag=7,
    `Settle`       varchar(20)  NOT NULL flag=8,
    `Tick Type`    varchar(20)  NOT NULL flag=9,
    `Symbol Type`  varchar(15)  NOT NULL flag=10
) ENGINE = CONNECT `table_type`=CSV `file_name`='/var/mariadb/data/USEQ/cboe_underlyers_2021_09_17_10.csv'
    `header`=1 `sep_char`=',' quoted=1;