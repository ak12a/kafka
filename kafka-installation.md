
# Kafka  Installation


Linux machine: 
--

**STEP 1:**  `Download Kafka`
--

``` bash 
wget https://www.apache.org/dyn/closer.cgi?path=/kafka/3.2.2/kafka_2.13-3.2.2.tgz

sudo tar -xvf kafka_2.12-3.3.2.tgz -C /opt/

```
**STEP 2:**  `Start the  Kafka  Environment`
--
----------------------------------
```NOTE: Your local environment must have Java 8+ installed.```


* Apache Kafka can be started using ```ZooKeeper``` or ```KRaft```. To get started with either configuration follow one the sections below but not both*

- **Verify the java is installed or not**
    ```bash 
     java --version
    ``` 
    **Output:**
    ```bash
    openjdk version "19.0.2" 2023-01-17
     ``` 


    ```Start Kafka with ZooKeeper```
    --


    Run the following commands in order to start all services in the correct order:

    ```Start the ZooKeeper service```
    
    ```bash
     cd /opt/

     sudo ln -s kafka_2.12-3.3.2 kafka
     
     bin/zookeeper-server-start.sh config/zookeeper.properties & 
    ```
