#! /bin/bash
set -euo pipefail

cd ..

mkdir -p server/lib/src/generated/

# Generate Well-Known Types
# google/protobuf/timestamp.proto 
protoc -I protobufs/ --dart_out=server/lib/src/generated/ google/protobuf/empty.proto google/protobuf/field_mask.proto google/protobuf/timestamp.proto

# Generate models + grpc stubs
protoc -I protobufs/ --dart_out=grpc:server/lib/src/generated/ protobufs/user_service.proto
protoc -I protobufs/ --dart_out=grpc:server/lib/src/generated/ protobufs/event_service.proto