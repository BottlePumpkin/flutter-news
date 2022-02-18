

import 'dart:convert';
import 'package:flutter_news/app/palette/network/http_client.dart';
import 'package:flutter_news/app/palette/network/http_method.dart';
import 'package:http/http.dart' as http;


typedef RESPONSE = Map<String,dynamic>;


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

  @override
  Future post({required Uri uri, Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final request = http.Request(HttpMethod.post.value,uri);
    request.headers.addAll( {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    request.headers.addAll(headers ?? {});

    request.body = jsonEncode(body);
    final res = await request.send();
    final result = await http.Response.fromStream(res);
    return _response(result);
  }


  @override
  Future delete({required Uri uri, Map<String, String>? headers}) {
    // TODO: implement delete
    throw UnimplementedError();
  }



  @override
  Future put({required Uri uri, Map<String, String>? headers}) {
    // TODO: implement put
    throw UnimplementedError();
  }




  Future<RESPONSE> _response(http.Response response) async {
    dynamic res;

    try {
      res = jsonDecode(response.body);
    } catch (e) {
      //throw MalformedError();
    }
    const encoder =   JsonEncoder.withIndent('  ');
    final resString = '-- Payload: ${encoder.convert(res)}';
    final hasErrorCode =
        response.statusCode >= 400 && response.statusCode < 500;
    // final log = hasErrorCode ? logger.e : logger.i;
    // log('HTTP request ' +
    //     response.request!.url.toString() +
    //     '\nHTTP response ' +
    //     resString +
    //     '\nHeaders: ${encoder.convert(response.request?.headers)}');

    if (response.statusCode >= 400 && response.statusCode < 500) {
      // final err = SBError(message: res['message'], code: res['code']);
      // errorController.sink.add(err);
      // //NOTE: is this best way to do?..
      // if (err.code == ErrorCode.sessionKeyExpired) {
      //   log('Attempting to update session due to expired');
      //   // TODO: refactor
      //   SendbirdSdk().getInternal().state.sessionKey = null;
      //   SendbirdSdk().getInternal().sessionManager.setSessionKey(null);
      //   try {
      //     await SendbirdSdk().getInternal().sessionManager.updateSession();
      //   } catch (e) {
      //     rethrow;
      //   }
      // }
    }

   // switch (response.statusCode) {
        return res;
      // case 200:
      //   return res;
      // case 201:
      //   return res;
      // case 400:
      //   logger.e(
      //       'Bad request: ${res['message']} for ${response.request!.url.toString()}');
      // throw BadRequestError(message: res['message'], code: res['code']);
      // case 500:
      //   logger.e(
      //       'Bad request: ${res['message']} for ${response.request!.url.toString()}');
      //   throw BadRequestError(message: res['message'], code: res['code']);
      // default:
      // logger.e(
      //     'Bad request: ${res['message']} for ${response.request!.url.toString()}');
      //
      // throw BadRequestError(message: res['message'], code: res['code']);
    //throw InternalServerError(
    // message: 'internal server error :${response.statusCode}');
   // }
  }








}


// final url = Uri.parse('http://ec2-15-165-203-125.ap-northeast-2.compute.amazonaws.com/api/v1/bases/ping');
// final res = await http.get(url);
// print(res.body);