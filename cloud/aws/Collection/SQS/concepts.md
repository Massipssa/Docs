# Simple Queue Service (SQS)

* Oldest offering (over 10 years old)
* Fully managed (Serverless)
* Scales from 1 message per second to 10,000s per second
* Default retention of messages: **4 days, maximum of 14 days**
* No limit to how many messages can be in the queue
* Low latency (< 10 ms on publish and receive)
* Horizontal scaling in terms of number of consumers
* Can have duplicate messages (at least once delivery, occasionally)
* Can have out of order messages (best effort ordering)
* Limitation of 256KB per message sent