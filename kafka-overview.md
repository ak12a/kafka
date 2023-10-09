# Apache Kafka  

## What is `Apache Kafka` ?
### *`Apache Kafka` is an open-source `event streaming` platform. It ingests data from different sources and processes it on a real-time basis. It is used by thousands of companies in various scenarios such as creation of data pipelines, on-the-fly processing, and so on.*

 ### *Kafka is generally deployed as a cluster of two or more instances across multiple servers. It can be deployed on bare-metal hardware, on virtual machines, or on containers using Docker or similar container platforms.*

## *Apache Kafka provides three functionalities that can be used for event streaming:*

 1. ***Publish (`write`) and subscribe (`read`) to different streams of events.***

1. ***Store the streams of events for an indefinite period of time.***

2.  ***Process the events that are written on the stream, on a real-time basis.***


##  `Features of Kafka`

*  ***Stores the streams of events/messages in a fault-tolerant manner.***
  
* ***Ability to scale the cluster for processing trillions of events per day.***
  
* ***Distributed architecture to ensure fault tolerance, high scalability, reliability, high availability, etc.***

* ***Processes the messages of different streams to provide real-time aggregations, transformations, filtering, etc.***

* ***Connects with hundreds of data sources and sinks, such as Elasticsearch, Postgres, and others, using Kafka Connect.***

*  ***Allows connectivity using client libraries in various programming languages.***


## `How does Kafka work?`

### ***Each instance of Kafka is interchangeably called Kafka server or Kafka broker.***

* ***The brokers receive messages/events from producers and store them on disk. The producers are external applications that generate data. They connect to Kafka for writing that data.***

* ***The messages can be fetched from consumers using the topic name. The consumers are external applications that fetch the data written by the producers.***

* ***The `broker` maintains an `offset` for the consumer fetching from the `topic`. The `offset` helps in `tracking` how many `messages/events` have been `consumed by the consumer`.***

* ***To `differentiate` the messages from multiple streams, they are `written` into `different topics`.***

* ***T`hese topics are maintained as log files on disk`. The topics are `partitioned into multiple log files` and stored across the cluster for `better scalability.`***

* ***For `fault tolerance`, the topics can be replicated using a suitable replication factor. These components can be configured differently for each of the topics.***

