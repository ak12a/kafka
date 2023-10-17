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

 ===========================
 ## `Consumer`
 ===========================

 * 1. `Comsume the tail of the topics`
 * 2. `Consume the begining of the topics`
 * 3. `Show both key and value in the outpu` 

`Examples:` 

## `Create a topic with 3 partitions`
```bash
kafka-topics.sh --bootstrap-server localhost:9092 --topic topic_three --partitions 3 --create 
``` 

## `Produce the message in topics`  ( Open a new termilan and execute the below command)
* Method 1  In a single partition.

`Note:  In single partition up to 16 KB of data and then send to the other partitions`

```bash
kafka-console-producer.sh --bootstrap-server localhost:9092 --topic topic_three 
``` 

* `Method 2  In a RoundRobin partition mechenisam`

`Note: In ROundRobin partitions mechenism it will produce the message once at a time in a single partition up to 16 KB of data and then send to the other partitions. `  

```bash
kafka-console-producer.sh --bootstrap-server localhost:9092  --producer-property partitioner.calss=org.apache.kafka-client-producer.RoundRobinPartitioner --topic topic_three 
```



## `Consume the Topics `  (Open a new terminal and execute the command)
```bash
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic_three 
``` 

## `Consume the Topics from nbegning `  (Open a new terminal and execute the command)
```bash
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic_three --from-beginning
``` 

## ` Consume the topics and print the timestamp,key,value,and partitins number of a topics  in consumer`

```bash
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic_three  --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true --property print.partition=true --from-beginning
``` 


## Lets consume partition one ( without roundrobin producer property)
1. `Create a topic with 3 partitions` 

```bash
kafka-topics.sh --bootstrap-server localhost:9092 --topic topic_one  --partitions 3 --create 
``` 

2. `Produce message in topics` ( In a new shell)

```bash
kafka-console-producer.sh --bootstrap-server localhost:9092 --topic topic_one 
``` 

3. ` Consume the topics and print the timestamp,key,value,and partitins number of a topics  in consumer`

```bash
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic_one  --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true --property print.partition=true --from-beginning
```


## `ConsuemeTopic using Consumer Group`
