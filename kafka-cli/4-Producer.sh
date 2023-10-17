## `Create a topic with 3 partitions`

kafka-topics.sh --bootstrap-server localhost:9092 --topic topic_three --partitions 3 --create 


## `Produce the message in topics`  ( Open a new termilan and execute the below command)

kafka-console-producer.sh --bootstrap-server localhost:9092 --topic topic_three 




## `Produce the message in topics`  ( Open a new termilan and execute the below command)
* Method 1  In a single partition.

## `Note:  In single partition up to 16 KB of data and then send to the other partitions`

kafka-console-producer.sh --bootstrap-server localhost:9092 --topic topic_three 
 

# `Method 2  In a RoundRobin partition mechenisam`

## `Note: In ROundRobin partitions mechenism it will produce the message once at a time in a single partition up to 16 KB of data and then send to the other partitions. `  


kafka-console-producer.sh --bootstrap-server localhost:9092  --producer-property partitioner.calss=org.apache.kafka-client-producer.RoundRobinPartitioner --topic topic_three 
