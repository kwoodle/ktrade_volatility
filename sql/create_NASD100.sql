-- from kaggle, unsure of date
-- File at /KWdata/data/nasdaq_100.csv

# Company,Ticker,GICS Sector,GICS Sub-Industry
# Activision Blizzard,ATVI,Communication Services,Interactive Home Entertainment

use useq;
drop table if exists NASD100;
create table if not exists NASD100
(
    `Company`      varchar(200) NOT NULL,
    `symbol`       varchar(200) NOT NULL,
    `gics_sector`  varchar(200) NOT NULL,
    `sub_industry` varchar(200) NOT NULL
) ENGINE = CONNECT `table_type`=CSV `file_name`='/KWdata/data/nasdaq_100.csv'
    `header`=1 `sep_char`=',' quoted=1;