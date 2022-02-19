import 'package:json_annotation/json_annotation.dart';

part 'story_detail_model.g.dart';

@JsonSerializable(createToJson: false)
class StoryDetailModel {
  @JsonKey(name: 'by', defaultValue: '')
  final String by;

  @JsonKey(name: 'descendants', defaultValue: 0)
  final int descendants;

  @JsonKey(name: 'id', defaultValue: 0)
  final int id;

  @JsonKey(name: 'kids', defaultValue: [])
  final List<int> kids;

  @JsonKey(name: 'score', defaultValue: 0)
  final int score;

  @JsonKey(name: 'time', defaultValue: 0)
  final int time;

  @JsonKey(name: 'text', defaultValue: '')
  final String text;

  @JsonKey(name: 'title', defaultValue: '')
  final String title;

  @JsonKey(name: 'type', defaultValue: '')
  final String type;

  @JsonKey(name: 'url', defaultValue: '')
  final String url;

  StoryDetailModel(
    this.by,
    this.descendants,
    this.id,
    this.kids,
    this.score,
    this.time,
    this.title,
    this.type,
    this.url,
    this.text,
  );

  factory StoryDetailModel.fromJson(Map<String, dynamic> json) =>
      _$StoryDetailModelFromJson(json);
}
