# Shuflle

* Redistributes data among partitions
* Hash keys into buckets

* Data no longer stay in memory

* Involves:
    * Data partition : which may involves very expensive data sorting works
    * Data ser/deser: to enable data been transfer through network or accross process
    * Data compression: to reduce IO bandwidth
    * DISK IO; probably multiple times on single data blocl
        * e.g Shuffle Spill, Mergde combine

* Tricks
    * Avoid when it's possible
    * Use partial aggregation to reduces data movement ?