# Docker Image for Titan Graph Database

Titan is an free, open source database that is capable of processing
extremely large graphs and it supports a variety of indexing and storage backends,
which makes it easier to extend than some popular NoSQL Graph databases.

This docker image instantiaties a Titan graph database that is capable of
integrating with an ElasticSearch container (Indexing) and a Cassandra container (Storage).

The default distribution of Titan runs on a single node, so I thought it would be helpful
if there was a modular way at runtime to hook up Titan to its dependencies.

Enter Docker. Now it is possible to run Titan and it's dependencies in separate Docker containers.
