```json
{
"data_source": {
  "id": "FIDESSA",
  "type": "HDFS",
  "path": "/path/to/datasource",
  "fileType": "csv",
  "schema": "/path/to/schema",
  "date": "2023-01-19" 
},
"checks" : [
  "ftr_checks": [
   {
      "id": "ftr_check",
      "type": "FTR",
      "ftrFileIds": "path/to/ftr/file/ids",
      "option": "received",
      "severity": "hard",
      "description": "check that ftr files are received"
    }
  ],
  "load_checks": [
  // pre-checks 
  {
    "id": "encoding_check",
    "type": "ENCODING",
    "option": "UTF-8",
    "severity": "hard",
    "description": "check that all data are encoded in utf-8 (option)"
  },
  {
    "id": "file_type",
    "type": "FILE_TYPE",
    "option": "parquet", 
    "severity": "hard",
    "description": "check that file provided by the source are in parquet format (option), (source folder may contain file but not in desired format)"
  },
  {
    "id": "file_existence",
    "type": "EXIST",
    "option": true,
    "severity": "hard",
    "description": "check that file exists"
  },
   {
    "id": "schema_check",
    "type": "VALID_SCHEMA",
    "option": true,
    "severity": "hard",
    "description": "Check if datasource schema is valid (compare to input schema)" 
  }
  // post check
  {
    "id": "exact_column",
    "type": "EXACT_COLUMN_NUM",
    "name": "column_name",
    "option": 10,
    "severity": "hard",
    "description": "Checks if #columns of the source is the same as desired number" 
  }
], 
"checks_result": [
  "name": "checkResultName",
  "path": "path/to/target",
  "results": [
  "ftr": {
    "check_id": "ftr_check",
    "status": "failed",
    "message": "failed because ...."
  },
  "load_checks": {
    "check_id": "file_existence",
    "status": "success",
    "message": "failed because ...."
  }
  ]
]
}

```
