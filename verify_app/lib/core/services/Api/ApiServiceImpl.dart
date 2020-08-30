import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:verify_app/core/exceptions/network_exception.dart';
import 'package:verify_app/core/utils/network_utils.dart' as network_utils;

import 'ApiService.dart';

/// Helper service that abstracts away common HTTP Requests
class ApiServiceImpl implements ApiService {
  Future<dynamic> get(dynamic url, header) async {
    assert(url != null || header != null, 'url and header cannot be null');
    print('Api Get, url $url , header $header');
    var responseJson;
    try {
      final response = await http.get(url, headers: header);
      responseJson = await network_utils.responseHandler(response);
    } on SocketException {
      print('No net');
      throw NetworkException('No internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic header, dynamic body) async {
    assert(url != null || header != null, 'url and header cannot be null');
    print('Api Post, url $url , header $header');
    var responseJson;
    try {
      final response = await http.post(url, headers: header, body: body);
      responseJson = await network_utils.responseHandler(response);
    } on SocketException {
      print('No net');
      throw ('No Internet connection');
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> put(dynamic url, dynamic header, {dynamic body}) async {
    assert(url != null || header != null, 'url and header cannot be null');
    print('Api Put, url $url , header $header');
    var responseJson;
    if (body != null) {
      try {
        final response = await http.put(url, headers: header, body: body);
        responseJson = await network_utils.responseHandler(response);
      } on SocketException {
        print('No net');
        throw NetworkException('No internet connection');
      }
      print('api put.');
    } else {
      try {
        final response = await http.put(url, headers: header);
        responseJson = await network_utils.responseHandler(response);
      } on SocketException {
        print('No net');
        throw NetworkException('No internet connection');
      }
      print('api put.');
    }

    return responseJson;
  }

  Future<dynamic> delete(String url, dynamic header) async {
    assert(url != null || header != null, 'url and header cannot be null');
    print('Api delete, url $url , header $header');
    var responseJson;
    try {
      final response = await http.delete(url, headers: header);
      responseJson = await network_utils.responseHandler(response);
    } on SocketException {
      print('No net');
      throw NetworkException('No internet connection');
    }
    print('api delete.');
    return responseJson;
  }

  @override
  Future<dynamic> patch(String url, dynamic header, dynamic body) async {
    print('Api patch, url $url , header $header , body $body');
    var responseJson;
    try {
      final response = await http.patch(url, headers: header, body: body);
      responseJson = await network_utils.responseHandler(response);
    } on SocketException {
      print('No net');
      throw NetworkException('No internet connection');
    }
    print('api patch.');
    return responseJson;
  }
}
