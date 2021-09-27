# From garch2.ipynb
import pandas as pd

from sqlalchemy import create_engine
engine = create_engine('mysql+pymysql://localhost', connect_args={'read_default_file': '~/.mytest.cnf'})

with engine.connect() as conn:
    SQL_query = pd.read_sql_query(
        '''select tradedate, pct_close from USEQ_HIST where symbol='MS'
        and volume>0
         order by tradedate''',
        conn,
        index_col='tradedate'
    )
    df = pd.DataFrame(SQL_query, columns=['pct_close'])

from arch import arch_model
## GJR-Garch with Student's T
am = arch_model(df, p=1, o=1, q=1, dist="StudentsT")
res = am.fit(update_freq=5)
print(res.summary())
print(res.params)
