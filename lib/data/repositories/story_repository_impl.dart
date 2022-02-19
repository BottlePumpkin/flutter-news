


import 'dart:ui';

import 'package:flutter_news/data/api/story_api.dart';
import 'package:flutter_news/data/model/story_detail_model.dart';
import 'package:flutter_news/data/repositories/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {

  final StoryApi storyApi;
  StoryRepositoryImpl({required this.storyApi});

  @override
  Future<List> fetchStoriesList(String category) async {
    final response = await storyApi.fetchStoriesList(category);
    return response;
  }

  @override
  Future<StoryDetailModel> fetchStoryDetail(String id) async {
    final response = await storyApi.fetchStoryDetail(id);
    return response;
  }




  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }



  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }
  
  
  
  
}