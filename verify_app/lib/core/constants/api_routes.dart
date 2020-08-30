class ApiRoutes {
  ApiRoutes._();

  static const baseUrl = 'https://api.fundmylaptop.com/api';

  ///Authorizaation
  static const signin = '$baseUrl/users/login';
  static const googleauth = '$baseUrl/users/oauth/google';
  static const facebookauth = '$baseUrl/users/oauth/facebook';
}
