
# coding: utf-8

# # Using PostgreSQL in Python (with Psycopg2)
# 
# ## Problem: 
# ### Your data is in a SQL database, but your machine learning tools are in Python.
# 
# ---------
# 
# ## Solution:
# ### Run SQL queries from Python
# 
# * Very useful for scaled data pipelines, pre-cleaning, data exploration
# * Allows for dynamic query generation
# 
# ---------

# ### Psycopg2
# A library that allows Python to connect to an existing PostgreSQL database to utilize SQL functionality.
# 
# 
# ### Documentation
# * http://initd.org/psycopg/docs/install.html

# # Objectives
# 
# - Learn how to connect to and run Postgres queries from Python
# - Understand cursors, executes, and commits
# - Learn how to generate dynamic queries

# In[ ]:

# basic usage
query = "SELECT * FROM some_table;"
cursor.execute(query)
results = cursor.fetchall()


# # Creating a connection with Postgres

# ### Import

# In[1]:

import psycopg2 as pg2


# ### Create connection with Postgres

# In[2]:

conn = pg2.connect(database='postgres', user='brad')


# ### Retrieve the Cursor
# 
# * A cursor is a control structure that enables traversal over the records in a database.  You can think of it as an iterator or pointer for Sql data retrieval.

# In[3]:


cur = conn.cursor()


# ## Create a database

# In[4]:

cur.execute('CREATE DATABASE lecture')


# ## What happened?!
# ### Normally we execute "temporary transactions", but database-wide operations cannot be run temporarily.
# 
# ### Try again:

# In[6]:

conn.close()

conn = pg2.connect(dbname = 'postgres', user='brad')
conn.set_session(autocommit = True)

cur = conn.cursor()
cur.execute('CREATE DATABASE lecture')


# ## Disconnect from the cursor and database (again)

# In[7]:

cur.close() # optional, closing connection always closes any associated cursors
conn.close()


# ## Let's use our new database

# In[53]:

conn = pg2.connect(database='lecture', user='brad')


# In[54]:

cur = conn.cursor()


# ### Create a new table

# In[55]:

query1 = '''
        CREATE TABLE logins (
            userid integer
            , tmstmp timestamp
            , type varchar(10)
        );
        '''



# In[56]:


cur.execute(query1)


# ### Insert csv into new table

# In[57]:

query2 = '''
        COPY logins 
        FROM '/Users/brad/Dropbox/Galvanize/sql-python/data/lecture-example/logins01.csv' 
        DELIMITER ',' 
        CSV;
        '''


# In[58]:


cur.execute(query2)


# ### Lets take a look at the data

# In[59]:

query3 = '''
        SELECT *
        FROM logins
        LIMIT 20;
        '''


# In[60]:

cur.execute(query3)


# ### One line at a time

# In[61]:

cur.fetchone()


# ### Many lines at a time

# In[62]:

cur.fetchmany(5)


# ### Or everything at once

# In[63]:

cur.fetchall()


# In[64]:


cur.execute('SELECT Count(*) FROM logins')


# In[65]:

cur.fetchall()


# # Dynamic Queries
# 
# We have 8 login csv files that we need to insert into the logins table.  Instead of doing a COPY FROM query 8 times, we should utilize Python to make this more efficient.  This is possible due to tokenized strings.

# In[47]:

# os is needed because we want to dynamically identify the files 
# we need to insert.
import os


# In[48]:

query4 = '''
        COPY logins 
        FROM %(file_path)s
        DELIMITER ',' 
        CSV;
        '''

folder_path = '/Users/brad/Dropbox/Galvanize/sql-python/data/lecture-example/'


# In[49]:

fnames = os.listdir(folder_path)

for fname in fnames:
    path = os.path.join(folder_path, fname)
    cur.execute(query4, {'file_path': path})



# # WARNING: BEWARE OF SQL INJECTION
# 
# ## NEVER use + or % to reformat strings to be used with .execute

# In[66]:

num = 579
terribly_unsafe = "SELECT * FROM logins WHERE userid = " + str(num)
print terribly_unsafe


date_cut = "2014-08-01"
horribly_risky = "SELECT * FROM logins WHERE tmstmp > %s" % date_cut
print horribly_risky
## Python is happy, but if num or date_cut included something malicious
## your data could be at risk


# ### Don't forget to commit your changes

# In[ ]:

cur.commit()


# ## And then close your connection

# In[67]:

cur.close()
conn.close()


# # Key Things to Know
# 
# * Connections must be established using an existing database, username, database IP/URL, and maybe passwords
# * If you have no existing databases, you can connect to Postgres using the dbname 'postgres' to initialize one
# * Data changes are not actually stored until you choose to commit. This can be done either through commit() or setting autocommit = True.  Until commited, transactions are only stored temporarily
#     - Autocommit = True is necessary to do database commands like CREATE DATABASE.  This is because Postgres does not have temporary transactions at the database level.
#     - Use .rollback() on the connection if your .execute() command results in an error. (Only works if change has not yet been committed) 
# * SQL connection databases utilize cursors for data traversal and retrieval.  This is kind of like an iterator in Python.
# * Cursor operations typically go like the following:
#     - execute a query
#     - fetch rows from query result if it is a SELECT query
#     - because it is iterative, previously fetched rows can only be fetched again by rerunning the query
#     - close cursor through .close()
# * Cursors and Connections must be closed using .close() or else Postgres will lock certain operations on the database/tables until the connection is severed. 
# 

# ## And don't leave yourself vulnerable to SQL injection!
# http://xkcd.com/327/

# In[ ]:



