// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc_streaming/src/auth/provider/auth_state.dart';
import 'package:grpc_streaming/src/shared/grpc-gen/index.dart' as grpc;

class SignUpRepository {
  final grpc.UserServiceClient userServiceClient;
  SignUpRepository({
    required this.userServiceClient,
  });

  Future<Either<String, User>> signUp(String username, String password) async {
    try {
      final response = await userServiceClient.createUser(
        grpc.CreateUserRequest(
          user: grpc.User(name: username),
          password: password,
        ),
      );
      return Right(
        User(
          id: response.user.id,
          username: response.user.name,
          jwt: response.accessToken,
        ),
      );
    } on GrpcError catch (e) {
      return left(e.message ?? 'Failed to create account. $e');
    }
  }
}
