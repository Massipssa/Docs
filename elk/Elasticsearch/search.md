# Search

- ***Queries:*** the query cluases to matche documents
- ***Aggregations:*** the aggregation clauses to summarize data

- **```track_total_hits: true```**: count more than 10,000 hints (in ELK > 7.0 hint is limeted to 10,000)

## Hints

In case of queries

- Limited to 10 docs
- total is limited to 10000 after >= 7.0 ELK version
- track_total_hints can be used to get total value
- hits are stored by **_score** and each hit has _score

## True positives / negatives

- Positives: relevent docs that are returned to the user.
- Negatives: irrevelant docs that were not retured to the user.

## Flase positives / negatives

- Positives: irrelevant docs that are returned to the user.
- Negatives: relevent docs that were not returned to the user.

## Precesion 

- `precesion = True positives / True positives + False positives`
