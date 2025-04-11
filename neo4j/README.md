# README

Create a sample security graph in Neo4j using the following steps:

1. Install Neo4j locally. We recommend using Docker following [Neo4j's guidance](https://neo4j.com/docs/operations-manual/current/docker/introduction/),
   or you can review additional [Neo4j installation guides](https://neo4j.com/docs/operations-manual/current/installation/) for Linux, macOS, and Windows.
2. Open your browser and navigate to [http://localhost:7474/](http://localhost:7474/).
3. Authenticate to Neo4j.
4. If you're using a licensed Enterprise Edition of Neo4j, add primary key constraints. Otherwise, continue.
    1. Copy and paste the content of `1-constraints.cypher` into the query editor at the top of the UI. Press "Enter" or click the "Play" icon to run.
5. Copy and paste the content of `2-nodes.cypher` into the query editor at the top of the UI. Press "Enter" or click the "Play" icon to run.
6. Copy and paste the content of `3-edges.cypher` into the query editor at the top of the UI. Press "Enter" or click the "Play" icon to run.

Explore the resulting graph manually or with the sample queries in `4-queries.md`. Neo4j's ["What is Cypher?"](https://neo4j.com/docs/getting-started/cypher/) may be a helpful reference.
