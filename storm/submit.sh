docker run \
    -it \
    -v $(pwd)/test:/topo \
    --rm \
    --net bshm \
    storm \
    storm jar /topo/storm-mongodb-examples-1.1.1.jar org.apache.storm.mongodb.topology.UpdateWordCount mongodb://mongodb.bshm:27017/test wordcount mongo-update
    # /bin/bash
    #storm jar /topo/storm-mongodb-examples-1.1.1.jar org.apache.storm.mongodb.topology.InsertWordCount mongodb://mongodb.bshm:27017/test wordcount mongo-insert
