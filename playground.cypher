PROFILE
MATCH (n:Page {name: 'Украина'})-[r]-(c:Page)
RETURN n,r,c

match (n:Page {name: "Украина"}) return n

match (n) return n

LOAD CSV WITH HEADERS FROM "file:///wiki.csv" AS csvLine
MERGE (
    ps:Page {name: csvLine.source_name, url: csvLine.source_url})
MERGE (pd:Page {name: csvLine.dest_name, url: csvLine.dest_url})
MERGE (ps)-[r:LINKS]->(pd)


LOAD CSV WITH HEADERS FROM "file:///wiki.csv" AS csvLine
MERGE (ps:Page {name: csvLine.source_name})
SET ps.url=csvLine.sourceUrl
MERGE (pd:Page {name: csvLine.dest_name})
SET pd.url = csvLine.dest_url
MERGE (ps)-[r:LINKS]->(pd)

LOAD CSV WITH HEADERS FROM "file:///wiki_pages.csv" AS csvLine
MERGE (ps:Page {name: csvLine.title})
SET ps.text = csvLine.text 
