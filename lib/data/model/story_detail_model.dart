import 'package:json_annotation/json_annotation.dart';

part 'story_detail_model.g.dart';

@JsonSerializable(createToJson: false)
class StoryDetailModel {
  @JsonKey(name: 'by')
  final String by;

  @JsonKey(name: 'descendants')
  final int descendants;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'kids')
  final List<int> kids;

  @JsonKey(name: 'score')
  final int score;

  @JsonKey(name: 'time')
  final int time;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'url')
  final String url;

  StoryDetailModel(this.by, this.descendants, this.id, this.kids, this.score,
      this.time, this.title, this.type, this.url);

  factory StoryDetailModel.fromJson(Map<String, dynamic> json) =>
      _$StoryDetailModelFromJson(json);
}
