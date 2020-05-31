## Basic commands

### Database

- Create db: ```use <bd_name>```
- Show dbs: ```show dbs```
- Drop db:
    - Switch to the db
    - Execute ```db.dropDatabase()```

### Collection

- Create: ```db.createCollection(name, options)```
- Drop: ```db.COLLECTION_NAME.drop()```
- Ex:

```
 db.createCollection("users", { capped: true, size: 10000, max: 10000 })
 db.users.drop()
```


### Document

#### Insert Data

- **insert** or **save**: ```db.COLLECTION_NAME.insert(document)```

```db.users.insert({title: "test title",  likes: 100,  tags: ['one', 'two', 'three']})```

- **insertOne** and **insertMany**

```db.users.insert({title: "test title",  likes: 100,  tags: ['one', 'two', 'three']})```

```
db.users.insertMany([{title: "test title",  likes: 100,  tags: ['one', 'two', 'three']}, { title: "user 2", tags: ['ok', 'nok']}])
```

- **Find** (like select all in SQL): ```db.users.find()```, to fromat the result ```db.users.find().pretty()```

- **Where clause:** ```db.users.find({"likes": {$lt:100}}).pretty()```
    - **lt**: less than, (lte: less than equal)
    - **gt**: grater than, (gte: grater than equal)
    - **ne**: not equal
    - **in**: in values, (nin: not in)


#### Update Data

- **Update**
    - ```mutli: true```: allows to update all the documents with title equals to ```user 1```
    ```db.users.update({'title': 'user 1'}, {$set: {"title": "user_1"}}, {multi: true})```

- **save**

- **findAndUpdate**

- **updateOne** and **updateMany**