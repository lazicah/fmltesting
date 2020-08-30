abstract class ApiService {
  ///Http [GET] request
  Future<dynamic> get(dynamic url, header);

  ///Http [POST] request
  Future<dynamic> post(String url, dynamic header, dynamic body);

  ///Http [PUT] request
  Future<dynamic> put(dynamic url, dynamic header, {dynamic body});

  ///Http [DELETE] request
  Future<dynamic> delete(String url, dynamic header);

  ///Http [PATCH] request
  Future<dynamic> patch(String url, dynamic header, dynamic body);
}
