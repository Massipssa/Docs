```json
{
"dataSource": {
  "id": "FIDESSA",
  "type": "HDFS",
  "path": "/path/to/datasource",
  "fileType": "csv",
  // or use path to schema
  "schema": "[{name: "a", type: "string"}, {name: "b", type: "string"},{name: "c", type: "string"}]",
  "date": "2017-05-19" 
},
"checks" : [
  "FtrChecks": [
   {
      "id": "_check",
      "type": "FTR",
      "source": "sample_A",
      "ftrFileIds": "path/to/file/ids",
      "option": "received",
      "description": "check that ftr files are received"
    }
  ],
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
    "type": "EXACT_COLUMN_NUM",
    "source": "sample_A",
    "option": 10,
    "description": "Checks if #columns of the source is the same as desired number" 
  }
], 
"targets": [
  "ftrTagret": {
    "status": "failed"
    "message": "failed because ...."
  },
  "ftrTagret": {
    "status": "success"
    "message": "failed because ...."
  }
]
}

```




