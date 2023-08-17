import 'package:fpdart/fpdart.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc_streaming/src/auth/provider/auth_state.dart';
import 'package:grpc_streaming/src/shared/grpc-gen/index.dart' as grpc;

class SignInRepository {
  final grpc.UserServiceClient userServiceClient;
  SignInRepository({
    required this.userServiceClient,
  });

  Future<Either<String, User>> signIn(String username, String password) async {
    try {
      final response = await userServiceClient.login(
        grpc.LoginRequest(username: username, password: password),
      );
      final user = response.user;
      return Right(
        User(
          id: user.id,
          username: user.name,
          jwt: response.accessToken,
        ),
      );
    } on GrpcError catch (e) {
      return left(e.message ?? 'Failed to login. $e');
    }
  }
}
