# Go REST API

REST API implementation using gin.

## Sample request

Get albums

```bash
curl -XGET http://localhost:8080/albums
```

Post album

```bash

curl -XPOST http://localhost:8080/albums \
    --data '{"id": "4","title": "The Modern Sound of Betty Carter","artist": "Betty Carter","price": 49.99}'
```