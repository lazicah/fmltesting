abstract class Auth {
  ///Sign in with [email] and [password]
  Future<dynamic> signInManually({String email, String password});

  ///Sign with Google [token]
  Future<dynamic> signInGoogle({String token});

  ///Sign with Facebook [token]
  Future<dynamic> signInFacebook({String token});
}
