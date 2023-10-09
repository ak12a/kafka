# About Kafka Raft 
* in 2020, The Apache Kafka project started to work to `Remove the zookeepers dependency form kafka` (KIP-500)
* Zookeepers show scalling issue when kafka cluster have > 100,000 partitions. 
* By Removing Zookeepers, Apache-Kafka can
   - Scale the Milions of Partitions and become easy to maintain and setup. 
   - Improve staibility, makes easier to monitor, suppport and administrator. 
   - Single security model for whole system. You do not have to worry about zookeeper security as well. 
   - Single Process to start kafka. 
   - Faster controller shutdown and revovery time. 

* Kafka 3.X now implemented the Raft protocol (Kraft) in order to replace the zookeepers. 
   - Production  Ready since 3.3.1 (KIP-833)
   - Version 4.0 will be releases only with KRaft (No Zookeepers). 
   -  
