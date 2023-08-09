# When working with grpc-protobuf code generation, over time we've found out this makes development easy. 
1. Client & server in different folders on the same project. 
2. Protobufs folder definition with protobufs 
3. Scripts folder for scripts to easen code generation 

We start with defining our API. 
Let's have a simple OpenDatabase of events happening now. 
You upload an image and it's uploaded to a database. It'll take your location and show it on a Map of events.
The person on the map selects how long until the data he sees on the map will last for.
