import 'dart:convert';

import 'package:flutter_news/app/palette/network/error.dart';
import 'package:flutter_news/app/palette/network/http_client.dart';
import 'package:flutter_news/app/palette/network/http_method.dart';
import 'package:flutter_news/app/utilites/logger.dart';
import 'package:http/http.dart' as http;


typedef RESPONSE = dynamic;


class HttpClientImpl implements HttpClient {

  @override
  Future get({required Uri uri, Map<String, String>? headers}) async {
    final request = http.Request(HttpMethod.get.value,uri);
    request.headers.addAll( {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    request.headers.addAll(headers ?? {});
    final res = await request.send();
    final result = await http.Response.fromStream(res);

    return _response(result);
  }


  Future<RESPONSE> _response(http.Response response) async {
    dynamic res;

    try {
     res = jsonDecode(response.body);
    } catch (e) {
      // throw MalformedError();
    }

    switch (response.statusCode) {
      case 200:
        return res;
      case 201:
        return res;
      case 400:
        logger.e(
            'Bad request: ${res['message']} for ${response.request!.url.toString()}');
        throw BadRequestError(message: res['message'], code: res['code']);
      case 500:
        logger.e(
            'Bad request: ${res['message']} for ${response.request!.url.toString()}');
        throw BadRequestError(message: res['message'], code: res['code']);
      default:
        logger.e(
            'Bad request: ${res['message']} for ${response.request!.url.toString()}');

        throw BadRequestError(message: res['message'], code: res['code']);
    }
  }
}
