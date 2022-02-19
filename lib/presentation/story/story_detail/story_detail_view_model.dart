import 'package:flutter/foundation.dart';
import 'package:flutter_news/domain/entities/news/story_detail_entity.dart';
import 'package:flutter_news/domain/usecases/news/story_detail_usecase.dart';

class StoryDetailViewModel extends ChangeNotifier {
  final StoryDetailUsecase usecase;
  StoryDetailEntity? entity;

  StoryDetailViewModel({required  this.usecase});

  bool isLoading = false;

  Future<void> fetchStoryDetail(String id) async {
    var response = await usecase.call(id);
    entity = response;
    loading();
    notifyListeners();
  }

  void loading() {
    if (entity == null) {
      isLoading = false;
    } else {
      isLoading = true;
    }
    notifyListeners();
  }

  void close() {
    isLoading = false;
  }



}
