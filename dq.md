```json

"checks" : [
  "ftr checks": []
  LoadChecks: [
  {
    id = "encoding_check"
    type = "ENCODING"
    source = "sample_A"
    option = "UTF-8" // String: Encoding name (please, use encoding names defined in Spark)
  },
  {
    id = "min_column"
    type = "MIN_COLUMN_NUM"
    source = "sample_A"
    option = 10 // Integer: Num of columns
  },
  {
    id = "file_type"
    type = "FILE_TYPE"
    source = "sample_A"
    option = "avro" // String: File formate (csv, avro)
  },
  {
    id = "file_existence"
    type = "EXIST"
    source = "sample_A"
    option = true // Boolean: Expected result
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




