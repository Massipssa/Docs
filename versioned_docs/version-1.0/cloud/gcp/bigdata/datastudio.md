# Data Studio

- The service is not present in GCP
- Is part from **G Suite**
- No IAM are applicable. Permissions in GCP will determine access to resources
- **Caching**
    - Query caching
        - Remembers queries issues by reports components
        - When performing same query, pulls from cache
        - If query cache cannot help, goes to prefetch cache
        - Cannot be turnned of
    - Prefetch cache
        - Smart cache, predicts what might be requested
        - If prefetch cache cannot serve data, pulls from live data set
        - Only active for data sources that use owner's credentials for data access
        - Can be turned of
- Turn the caching off
    - Nedd to view ***fresh data*** from rapidly caching dataset