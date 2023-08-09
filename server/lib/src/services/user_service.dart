import 'package:grpc/grpc.dart';
import 'package:grpg_streaming/src/generated/google/protobuf/empty.pb.dart';
import 'package:grpg_streaming/src/generated/user_service.pbgrpc.dart';

import '../utils/auth_utils.dart';

class UserService extends UserServiceBase {
  @override
  Future<User> createUser(
    ServiceCall call,
    CreateUserRequest request,
  ) async {
    final passwordHash = hashPassword(request.password);
    throw UnimplementedError();
  }

  @override
  Future<Empty> deleteUser(
    ServiceCall call,
    DeleteUserRequest request,
  ) async {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<User> getUser(
    ServiceCall call,
    GetUserRequest request,
  ) async {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<ListUsersResponse> listUsers(
    ServiceCall call,
    ListUsersRequest request,
  ) async {
    // TODO: implement listUsers
    throw UnimplementedError();
  }

  @override
  Future<User> updateUser(
    ServiceCall call,
    UpdateUserRequest request,
  ) async {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Stream<StreamUserResponse> streamUser(
    ServiceCall call,
    StreamUserRequest request,
  ) async* {
    // TODO: implement streamUser
    throw UnimplementedError();
  }

  @override
  Stream<StreamUsersResponse> streamUsers(
    ServiceCall call,
    StreamUsersRequest request,
  ) async* {
    // TODO: implement streamUsers
    throw UnimplementedError();
  }
}
