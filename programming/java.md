## Garbage Collector
- Free the heap by destroying the objects that don't contain a reference
- Steps
    - Mark objects
    - Sweep dead objects 
    - Compact memory
    

### Young generation

- ``-Xmn:`` Young generation size
- ``-Xms:`` initial size of the heap 
- ``-Xmx:`` maximum size of the heap

### Permanent generation
- ``XX:PermGen`` and ``-XX:MaxPermGen`` initial and maximum size of permanent generation


### GC types
- Serial GC
    - Useful for small app running in single thread
    - The garbage collection occurs in one thread, and the compaction is performed after the 
    collection if finished
      

## Static class
      