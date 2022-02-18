

enum HttpMethod {
  get,
  post,
  put,
  delete,
  patch,
}

extension HttpMethodExtesion on HttpMethod {
  String get value {
    switch (this) {
      case HttpMethod.get:
        return 'get';
      case HttpMethod.post:
        return 'post';
      case HttpMethod.put:
        return 'put';
      case HttpMethod.delete:
        return 'delete';
      case HttpMethod.patch:
        return 'patch';
      default:
        return "";
    }
  }



}