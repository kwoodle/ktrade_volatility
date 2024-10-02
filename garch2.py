#!/usr/bin/env python
# coding: utf-8
from IPython import get_ipython

# ## More from arch

# _This setup code is required to run in an IPython notebook_

# In[1]:


get_ipython().run_line_magic('matplotlib', 'auto')
import matplotlib.pyplot as plt
import seaborn

seaborn.set_style("darkgrid")
plt.rc("figure", figsize=(16, 6))
plt.rc("savefig", dpi=90)
plt.rc("font", family="sans-serif")
plt.rc("font", size=14)


# In[2]:


from sqlalchemy import create_engine

engine = create_engine('mysql+pymysql://localhost', connect_args={'read_default_file': '~/.mytest.cnf'})


# In[3]:


import pandas as pd

with engine.connect() as conn:
    SQL_query = pd.read_sql_query(
        '''select tradedate, pct_close from USEQ_HIST where symbol='MS'
        and volume>0
         order by tradedate''',
        conn,
        index_col='tradedate'
    )
    df = pd.DataFrame(SQL_query, columns=['pct_close'])

df.head()


# In[4]:


ax = df.plot()
xlim = ax.set_xlim(df.index.min(), df.index.max())


# In[5]:


from arch import arch_model


# ## GJR-Garch with Student's T

# In[6]:


am = arch_model(df, p=1, o=1, q=1, dist="StudentsT")
res = am.fit(update_freq=5)
print(res.summary())


# `plot()` can be used to quickly visualize the standardized residuals and conditional volatility.
# 

# In[7]:


fig = res.plot(annualize="D")


# ## Parameters
# 

# In[8]:


res.params


# ## Forecasts

# In[9]:


forecasts = res.forecast(reindex=False)
print(forecasts.mean.iloc[-3:])

forecasts = res.forecast(horizon=10, reindex=False)
print(forecasts.residual_variance.iloc[-3:])

