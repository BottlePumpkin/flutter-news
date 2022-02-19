import 'package:flutter/foundation.dart';
import 'package:flutter_news/domain/usecases/news/story_main_usecase.dart';


class StoryMainViewModel extends ChangeNotifier {

  final StoryMainUsecase usecase;

  StoryMainViewModel( {
    required StoryMainUsecase this.usecase
 });

  bool isLoading = false;

  List<String> storyList = [];
  List<String> storyCategory =
  [
    "topstories",
    "newstories",
    "askstories",
    "showstories",
    "jobstories"
  ];

  String currentCategoryValue = "topstories";


  void dropDownMenuName(String value) {
    currentCategoryValue = value;
    fetchStoriesList();
  }


  Future<void> fetchStoriesList() async {
    var response = await usecase.call(currentCategoryValue);
    storyList = response.map((e) => e.storyId.toString()).toList();
    notifyListeners();
    isLoading = true;
  }


}