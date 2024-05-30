use test;
CREATE TABLE tm1 (
    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    message CHAR(20)) ENGINE=MyISAM;

CREATE TABLE tm2 (
    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    message CHAR(20)) ENGINE=MyISAM;


INSERT INTO tm1 (message) VALUES ('Testing'),('table'),('tm1');

INSERT INTO tm2 (message) VALUES ('Testing'),('table'),('tm2');

CREATE TABLE total (
    a INT NOT NULL AUTO_INCREMENT,
    message CHAR(20), INDEX(a))
    ENGINE=MERGE UNION=(tm1,tm2) INSERT_METHOD=LAST;
