

abstract class HttpClient<RESPONSE> {



  Future<RESPONSE> get({required Uri uri, Map<String,String>? headers});

  Future<RESPONSE> post({required Uri uri, Map<String,String>? headers, Map<String, dynamic> body } );

  Future<RESPONSE> put({required Uri uri, Map<String,String>? headers});

  Future<RESPONSE> delete({required Uri uri, Map<String,String>? headers});

}


