#! /bin/bash
set -euo pipefail

cd ..

mkdir -p client/lib/src/shared/grpc-gen/

# Generate Well-Known Types
# google/protobuf/timestamp.proto 
protoc -I protobufs/ --dart_out=client/lib/src/shared/grpc-gen/ google/protobuf/empty.proto google/protobuf/field_mask.proto google/protobuf/timestamp.proto

# Generate models + grpc stubs
protoc -I protobufs/ --dart_out=grpc:client/lib/src/shared/grpc-gen/ protobufs/user_service.proto
protoc -I protobufs/ --dart_out=grpc:client/lib/src/shared/grpc-gen/ protobufs/event_service.proto