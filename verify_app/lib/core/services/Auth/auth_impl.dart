import 'package:verify_app/core/constants/api_routes.dart';
import 'package:verify_app/core/services/Api/ApiService.dart';
import 'package:verify_app/core/services/Auth/auth.dart';
import 'package:verify_app/locator.dart';

class AuthImpl extends Auth {
  final _api = locator<ApiService>();
  final _header = {'Content-Type': 'application/json'};
  @override
  Future signInFacebook({String token}) {
    // TODO: implement signInFacebook
    throw UnimplementedError();
  }

  @override
  Future signInGoogle({String token}) {
    // TODO: implement signInGoogle
    throw UnimplementedError();
  }

  @override
  Future signInManually({String email, String password}) async {
    assert(email.isNotEmpty && password.isNotEmpty);
    assert(email != null && password != null);
    var body = {'email': '$email', 'password': '$password'};
    try {
      final response = await _api.post(ApiRoutes.signin, _header, body);
    } catch (e) {}
  }
}
