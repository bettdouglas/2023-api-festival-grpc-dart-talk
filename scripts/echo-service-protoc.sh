#! /bin/bash
set -euo pipefail

cd ..

mkdir -p server/lib/src/generated/
mkdir -p client/lib/src/shared/grpc-gen/

# Generate Well-Known Types
# google/protobuf/timestamp.proto 

# Generate models + grpc stubs
protoc -I protobufs/ --dart_out=grpc:server/lib/src/generated/ protobufs/echo_service.proto
protoc -I protobufs/ --dart_out=grpc:client/lib/src/shared/grpc-gen/ protobufs/echo_service.proto