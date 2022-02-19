typedef QueryParams = Map<String, dynamic>;

extension UriExtension on Uri {
  // ignore: require_trailing_commas
  static Uri fetchUri(
          {String baseUrl = 'hacker-news.firebaseio.com',
           String url = '',
          QueryParams? queryParams}) =>
      Uri(
        scheme: 'https',
        host: baseUrl,
        path: 'v0/$url.json',
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

