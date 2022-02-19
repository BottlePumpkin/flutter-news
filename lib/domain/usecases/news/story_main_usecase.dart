import 'package:flutter_news/data/repositories/story_repository.dart';
import 'package:flutter_news/domain/entities/news/story_main_entity.dart';

class StoryMainUsecase {
  final StoryRepository repository;

  StoryMainUsecase({required this.repository});

  Future<List<StoryMainEntity>> call(String category) async {
    final response = await repository.fetchStoriesList(category);

    return response
        .map(
          (e) => StoryMainEntity(storyId: e),
        )
        .toList();
  }
}
