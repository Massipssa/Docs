# CloudFront

- Is used **Content Distributed Network (CDN)**
- Take content and copy it to different edges location around the world
- For example if we have some videos (static content, and we want to share them around the word), share buckets, ...
- Components
  - **Origin**: the location where all of original files are located. It can be **S3, EC3, ELB, Route 53**
  - **Edge location**: the location where content will be cached
  - **Distribution** : collection of Edge Locations which defines how cached content should behave
- **Lambda@Edge** is a feature of Amazon CloudFront that lets you run code closer to users of your application, which improves performance and reduces latency

## Content Delivery Network (CDN)

- Distributed network of servers which delivers web pages and content to users base on their geographical location, the origin of the webpage, and a content delivery server
