import 'dart:convert' as convert;

import 'package:verify_app/core/models/api_error_model.dart';
import 'package:http/http.dart' as http;

void showLoadingProgress(received, total) {
  if (total != -1) {
    print('progress ${(received / total * 100).toStringAsFixed(0)}%');
  }
}

dynamic responseHandler(http.Response response) async {
  switch (response.statusCode) {
    case 201:
    case 200:
      print(['200/201 >>', response.body]);
      return response.body;
      break;
    case 400:
      print(['400 >>', response.body]);
      final error = apiErrorModelFromJson(response.body);

      throw (error.error);

      break;
    case 401:
      print(['401 >>', response.body]);
      final error = apiErrorModelFromJson(response.body);
      throw (error.error);
      break;
    case 403:
      print(['403 >>', response.body]);
      final error = apiErrorModelFromJson(response.body);
      throw (error.error);
      break;
    case 404:
      print(['404 >>', response.body]);
      final error = apiErrorModelFromJson(response.body);
      throw (error.error);
      break;
    case 409:
      print(['409 >>', response.body]);
      final error = apiErrorModelFromJson(response.body);
      throw (error.error);
      break;
    case 500:
    default:
      print(['500 >>', response.body]);
      final error = apiErrorModelFromJson(response.body);
      throw (error.error);
      break;
  }
}
