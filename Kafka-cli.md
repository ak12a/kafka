# Commands Line interfaces for Kafka 


## *To start kafka server with zookeeper*

First start zookeepr service. 

```bash
sudo /opt/bin/kafka/zookeeper-server-start.sh -c /opt/kafka/config/zookeeper.properties
```

Now start kafks 

```bash
sudo /opt/bin/kafka/kafka-server-start.sh -c /opt/kafka/config/server.properties
```



========================
Kafka CLI: kafka-topic.sh 
========================

# `Kafka topics managment`

1. Create kafka Topics 
2. List Kafka Topics 
3. Describe Kafka Topics 
4. Increase Partition in Kafka Topics 
5. Delete Kafka Topics 


============================
# 1.  `Create kafka topics`
============================

```bash 
kafka-topics.sh --bootstrap-server localhost:9092 --topic first_topic --create  
```

# To access the kafks UI: 
```bash 
docker run -dit -p 8080:8080 -e DYNAMIC_CONFIG_ENABLED=true provectuslabs/kafka-ui
```
- Once the docker started open the localhost:8080 and provide the ip of the ksfka server with port number. 

==========================
# 2. `List Kafka Topics`
=========================

```bash 
kafka-topics.sh --bootstrap-server localhost:9092 --list
```

==========================
# 3. `Describe Kafka Topics `
=========================

## Describe all topics 
```bash 
kafka-topics.sh --bootstrap-server localhost:9092 --describe
```

## Describe specific  topics 
```bash 
kafka-topics.sh --bootstrap-server localhost:9092 --topic first_topic --describe
``` 

==================================
# 4. `Increase Partition in Kafka Topics` 
===================================
```bash 
kafka-topics.sh --bootstrap-server localhost:9092 --topic second_topic --create --partitions 3  
```

===================================
## 5. ` Delete Kafka Topics `
===================================
```bash 
kafka-topics.sh --bootstrap-server localhost:9092 --topic second_topic --delete   
```





==============================
# `Kafka Console Producer` 

*  Producer use To write  the mesage in topics


### Message Producing 

 ```bash
 kafka-console-producer.sh --bootstrap-server kafka-server-1:9092 --topic first_topic 
 ``` 

### Message producing with properties  ( Acknowlwdgments from leader partitions)
 ```bash
 kafka-console-producer.sh --bootstrap-server kafka-server-1:9092 --topic first_topic  --producer-property acks=1
 ```
### Message producing with properties  ( Acknowlwdgments from leader as well as replicas broker (server) )
 ```bash
 kafka-console-producer.sh --bootstrap-server kafka-server-1:9092 --topic first_topic  --producer-property acks=all
 ```
======================================
## `Producing to a non existing topics`
=====================================

 ```bash
 kafka-console-producer.sh --bootstrap-server kafka-server-1:9092 --topic new_topics  
 ```


 `Note: Producing to a non existing topics might have diffrent behaviour depending on cluster. If is a self managed cluster then you might get some warning message and the topics will get creted after that. `

 `But in the case of managed cluster the topics might not created and it will throw the error message `


* List the topics after apply the command and verify whether it created or not
```bash 
kafka-topics.sh --bootstrap-server kafka-server-1:9092  --list
```


=========================================
## `Producing message with key and value`
=========================================
* In this demo we are going to produce message ( EG: Name:Arvind,  Age:32)

```bash 
 kafka-console-producer.sh --bootstrap-server kafka-server-1:9092 --topic third_topic  --property parse.key=true --property key.separator=: 
 ```
 `Example:`
  
 > Name:Arvind, 

 > Age:32
 
 > Sex:Male


 `Check on the console, You will find Key=name and value=Arvind `