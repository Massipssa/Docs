# Search

- Two main ways to search in ELK:
  - ***Queries:*** the query cluases to matche documents (retrieve docs that match a criteria)
  - ***Aggregations:*** the aggregation clauses to summarize data

## Hints

In case of queries

- Limited to 10 docs
- total is limited to 10000 after >= 7.0 ELK version
- **```track_total_hits: true```**: search in all hints 
- track_total_hints can be used to get total value
- hits are stored by **_score** and each hit has _score

## True positives / negatives

- Positives: relevent docs that are returned to the user.
- Negatives: irrevelant docs that were not retured to the user.

## Flase positives / negatives

- Positives: irrelevant docs that are returned to the user.
- Negatives: relevent docs that were not returned to the user.

## Precesion 

- What portion of retrieved data is actually relevant to the search query ?
- `precesion = True positives / True positives + False positives`

## Recall 

## Ranking
- Gives the more relevant doc to the search query
- Docs are ranked by the score 
- Scoring algorithm is used to rank the docs
  - Term Frequency (TF)
  - Inverse Document Frequency (IDF) 
