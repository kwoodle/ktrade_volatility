# select * from test.cik_to_ticker where ticker='dfs';
# +--------+---------+-----------------------------+----------+------+
# | ticker | CIK     | Name                        | Exchange | SIC  |
# +--------+---------+-----------------------------+----------+------+
# | DFS    |  902270 | Lenox Group Inc             | NYSE     | 3260 |
# | DFS    | 1393612 | Discover Financial Services | NYSE     | 6141 |
# +--------+---------+-----------------------------+----------+------+
# 2 rows in set (0.008 sec)
-- DFS as Discover started trading in July 2007
-- Replace Earlier with DFS.OLD
update useq.USE_2005 set symbol = 'DFS.OLD' where symbol='DFS';
