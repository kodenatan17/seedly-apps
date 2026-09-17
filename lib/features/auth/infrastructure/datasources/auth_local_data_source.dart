import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:seedly_app/cores/domain/auth_local_data_source.dart';
import 'package:seedly_app/cores/helpers/base_exception_helper.dart';

/// Feature-level superset of the cores-facing [AuthLocalDataSource] contract,
/// adding session-clearing for a future logout usecase.
abstract class AuthSessionLocalDataSource implements AuthLocalDataSource {
  Future<void> clearSession();
}

class AuthLocalDataSourceImpl implements AuthSessionLocalDataSource {
  const AuthLocalDataSourceImpl(this._storage);

  final FlutterSecureStorage _storage;

  static const _accessTokenKey = 'auth_access_token';
  static const _refreshTokenKey = 'auth_refresh_token';
  static const _agoraIdKey = 'auth_agora_id';

  @override
  Future<bool> isUserLoggedIn() async {
    final token = await _storage.read(key: _accessTokenKey);
    return token != null && token.isNotEmpty;
  }

  @override
  Future<String> getAccessToken() async {
    try {
      return await _storage.read(key: _accessTokenKey) ?? '';
    } catch (_) {
      throw const CacheException();
    }
  }

  @override
  Future<String> getRefreshToken() async {
    try {
      return await _storage.read(key: _refreshTokenKey) ?? '';
    } catch (_) {
      throw const CacheException();
    }
  }

  @override
  Future<void> setToken({
    required String accessToken,
    required String refreshToken,
    String? agoraId,
  }) async {
    try {
      await _storage.write(key: _accessTokenKey, value: accessToken);
      await _storage.write(key: _refreshTokenKey, value: refreshToken);
      if (agoraId != null) {
        await _storage.write(key: _agoraIdKey, value: agoraId);
      }
    } catch (_) {
      throw const CacheException();
    }
  }

  @override
  Future<void> clearSession() async {
    await _storage.deleteAll();
  }
}
