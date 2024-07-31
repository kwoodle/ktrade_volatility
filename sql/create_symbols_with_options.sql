-- May 30 2024
-- from https://www.cboe.com/us/options/symboldir/

use useq;
drop table if exists US_syms_with_options;
create table if not exists US_syms_with_options
(
    `Company`       varchar(200)    NOT NULL,
    `Symbol`        varchar(10)     NOT NULL,
    `DPM Name`      varchar(200)    NOT NULL,
    `Post-Station`  varchar(10)     NOT NULL
) ENGINE = CONNECT `table_type`=CSV `file_name`='/KWdata/cboesymboldirequityindex.csv'
    `header`=1 `sep_char`=',' quoted=1;