import 'package:dbcrypt/dbcrypt.dart';
import 'package:dotenv/dotenv.dart';
import 'package:jose/jose.dart';

final dotEnv = DotEnv(includePlatformEnvironment: true)..load(['.env']);

String createJwt(
  Map<String, String> claims, {
  Duration expiry = const Duration(days: 2),
}) {
  final secretKey = dotEnv.getOrElse(
    'SECRET_KEY',
    () => throw 'SECRET_KEY not defined',
  );

  final builder = JsonWebSignatureBuilder();
  builder.addRecipient(
    JsonWebKey.fromJson(
      {
        "k": secretKey,
        "kty": 'oct',
      },
    ),
    algorithm: 'HS256',
  );
  builder.jsonContent = claims;
  final jwt = builder.build();
  return jwt.toCompactSerialization();
}

/// this will verify the JWT and return the claims or throw an exception.
/// Try catch will be needed when calling this method.
Future<Map<String, dynamic>> decodeJwt(String token) async {
  final secretKey = dotEnv.getOrElse(
    'SECRET_KEY',
    () => throw 'SECRET_KEY not defined',
  );
  final unverified = JsonWebToken.unverified(token);
  final keyStore = JsonWebKeyStore()
    ..addKey(JsonWebKey.fromJson({
      "kty": "oct",
      "k": secretKey,
    }));
  final verified = await unverified.verify(keyStore);
  if (verified) {
    final claims = Map<String, dynamic>.from(unverified.claims.toJson());
    claims['user_id'] = claims['id'];
    return claims;
  } else {
    throw InvalidTokenException('Invalid token');
  }
}

String hashPassword(String password) {
  return DBCrypt().hashpw(password, DBCrypt().gensalt());
}

bool checkPassword(String password, String passwordHash) {
  return DBCrypt().checkpw(password, passwordHash);
}

class InvalidTokenException implements Exception {
  final String message;
  InvalidTokenException(this.message);

  @override
  String toString() {
    return 'InvalidTokenException(message: $message)';
  }
}
