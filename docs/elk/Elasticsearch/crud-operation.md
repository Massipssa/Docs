- Create index: `PUT name-of-index`

## Create
- Add doc to an index: POST or PUT can be used.
  - POST is used when we want ES to auto-generate id for the doc
  
  - `POST name-of-index/_doc {
    "field": "value"
   }
  `
## Read

- GET is used to get a doc:  `GET name-of-index/_doc/id-of-doc`

## Update
- _update endpoint is used:  
 
```
POST name-of-index/_doc/id-of-doc
{
  "doc": {
    "field": "new_value"
  }
}
```

## Delete

- DELETE is used
- `DELETE name-of-index/_doc/id-of-doc`
