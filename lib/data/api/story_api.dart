
import 'package:flutter/cupertino.dart';
import 'package:flutter_news/app/palette/network/http_client_impl.dart';
import 'package:flutter_news/app/palette/network/uri_extension.dart';
import 'package:flutter_news/data/model/story_detail_model.dart';

class StoryApi extends ChangeNotifier {
  Future<List<dynamic>> fetchStoriesList() async {
    Map<String,String> parms = {
      'print' : 'pretty'
    };
    Uri uri = UriExtension.fetchUri(url: 'topstories',queryParams: parms);
    var _result = await HttpClientImpl().get(uri: uri);
    return _result;
  }

  Future<StoryDetailModel> fetchStoryDetail() async {
    Map<String,String> parms = {
      'print' : 'pretty'
    };
    Uri uri = UriExtension.fetchUri(url: 'item/30392227',queryParams: parms);
    var _result = await HttpClientImpl().get(uri: uri);
    final value = StoryDetailModel.fromJson(_result);
    return value;
  }



}