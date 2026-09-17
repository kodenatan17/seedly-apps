import 'package:seedly_app/cores/data/remote/response/boolean_only_remote_response.dart';
import 'package:seedly_app/features/auth/infrastructure/models/request/auth_refresh_token_request_model.dart';
import 'package:seedly_app/features/auth/infrastructure/models/response/auth_refresh_token_response.dart';
import 'package:seedly_app/features/auth/infrastructure/services/remote/auth_remote_service.dart';

abstract class AuthRemoteDataSource {
  // Future<String> signInWithGoogle(String idToken);

  Future<AuthRefreshTokenResponse> refreshToken(String refreshToken);

  Future<BooleanOnlyRemoteResponse> deleteAccount();

  Future<BooleanOnlyRemoteResponse> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._authRemoteService);

  final AuthRemoteService _authRemoteService;

  // @override
  // Future<String> signInWithGoogle(String idToken) async {
  //   final response = await _authRemoteService.refreshToken(idToken);
  //   return response.data.accessToken;
  // }

  @override
  Future<AuthRefreshTokenResponse> refreshToken(String refreshToken) async {
    final response = await _authRemoteService.refreshToken(
      AuthRefreshTokenRequestModel(refreshToken: refreshToken),
    );
    return response.data;
  }

  @override
  Future<BooleanOnlyRemoteResponse> deleteAccount() async {
    final response = await _authRemoteService.deleteAccount();
    return response.data;
  }

  @override
  Future<BooleanOnlyRemoteResponse> logout() async {
    final response = await _authRemoteService.logout();
    return response.data;
  }
}

// class GoogleAuthDataSourceImpl implements GoogleAuthDataSource {
//   GoogleAuthDataSourceImpl(this._googleSignIn);

//   final GoogleSignIn _googleSignIn;
//   bool _initialized = false;

//   Future<void> _ensureInitialized() async {
//     if (_initialized) return;
//     // `firebaseAndroidClientId` holds the OAuth "Web client" ID Firebase
//     // provisions alongside the Android app — the one audience Google issues
//     // ID tokens against consistently across platforms, which the backend
//     // needs to verify the token. Passed as `serverClientId` per the plugin's
//     // `initialize()` contract.
//     await _googleSignIn.initialize(
//       serverClientId: BaseEnvirontment().firebaseAndroidClientId,
//     );
//     _initialized = true;
//   }

//   @override
//   Future<String> signIn() async {
//     await _ensureInitialized();
//     final account = await _googleSignIn.authenticate();
//     final idToken = account.authentication.idToken;
//     if (idToken == null) {
//       throw const GoogleSignInException(
//         code: GoogleSignInExceptionCode.unknownError,
//         description: 'Google did not return an ID token.',
//       );
//     }
//     return idToken;
//   }

//   @override
//   Future<void> signOut() async {
//     await _ensureInitialized();
//     await _googleSignIn.signOut();
//   }
// }
