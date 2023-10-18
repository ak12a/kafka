# Setup Kafka mirrormaker-2 in Kubernetes 


## Agenda

   `To Mirror the all topics,messages,offsets from one cluster to another`

   * Mirroring  work in both Direction 
      -  Cluster-A  -->> Cluster-B
      -  Cluster-B  -->> Cluster-A
  
## `Prerequisities`
   
   * **one  Existing Kafka cluster with Any configuration (Example: 1 Partition, 1 Replicas or 3,Replicas )**
   
   * **If The both kafka clusters are in diffrent kubenretes cluster then we need to expose one Kafka endpoint over the PublicIP/Domain-name using Loadbalacer or Ingress.** 
   


## `Steps:`

## 1 Deploy a new kafka Cluster

   **`Note:  it is total up to you how many broker replicas and configuration you want`**

   *  `Deploy the mainfest file of zookeeper and kafka in a new namespace.`
   *  `Verify the cluster status` there should be no Topics and messages. 
   * 

## 2 Deploy the mirrormaker Deployment 
   * Build the image from Dockerfile. 
   * Push the Image to Google Cotainer Registry
   * You need to customize the labels and selector according the environment and nodegroup  
   * Deploy the MirrorMaker along with the kafka in the new namespace with given deployment manifest file  `mirromaker.yaml` .
   * Once get deployed, Login to the CLI and create some topics,messages and partiotion and consume the message on 1st cluster. 
   * Login to the 2nd cluster CLI and list the topics and message. 
   * It will take few minutes to mirror all topics and messages depends on number of topics. 
    

## 3 Important Note for the MirrorMaker Config
      
   1.  **Specify any number of cluster aliases**
  
       `cluster = A, B`  
            `Or`      
       `cluster = source, destination`
      
   2.   **Connection information for each cluster**
   
           * A.bootstrap.servers = ha-kafka-demo.**`default`**:9092
           * B.bootstrap.servers = ha-kafka-demo.**`kafka`**:9092

   3. **Enable and configure individual replication flow**
      * **A--->B.enabled = true** 
  
      * **B--->A.enabled = false**    `(whether we want mirroring from B->A mirroring as well)` 
      * **A->B.topics = .***
      *  **B->A.topics =**    ` mean no topic mirroring  from B->A` 
  
      * **replication.factor=3**    
         ```
         Whatever number we provide here it will create the number of replicas in **mirrord cluster(B)**, it will override the configuration of B cluster while mirroring the data from Cluser A to B. But if create a new topic on B cluster itself. it will the the configuration from their deployment argument. 
         ``` 
      * **replication.policy.separator=**
      * **source.cluster.alias=**
      * **target.cluster.alias=**     
      ```
      It will remove hthe alis of cluster name from topics`