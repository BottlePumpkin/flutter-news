



import 'package:flutter/foundation.dart';
import 'package:flutter_news/data/model/story_detail_model.dart';

abstract class StoryRepository extends ChangeNotifier {

  Future<List<dynamic>> fetchStoriesList(String category);

  Future<StoryDetailModel> fetchStoryDetail(String id);


}
