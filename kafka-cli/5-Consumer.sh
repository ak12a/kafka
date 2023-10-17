## Consume the Topics   (Open a new terminal and execute the command)

kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic_three 
 

## Consume the Topics from begning   (Open a new terminal and execute the command)

kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic_three --from-beginning
 

##  Consume the topics and print the timestamp,key,value,and partitins number of a topics  in consumer


kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic_three  --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true --property print.partition=true --from-beginning
 


## Lets consume partition one ( without roundrobin producer property)
#1. Create a topic with 3 partitions 


kafka-topics.sh --bootstrap-server localhost:9092 --topic topic_one  --partitions 3 --create 
 

#2. Produce message in topics ( In a new shell)


kafka-console-producer.sh --bootstrap-server localhost:9092 --topic topic_one 
 

#3.  Consume the topics and print the timestamp,key,value,and partitins number of a topics  in consumer


kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic topic_one  --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true --property print.partition=true --from-beginning
