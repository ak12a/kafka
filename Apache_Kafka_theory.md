Apache Kafka
=========


Kafka Topics : 
===============

  Topics is a Perticular stream of Data. 

 * Like table in database without all the constraints  ( logs, Purchase, Gps_location, order_id )
 * You can have many topics as you want. 
 * A topis identified by it name: Example  log 
 * It support any kind of messages format like (Json,binary,raw etc)
 * The sequence of mesages in a topics is called data stream.  And this is why kafka is called data streaming platform. 
 * You can  not query topics. instead use kafka Producer to send data and kafka consumer to read data.  

=======================
Partitions and Offsets: 
=======================
* Topics are split in Partitions ( Example 100 Partations )
  	* Messages in each partations are orderd. 
  	* Each massages within a Partition gets an  incremential ID called offsets
  	   Example: 

  	       				| Partations 0       messageid 0 1 2 3 4 5 6 7 8 9 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2    SO-on-so-forth  writes --------------->
  	       				|                                                  0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6  
 Kafka Topics 	        |
  	       				| 
  	       				|       
  	       				|Partations 1       messageid 0 1 2 3 4 5 6 7 8 9 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2    SO-on-so-forth writes ------------------>  
  	       				|                                                 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 
  	       				|
  	       				| 
  	       				|Partations 2       messageid 0 1 2 3 4 5 6 7 8     SO-on-so-forth writes ------------------>  
  	       				|                                  

  	* Kafka topics are immutable. Once data is written in a partation you can not be changed.



 Topics Partations and Offsets : Important Notes: 
 -------------------------------------------------
  - Once the data is written in partitions it can not be changed (Immutability)
  - Data is kept only for a limited time ( Default 1 week - Configurable ) 
  - Offesets only have a meaning of a specific partations
     * Example: offset 3 in Partition 0 doesnot have same data in offset 3 in Partition 1. 
     * offsets not going to re-used even the previous message has been deleted. 
  - Order is gurantee only within a partition ( not accros partitions)
  - Data is assigned randomely to a partitions unless a key is provided.  
  - You can have many partitions per  topics as you want.     	  






  ================================
  Producers: 
  ================================

- Producers write data to topics ( Which are made of partitions) 
- Produces knows to which partitions to write to  ( and which kafka broker has it)
- In Case of kafka broker failuer, Producer will autometically recover it. 


Producer: Message Key
--------------------
- Producer can choose to send a `key` with the message ( string,number,binary,etc..)
- If the `key = null`, then data is send round robin ( Partition0, Partition1, Partition2 Partition.N..) 
- If `key != null`, Then all messages for that key will always go the smae partitions (hashing) 
- A key are tipically sent if you need message ordering for a specific field  ( Ex: GPS_Location,Order_id )


Kafka Message Anatomy: 
----------------------

When Kafka message created by Producer:

 |-----------------------------|---------------------------|
 |  Key-Binary                 | Value - Binary            |
 |  (can be null)              | ( can be null)            |
 |                             |                           |
 |                             |                           |
 |---------------------------------------------------------|
 | 						Compression Type                   |
 |              (none, gzip, snappy, lz4, zstd )           |  
 |                                                         |
 |---------------------------------------------------------|
 |				Header (Optional)                          |
 |          |--------------|----------|                    |                       
 |          | Key          | Value    |                    |
 |			| Key          | Value    |                    |
 |---------------------------------------------------------|
 |                Partitio + Offsets 					   |
 |                                                         |
 |---------------------------------------------------------|
 |                Timestamp ( System or user set)          |
 |                                                         |
 |---------------------------------------------------------|













===========================
Kafka Brokers :
===========================

1. Kafka clusters is composed of multiple brokers(servers). 
2. Each broker is identified with its id (intiger) Ex: Broker101, Broker102 etc..
3. Each Broker contains certain topics partitions. 
4. After connecting to any broker (called bootstarp broker), You will be connetd to entire cluster.(kafka client has smart machanicsm for that).
5. A Good Number to get started with 3 Brokers but some big clusters has 100 brokers. 
6.  






==========================
Producer Acknowledgments :
==========================
* Producers can choose to receive acknolowdgements of data writes
   - acks=0 ==> Producer wont wait for the acknowledgment ( possibly data loss )
   - acks=1 ==> Producer wait for leader acknowledgment  ( limited data loss)
   - acks=all ==> Producer wait for all Leader + replicas acknowledgment ( no data loss)



========================
Kafka Topics Durability:
======================== 

* For a topics replication factor 3, Topics data durability can withstand 2 broker loss. 
  - Mans if a topics with 3 Replication factor with 3 broker. There should be 2 brokers goes down but the cluster is stills accessible. 
* As a rule, replication factor of N, You can permanently loss up to N-1 number of broker and still recover your data. 





==================
Zookeeper
==================

* Zookeeres manages brokers ( Keep a list of them ) 
* Zookeepers helps in performing leader election of partitions. 
* Zookeepers send notification to kafak in case changes ( Eg: new_topics, broker_dies , Broker_comesUP, delete topics etc...)
* `Kafka 2.X.X can not without Zookepers`
* `Kafka 3.X.X can without Zookeepers (KIP-500) - Using Kafka Raft instead`
* `Kafka 4.X.X will not have Zookeepers`
* Zookeepers are designed to operates in odd numbers of servers ( 1,3,5,7,9)
* Zookeepers has a Leaders `(Write)` and the rest server are followers `(Read)` operations. 
* Zookeepers does not store consumers offsets with kafka > v0.10

============================
Should you use Zookeeprs ?
============================
`With kafka brokers?`

* If you are managing Kafka Brokers then Answer is YES. Until Kafka 4.0 is out while waiting for kafka without zookepers to be production ready. 


`With Kafka Clients?`
* Over time, the kafka client nand cli have been migrated to leverage the broker as connection endpoint instead of zookeepers. 
* Since Kafka v0.10 , Consumer store offsets in kafka and Zookeepers and must not use zookeepers as it is deperecated. 
* Sice Kafka 2.2, the `kafka-topics.sh` CLI command referance Kafka Broker and not zookeepers for topics managment( creation deletion, etc...) and zookeepers CLI argument is deprecated. 
* All the API and Command that were leveraging the Zookeepers are migrated to use `kafka` instead. So that when cluster are migrated to be without Zookeepers, the changes is invisible to clients. 
* Zookeepers is also less secreure than Kafka, and therefor Zookeepers Ports should only be opened to allo traffics from kafka brokers and not kafka clients.
* `Therefor, To be a great modern-day kafka developers, Never use zookeepers as a configurationin your kafka clients and another program that connect to  Kafka `
 
