import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:grpc_streaming/src/auth/provider/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final Option<SharedPreferences> _prefs = const None();
  final _userKey = 'user';

  Future<SharedPreferences> get _storage async {
    return await _prefs.fold(
      () async => await SharedPreferences.getInstance(),
      (t) async => t,
    );
  }

  Future<Option<User>> getUser() async {
    final storage = await _storage;
    final userString = storage.getString(_userKey);

    if (userString == null) {
      return const None();
    } else {
      final userMap = jsonDecode(userString);
      return Some(User.fromJson(userMap));
    }
  }

  Future<void> logout() async {
    final storage = await _storage;
    await storage.remove(_userKey);
  }

  Future<Option<User>> saveUser(User user) async {
    final storage = await _storage;
    await storage.setString(_userKey, jsonEncode(user.toJson()));
    return getUser();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
