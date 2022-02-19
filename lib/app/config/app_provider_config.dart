import 'package:flutter_news/data/api/story_api.dart';
import 'package:flutter_news/data/repositories/story_repository_impl.dart';
import 'package:flutter_news/domain/usecases/news/story_detail_usecase.dart';
import 'package:flutter_news/domain/usecases/news/story_main_usecase.dart';
import 'package:flutter_news/presentation/story/story_detail/story_detail_view_model.dart';
import 'package:flutter_news/presentation/story/story_main/story_main_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviderConfig {
  AppProviderConfig._();

  static List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider<StoryMainViewModel>(
        create: (_) => StoryMainViewModel(
          usecase: StoryMainUsecase(
            repository: StoryRepositoryImpl(
              storyApi: StoryApi(),
            ),
          ),
        ),
      ),

      ChangeNotifierProvider<StoryDetailViewModel>(
        create: (_) => StoryDetailViewModel(
          usecase: StoryDetailUsecase(
            repository: StoryRepositoryImpl(
              storyApi: StoryApi(),
            ),
          ),
        ),
      )
    ];
  }
}
