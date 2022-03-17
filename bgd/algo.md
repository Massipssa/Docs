-- Input data frame
(node_id, child_id) 

-- markt leaf nodes 
data = spark.createDataFrame(
    sc.parallelize(
        [
		[1, -1],[2,  1],
		[6, -1],[7,  6],[8,  7], [9,  8],
		[21,-1],[22,21],
		[24,-1],[25,24],[26,25],[27,26],[28,27],[29,28],[99, 6],[107,99],
 		[108,-1],[109,108], [222,109], [1000,7], [1001,1000],
		[ -1,9],
 		[ -1,22],
 		[ -1,29],
 		[ -1,107],
 		[ -1, 1001],
 		[ -1,222],
 		[ -1,2]
	]
      ), 
      ["doc_process_pid", "doc_parent_pid"]
)

[24, 25, 26, 27, 28, 29]
[6, 7, 8, 9]
[6, 7, 1000, 1001]
[108, 109, 222]
[6, 99, 107]
[21, 22]
[1, 2]   

-- select left node (nodes withoud child)
df1 = data.filter("doc_parent_pid = -1").select(data.doc_process_pid.alias("node"))

-- select node that has son rather than 
df2 = data.select(data.doc_process_pid.alias("son"), data.doc_parent_pid.alias("node")).filter("node != -1")

-- selet the parent of node i (not leaf)
def add_node(df, i):
    return df.filter("node != -1")
	     .join(df2, "node", "inner")
	     .withColumnRenamed("node", "node" + str(i))
	     .withColumnRenamed("son", "node")

--- Intial state 
from pyspark.sql.types import *
df = df1
i = 0
df_end = spark.createDataFrame(
    sc.emptyRDD(), 
    StructType([StructField("branch", ArrayType(LongType()), True)])
)

import pyspark.sql.functions as psf
while df.count() > 0:
    i = i + 1
    df = add_node(df, i)
    
   -- drop iterratively node
    df_end = df.filter("node = -1") \
	.drop('node')\
	.select(psf.array(*[c for c in reversed(df.columns) if c != "node"])\
	.alias("branch")).unionAll(df_end)
    df = df.filter("node != -1")




