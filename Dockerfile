FROM neo4j:4.4.19
ENV NEO4J_AUTH=none
COPY data/links_only_clear.csv /var/lib/neo4j/import/wiki.csv