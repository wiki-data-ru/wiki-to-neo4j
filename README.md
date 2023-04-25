# Данные википедии в Neo4J

## Сборка контейнера с базой данных
```sh
make build
```

## Запуск контейнера с базой данных

```sh 
make start
```

```c
LOAD CSV WITH HEADERS FROM "file:///wiki.csv" AS csvLine
CREATE (p:Person {id: toInteger(csvLine.id), sourceName: csvLine.source_name, sourceUrl: csvLine.source_url, destName: csvLine.dest_name, destUrl: csvLine.dest_url})
```
