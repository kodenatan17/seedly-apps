abstract class AuthRemoteDataSource {
  Future<String> signInWithGoogle(String idToken);

}

class GoogleAuthDataSourceImpl implements GoogleAuthDataSource {
  GoogleAuthDataSourceImpl(this._googleSignIn);

  final GoogleSignIn _googleSignIn;
  bool _initialized = false;

  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    // `firebaseAndroidClientId` holds the OAuth "Web client" ID Firebase
    // provisions alongside the Android app — the one audience Google issues
    // ID tokens against consistently across platforms, which the backend
    // needs to verify the token. Passed as `serverClientId` per the plugin's
    // `initialize()` contract.
    await _googleSignIn.initialize(
      serverClientId: BaseEnvirontment().firebaseAndroidClientId,
    );
    _initialized = true;
  }

  @override
  Future<String> signIn() async {
    await _ensureInitialized();
    final account = await _googleSignIn.authenticate();
    final idToken = account.authentication.idToken;
    if (idToken == null) {
      throw const GoogleSignInException(
        code: GoogleSignInExceptionCode.unknownError,
        description: 'Google did not return an ID token.',
      );
    }
    return idToken;
  }

  @override
  Future<void> signOut() async {
    await _ensureInitialized();
    await _googleSignIn.signOut();
  }
}