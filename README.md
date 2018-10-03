# cassandra-reaper


Create keyspace first, if you use Cassandra as for persistence.
```
CREATE KEYSPACE reaper_db WITH replication = {'class': 'NetworkTopologyStrategy', 'DC1': 3, 'DC2': 2};
```
