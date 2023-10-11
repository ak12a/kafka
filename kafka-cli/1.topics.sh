========================
Kafka CLI: kafka-topic.sh 
========================

# `Kafka topics managment`

1. Create kafka Topics 
2. List Kafka Topics 
3. Describe Kafka Topics 
4. Increase Partition in Kafka Topics 
5. Delete Kafka Topics 



# 1.  `Create kafka topics`
kafka-topics.sh --bootstrap-server localhost:9092 --topic first_topic --create  


# 2. `List Kafka Topics`
kafka-topics.sh --bootstrap-server localhost:9092 --list

# 3. `Describe Kafka Topics `
kafka-topics.sh --bootstrap-server localhost:9092 --describe

# 4 Describe specific  topics 
kafka-topics.sh --bootstrap-server localhost:9092 --topic first_topic 

# 5. `Increase Partition in Kafka Topics` 
kafka-topics.sh --bootstrap-server localhost:9092 --topic second_topic --create --partitions 3  


# 6.`Delete Kafka Topics`
kafka-topics.sh --bootstrap-server localhost:9092 --topic second_topic --delete   

