# Simple Queue Service (SQS)

- Oldest offering (over 10 years old)
- Fully managed (Serverless)
- Scales from 1 message per second to 10,000s per second
- No limit to how many messages can be in the queue
- Low latency (< 10 ms on publish and receive)
- Horizontal scaling in terms of number of consumers
- Can have duplicate messages (at least once delivery, occasionally)
- Can have out of order messages ( the best effort ordering)
- Delivery delay: 0 to 15 minutes
- Limitation of **_256KB_** per message sent
- Message are encrypted by default in transit, **_but not_** at rest
- Default retention of messages: _**1 minutes, to 14 days**_ default 4 days

## Dead Letter Queues 

## Standard and FIFO 

- FIFO doesn't have same performance then Standard


