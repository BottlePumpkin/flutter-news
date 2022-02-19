import 'dart:convert';

import 'package:flutter_news/app/palette/network/http_client.dart';
import 'package:flutter_news/app/palette/network/http_method.dart';
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
      print(e);
      //throw MalformedError();
    }

    return res;
  }
}
