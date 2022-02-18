typedef QueryParams = Map<String, dynamic>;

extension UriExtension on Uri {
  static Uri fetchUri(
          {String baseUrl = 'ec2-3-34-73-95.ap-northeast-2.compute.amazonaws.com',
           String url = '',
          QueryParams? queryParams}) =>
      Uri(
        scheme: 'http',
        host: baseUrl,
        port: 7001,
        path: '/api/v1/$url',
        queryParameters: _convertQueryParams(queryParams),
      );

  static QueryParams _convertQueryParams(QueryParams? q) {
    if (q == null) return {};
    final result = <String, dynamic>{};
    q.forEach((key, value) {
      if (value is List) {
        if (value is List<String>) {
          result[key] = value;
        } else {
          result[key] = value.map((e) => e.toString()).toList();
        }
      } else if (value != null) {
        result[key] = value.toString();
      }
    });
    return result;
  }
}

