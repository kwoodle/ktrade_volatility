use tsx;
drop table if exists TSX_Symbols;
create table if not exists TSX_Symbols
(
    symbol varchar(40) NOT NULL ,
    description varchar(400) NOT NULL
) ENGINE = CONNECT
  DEFAULT CHARSET = latin1 `table_type`=CSV `file_name`='/var/mariadb/data/TSX/TSX_Symbols_Dec2021.txt' `header`=1 `sep_char`='\t'
