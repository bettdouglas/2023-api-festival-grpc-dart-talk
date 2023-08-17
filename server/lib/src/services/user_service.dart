import 'package:grpc/grpc.dart';
import 'package:grpg_streaming/src/database/database.dart' as db;
import 'package:grpg_streaming/src/generated/index.dart';
import 'package:grpg_streaming/src/utils/auth_utils.dart';

class UserService extends UserServiceBase {
  final db.EventsDatabase database;

  UserService({required this.database});

  @override
  Future<CreateUserResponse> createUser(
    ServiceCall call,
    CreateUserRequest request,
  ) async {
    final user = request.user;
    final password = request.password;
    final passwordHash = hashPassword(password);
    final savedUser = await database.addUser(user.name, passwordHash);
    final accessToken = createJwt(
      claims: {
        'id': savedUser.id.toString(),
        'username': user.name,
      },
    );
    return CreateUserResponse(
      user: savedUser.asGrpcUser(),
      accessToken: accessToken,
    );
  }

  @override
  Future<Empty> deleteUser(
    ServiceCall call,
    DeleteUserRequest request,
  ) async {
    await database.deleteUser(request.id);
    return Empty();
  }

  @override
  Future<User> getUser(
    ServiceCall call,
    GetUserRequest request,
  ) async {
    final user = await database.getUser(request.id).getSingleOrNull();
    if (user == null) {
      throw GrpcError.notFound('User not found');
    }
    return user.asGrpcUser();
  }

  @override
  Future<ListUsersResponse> listUsers(
    ServiceCall call,
    ListUsersRequest request,
  ) async {
    final users = await database.listUsers().get();
    return ListUsersResponse(users: users.map((e) => e.asGrpcUser()).toList());
  }

  @override
  Stream<StreamUserResponse> streamUser(
    ServiceCall call,
    StreamUserRequest request,
  ) async* {
    final userStream = database.getUser(request.id).watchSingleOrNull();
    await for (final user in userStream) {
      if (user == null) {
        throw GrpcError.notFound('User not found');
      }
      yield StreamUserResponse(user: user.asGrpcUser());
    }
  }

  @override
  Stream<StreamUsersResponse> streamUsers(
    ServiceCall call,
    StreamUsersRequest request,
  ) async* {
    final usersTableStream = database.listUsers().watch();
    await for (final users in usersTableStream) {
      yield StreamUsersResponse(
        users: users.map((e) => e.asGrpcUser()).toList(),
      );
    }
  }

  @override
  Future<User> updateUser(
    ServiceCall call,
    UpdateUserRequest request,
  ) async {
    // TODO: implement updateUser
    throw GrpcError.unimplemented();
  }

  @override
  Future<LoginResponse> login(
    ServiceCall call,
    LoginRequest request,
  ) async {
    final username = request.username;
    final password = request.password;
    final user = await database.getUserByName(username).getSingleOrNull();
    if (user == null) {
      throw GrpcError.notFound('User not found');
    }
    final passwordsMatch = checkPassword(password, user.passwordHash);
    if (!passwordsMatch) {
      throw GrpcError.unauthenticated('Invalid password');
    } else {
      final accessToken = createJwt(
        claims: {
          'id': user.id.toString(),
          'username': user.username,
        },
      );
      return LoginResponse(
        user: user.asGrpcUser(),
        accessToken: accessToken,
      );
    }
  }
}

extension AsGrpcUser on db.User {
  User asGrpcUser() {
    return User(
      id: id,
      name: username,
      createdAt: Timestamp.fromDateTime(createdAt),
    );
  }
}
