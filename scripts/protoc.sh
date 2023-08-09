#! /bin/bash
set -euo pipefail

mkdir -p lib/grpc-gen/

# Generate models only
protoc -I protos/ --dart_out=lib/grpc-gen/ protos/user.proto 

# Generate Well-Known Types
# google/protobuf/timestamp.proto 
protoc -I protos/ --dart_out=lib/grpc-gen/ google/protobuf/empty.proto google/protobuf/field_mask.proto 

# Generate models + grpc stubs
protoc -I protos/ --dart_out=grpc:lib/grpc-gen/ protos/user_service.proto