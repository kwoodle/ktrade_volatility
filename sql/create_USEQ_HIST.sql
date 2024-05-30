-- Mqy 30 2024
-- Mariadb default table may have changed, now require individual years
-- created explicitly MyIsam. Primary Key seems to work, as long as
-- INSERT_METHOD = LAST comes after UNION(..)
use useq;
-- drop table if exists USEQ_HIST;
CREATE TABLE if not exists USEQ_HIST
(
    `symbol`    varchar(10)  NOT NULL,
    `tradedate` date         NOT NULL,
    `open`      float(12, 2) NOT NULL,
    `high`      float(12, 2) NOT NULL,
    `low`       float(12, 2) NOT NULL,
    `close`     float(12, 2) NOT NULL,
    `volume`    bigint(20)   NOT NULL DEFAULT 0,
    `pct_open`  float        NOT NULL DEFAULT 0,
    `pct_high`  float        NOT NULL DEFAULT 0,
    `pct_low`   float        NOT NULL DEFAULT 0,
    `pct_close` float        NOT NULL DEFAULT 0,
    `pct_hilo`  float        NOT NULL DEFAULT 0,
    `pct_opclo` float        NOT NULL DEFAULT 0,
    PRIMARY KEY (`symbol`,`tradedate`)
) ENGINE = MERGE UNION = (USEQ_2001,USEQ_2002,USEQ_2003,USEQ_2004,
    USEQ_2005,USEQ_2006,USEQ_2007,USEQ_2008,USEQ_2009,USEQ_2010,USEQ_2011,
    USEQ_2012,USEQ_2013,USEQ_2014,USEQ_2015,USEQ_2016,USEQ_2017,USEQ_2018,
    USEQ_2019,USEQ_2020,USEQ_2021,USEQ_2022,USEQ_2023,USEQ_2024) INSERT_METHOD = LAST
