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
