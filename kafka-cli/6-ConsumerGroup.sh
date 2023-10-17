#######################
### Consumer Group ####
#######################

# Documentation for Consumer Group

kafka-consumer-group.sh 



# List the consumer Group
kafka-consumer-group.sh  --bootstar-server localhost:9092 --list 

# Describe the specific consumer group 
kafka-consumer-group.sh  --bootstar-server localhost:9092 --describe --group myapp-1

# Describe the specific consumer group another 
kafka-consumer-group.sh  --bootstar-server localhost:9092 --describe --group myapp-2

# Start a consumer Group 

kafka-consumer.sh  --bootstar-server localhost:9092 --topic first_topic --group myapp-1-group 

