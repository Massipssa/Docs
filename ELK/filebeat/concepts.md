# Filebeat 
 - Log shipper 
 - Is installed on the machine that generate logs 
 - Prospectors : are responsible for locating specific files and applying basic processing 
	on them 
 - Output : where to ship data to 
	- output.elasticsearch
	- output.logstash

* log_location => hovster (read a single log and send) => libbeat(aggregate the events and send) => output

* test
    
    ```
        ./filebeat test config -e -c path/to/filebeat.yml
    ```
    