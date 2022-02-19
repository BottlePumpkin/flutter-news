import 'package:flutter_news/data/repositories/story_repository.dart';
import 'package:flutter_news/domain/entities/news/story_detail_entity.dart';

class StoryDetailUsecase {
  final StoryRepository repository;

  StoryDetailUsecase({required this.repository});

  Future<StoryDetailEntity> call(String id) async {
    final response = await repository.fetchStoryDetail(id);

    return StoryDetailEntity(
      by: response.by,
      descendants: response.descendants,
      id: response.id,
      kids: response.kids,
      score: response.score,
      time: response.time,
      title: response.title,
      type: response.type,
      text: response.text,
      url: response.url,
    );
  }
}
