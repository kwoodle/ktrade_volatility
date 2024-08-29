-- from kaggle, unsure of date
-- File at /KWdata/data/sp500list.csv

# symbol,security,sec_filings,gics_sector,sub_industry,headquarters,date_added,cik,founded
# MMM,3M,reports,Industrials,Industrial Conglomerates,"Saint Paul, Minnesota",1976-08-09,0000066740,1902
# AOS,A. O. Smith,reports,Industrials,Building Products,"Milwaukee, Wisconsin",2017-07-26,0000091142,1916

use useq;
drop table if exists SandP500;
create table if not exists SandP500
(
    `symbol`       varchar(5)   NOT NULL,
    `security`     varchar(200) NOT NULL,
    `sec_filings`  varchar(20)  NOT NULL,
    `gics_sector`  varchar(200) NOT NULL,
    `sub_industry` varchar(200) NOT NULL,
    `headquarters` varchar(200) NOT NULL,
    `date_added`   date         NOT NULL `date_format`='YYYY-MM-DD',
    `cik`          bigint       NOT NULL,
--    `founded`   date NOT NULL `date_format`='YYYY'
    `founded`      varchar(40)
) ENGINE = CONNECT `table_type`=CSV `file_name`='/KWdata/data/sp500list.csv'
    `header`=1 `sep_char`=',' quoted=1;