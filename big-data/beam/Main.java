public static void main() {

  final String inputPath = "path/to/file/words.txt";  
  // create pipeline
  final PipelineOptions pipelineOptions = PipelineOptionsFactory.create();
  final Pipeline pipeline = Pipeline.create(options);
  
  // define 
  PCollection<KV<String, Long>> wordCount = pipeline
    .apply("(1) Read all lines", TextIO.read().from(inputFilePath))
    .apply("(2) Flatmap to a list of words",
           FlatMapElements.into(TypeDescriptors.strings())
           .via(line -> Arrays.asList(line.split("\\s")))
    )
    .apply("(3) Lowercase all", 
           MapElements.into(TypeDescriptors.strings())
           .via(word -> word.toLowerCase())
    )
    .apply("(4) Trim punctuations", 
          MapElements.into(TypeDescriptors.strings())
          .via(word -> trim(word))
    )
    .apply("(5) Filter stopwords", Filter.by(word -> !isStopWord(word)))
    .apply("(6) Count words", Count.perElement());
  
   // convert to string 
   wordCount.apply(MapElements.into(TypeDescriptors.strings())
    .via(count -> count.getKey() + " --> " + count.getValue()))
    .apply(TextIO.write().to(outputFilePath));
  
  // run the pipeline
  pipeline.run().waitUntilFinish();
}
