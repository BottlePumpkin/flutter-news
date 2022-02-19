
import 'package:flutter/cupertino.dart';
import 'package:flutter_news/app/palette/network/http_client_impl.dart';
import 'package:flutter_news/app/palette/network/uri_extension.dart';

class StoryApi extends ChangeNotifier {
  Future<List<dynamic>> fetchStoriesList() async {
    Map<String,String> parms = {
      'print' : 'pretty'
    };
    Uri uri = UriExtension.fetchUri(url: 'topstories',queryParams: parms);
    var _result = await HttpClientImpl().get(uri: uri);
    List<dynamic> response = _result.map((e) => e.toString()).toList();

    return response;
  }





}