```json

"checks" : [
  "ftr checks": [],
  "LoadChecks": [
  // pre-checks 
  {
    "id": "encoding_check",
    "type": "ENCODING",
    "source": "sample_A",
    "option": "UTF-8",
    "description": "check that all data are encoded in utf-8 (option)"
  },
  {
    "id": "file_type",
    "type": "FILE_TYPE",
    "source": "sample_A",
    "option": "parquet", 
    "description": "check that file provided by the source are in parquet format (option), (source folder may contain file but not in desired format)"
  },
  {
    "id": "file_existence",
    "type": "EXIST",
    "source": "sample_A",
    "option": true,
    "description": "check that file exists"

  },
  // post check
  {
    "id": "min_column",
    "type": "MIN_COLUMN_NUM",
    "source": "sample_A",
    "option": 10,
    "description": "Integer: Num of columns" 
  }
]
}
```
- datasource

{
    id = "CONT"
    type = "HDFS"
    path = "/path/resources/sample-data/contract.csv",
    fileType = "csv",
    delimiter = "|", // optional
    quote = "'", // optional
    escape = "\\", // optional
    header = false,
    // Optional fields
    schema = [{name: "a", type: "string"}, {name: "b", type: "string"},{name: "c", type: "string"}]
    date = "2017-05-19" 
}




