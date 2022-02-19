// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_news/data/api/story_api.dart';
import 'package:flutter_news/data/repositories/story_repository_impl.dart';
import 'package:flutter_news/domain/usecases/news/story_main_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_news/main.dart';

void main() {

  test('t', () async {
   var response = await StoryMainUsecase(repository: StoryRepositoryImpl(storyApi: StoryApi())).call('topstories');


  });
}
