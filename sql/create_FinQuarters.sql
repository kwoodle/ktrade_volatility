use test;
create table if not exists FinQuarters
(
    Symbol   varchar(10)  NOT NULL,
    Name     varchar(150) NOT NULL,
    Exchange varchar(10) DEFAULT NULL,
    fye      char(5)      NOT NULL,
    cik      int          NOT NULL,
    primary key (cik, Symbol)
--    key (Symbol, `period`)
) replace as
select Fi.cik,
       ci.ticker                                      as Symbol,
       ci.Name,
       ci.Exchange,
       concat(left(Fi.fye, 2), '-', right(Fi.fye, 2)) as fye
from cik_to_ticker as ci
         join FinSubsZ as Fi on Fi.cik = ci.CIK
where Fi.fp is not null
