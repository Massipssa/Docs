# Prometheus

- **PromQL** language used to run queries
- **promtool** can be used to check file's syntax

## Time series

- It is identified by:
  - Metric name
  - Label (key/value format) they are ***Optional***

## Metrics

It has four metric types

- **Counter:** the value that can be incremented or rest to zero (call to an API endpoint)
- **Gauge:** numerical value that can be incremented and decremented
- **Histogram:** count the number of observations/events that fall into a set of configurable buckets, each with its
  own separate time series.
- **Summary:** is similar to a histogram, but it exposes metrics in the form of quantiles instead of bucket. While 
   buckets divide values based on specific boundaries, quantiles divide values based on the percentiles into which they
   fall.

## Exporters

- Any application that exposes metrics in the format that Prometheus can read

## Rules

Supports two types of rules

- Recording
  - Precompute frequently or computationally expressive expressions and save their result as new set of time series
  - They are fast and useful for dashboards where the same metric is queried multiple time  
- Alerting
  - Used to fire on alert when the conditions defined by the rule are met

## Alertmanager

- Notification triggered by metrics data
- **amtool** used to interact with **Alertmanager**
- `--config.file` specify Alertmanager configuration
- High availability is possible

### Grouping

- Combine multiple alters into a single notification
- Useful when multiple system may fire an alert of the same nature simultaneously

### Inhibition

- Allows **_to suppress_** an alert if another alert is already firing.

### Silences

- Temporary way to turn off **_(mute)_** notifications (mute an alter for certain period of time).

## Commands

- Reload config: `sudo killall -HUP prometheus`
- Get config: `curl localhost:9090/api/v1/status/config`

## Query

- Matching rules: allows combining multiple metrics
  - `ignoring(list<labels>)` ignore the labels that don't match
  - `on(list<labels>)` combine based **on** labels
- Aggregation operator: sum, avg, min, max, ...
- HTTP API: `localhost:9090/api/v1/query?query=up`

## Add Kubernetes metrics

```bash
    git clone https://github.com/kubernetes/kube-state-metrics.git
    cd kube-state-metrics/
    git checkout v1.8.0
    kubectl apply -f kubernetes
    
    touch $(pwd)/kube-state-metrics-nodeport-svc.yml
    echo << EOF >> $(pwd)/kube-state-metrics-nodeport-svc.yml
     kind: Service
     apiVersion: v1
     metadata:
       namespace: kube-system
       name: kube-state-nodeport
     spec:
       selector:
         k8s-app: kube-state-metrics
       ports:
       - protocol: TCP
         port: 8080
         nodePort: 30000
       type: NodePort
     EOF    
```
