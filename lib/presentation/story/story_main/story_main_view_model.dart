import 'package:flutter/foundation.dart';
import 'package:flutter_news/domain/usecases/news/story_main_usecase.dart';

class StoryMainViewModel extends ChangeNotifier {
  final StoryMainUsecase usecase;

  // ignore: require_trailing_commas
  StoryMainViewModel({required this.usecase});

  bool isLoading = false;

  List<int> storyList = [];
  List<String> storyCategory = [
    'topstories',
    'newstories',
    'askstories',
    'showstories',
    'jobstories'
  ];

  String currentCategoryValue = 'topstories';

  void dropDownMenuName(String value) {
    currentCategoryValue = value;
    fetchStoriesList();
  }

  Future<void> fetchStoriesList() async {
    var response = await usecase.call(currentCategoryValue);
    storyList = response
        .map((e) => e.storyId.toInt())
        .toList();
    storyList.sort();
    loading();
    notifyListeners();
  }

  void loading() {
    if (storyList.isEmpty) {
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
