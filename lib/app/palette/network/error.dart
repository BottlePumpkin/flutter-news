import 'package:json_annotation/json_annotation.dart';
part 'error.g.dart';

@JsonSerializable()
class STError extends Error {
  String? message;
  int? code;

  STError({this.message, this.code = 1});

  void byaction(String erraction) {
    message = erraction;
  }

  factory STError.fromJson(Map<String, dynamic> json) =>
      _$STErrorFromJson(json);
  Map<String, dynamic> toJson() => _$STErrorToJson(this);
}

class BadRequestError extends STError {
  BadRequestError({String? message, int? code})
      : super(message: message, code: code);
}