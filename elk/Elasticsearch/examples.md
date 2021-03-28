GET /_cluster/health

## Mapping

```json
PUT /users
{
  "settings": {
    "number_of_replicas": 1,
    "number_of_shards": 1,
    // Time to wait before the doc become searcheable
    "refresh_interval": "1s"
  },
  "mappings": {
    "properties": {
      "firstname": {"type": "text"},
      "lastname": {
        "type": "text",
        // Disable completely the field
        "enable": false,
         // Disable index
         "index": false,
         // Disable doc_values
         "doc_values": false
      },
      "nick_name": {
        "type": "text",
        // Null value: default value if the field is null
        "null_value": "no nick_name"
      },
      "age": {
        "type": "byte",
        // If data type is other than byte, indexing of document will fail
        "coerce": false
      },
      "email": {"type": "text"},
      // Copy_to
      "contry_name": {
        "type": "keyword",
        "copy_to": "combined_location"
      },
      "city_name": {
        "type": "keyword",
        "copy_to": "combined_location"
      },
      // It's not part of _source but it's indexed
      "combined_location": {
        "type": "text"
      },
      "address": {
        "type": "nested",
        "properties": {
          "street_name": {"type": "text"},
          "postal_code": {"type": "short"},
          "city": {"type": "keyword"},
          "county":
          {
            "type": "text",
            "fields": {
              "keyword" : {
                "type": "keyword",
                "ignore_above" : 256
              }
            }
          }
        }
      }
    }
  }
}
```

GET users/_mapping
GET users/_settings
DELETE users

### Create only if not exist

```Json
PUT /users/_create/eC-O73EB-Vx1LmGgtoA0
{
  "age": 18,
  "firstname": "test",
  "lastname": "test",
  "email": "mail@test.com"
}
```

### Update only if exists

```json
POST /users/_update/eC-O73EB-Vx1LmGgtoA0
{
  "doc": {
    "toto": "test.mail@test.com"
  }
}
```

### Bulk

```json
POST users/_bulk
{"index": {"_id": 1}}
{"firstname": "test2"}
```

GET /users/_doc/eC-O73EB-Vx1LmGgtoA0

HEAD /users/_doc/eC-O73EB-Vx1LmGgtoA0


## Search

- Get all

```GET /users/_search```

```json
GET users/_search
{
  "query": {
    "match": {
      // And operator rather than Or (default)
      "firstname": {
        "query": "toto tata",
        "operator": "and",
        // the numer of term to be present in field  
        "minimum_should_match": 2,
        "fuzziness": 1
      }
    },
    // all terms must be in field
    // the order of terms must be the same
    "match_phrase": {
      "firstname": "toto tata"
    }
    // Mutiple fields
    "multi_match": {
      "query": "toto tata",
      "fields": [
        "email",
        "firstname",
        "lastname"
      ],
      "type": "best_fields"
    }
  }
}
```

### Combine multiple queries

```json
GET users/_search
{
  "track_total_hits": true,
  "query": {
    "bool": {
      //
      "must": [
        {
          "match": {
            "age": "18"
          }
        }
      ],
      //
      "must_not": [
        {}
      ],
      //
      "should": [
        {}
      ],
      //
      "filter": [
        {}
      ]
    }
  }
}
```

## Aggregation

### Metrics

- To get only aggregation result

```json
GET users/_search
{
  "size": 0,
  "aggs": {
    "my_agg": {
      "sum": {
        "field": "age"
      }
    },
    "avg_agg": {
      "avg": {
        "field": "age"
      }
    },
    "max_agg": {
      "max": {
        "field": "age"
      }
    },
    "carnidality_agg": {
      "cardinality": {
        "field": "age"
      }
    }
  }
}
```

### Buckets

- In all buckets we can order user (order)

```json
GET users/_search
{
  "size": 0,
  "aggs": {
    "my_bucket": {
      "date_histogram": {
        "field": "@timestamp",
        "interval": "day"
      }
    },
    "histogramm_bucket": {
      "histogram": {
        "field": "age",
        "interval": 50
      }
    },
    "range_bucket": {
      "range": {
        "field": "",
        "ranges": [
          {
            "from": 0,
            "to": 50
          },
          {
            "from": 50,
            "to": 100
          }
        ]
      }
    },
    "terms_bucket":{
      "terms": {
        "field": "firstname",
        "size": 10,
        "order": {
          "_term": "asc"
        }
      }
    }
  }
}
```

## Cluster

```
  GET _cluster/state
  GET _cluster/health?level=cluster
  GET _cluster/health?level=shards
  GET _cluster/health?level=indices
```

### Health of specific index

```GET _cluster/health/users```

### Explain assign

```GET _cluster/allocation/explain```

### Explain assign for specific index

```json
GET _cluster/allocation/explain
{
  "index": "users",
  "shard": 0,
  "primary": true
}
```

## Monitoring

### cat API

```
  GET _cat/nodes?help
  GET _cat/nodes?v&h=name,ip,cpu
```

## Tasks

GET _cluster/pending_tasks

// current executing tasks
GET _tasks