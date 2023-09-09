# Azure Stream Analytics
- It's PaaS
- To process streaming data and respond to data anomalies in real time
- For Internet of Things (IoT) monitoring, web logs, remote patient monitoring, and point of sale (POS) systems
- Stream Analytics handles security at the transport layer between the device and Azure IoT Hub
- Stream Analytics guarantees exactly once event processing and at-least-once event delivery, so events are never lost
- In-memory compute, so it offers high performance

### Windows 
Five kinds of temporal windowing functions are supported:
- **Tumbling:** window functions segment a data stream into a contiguous series of fixed-size,
non-overlapping time segments and operate against them. Events can't belong to more than one tumbling window
- Hopping
- Sliding
- Session
- Snapshot

### Supported inputs 
- Azure Event Hubs
- Azure IoT Hubs
- Azure Blob or Data Lake Gen 2 Storage