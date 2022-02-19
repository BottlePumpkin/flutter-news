

abstract class HttpClient<RESPONSE> {
  Future<RESPONSE> get({required Uri uri, Map<String,String>? headers});
}


