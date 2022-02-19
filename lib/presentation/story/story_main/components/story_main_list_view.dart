import 'package:flutter/material.dart';
import 'package:flutter_news/app/config/routes.dart';
import 'package:flutter_news/presentation/story/story_main/story_main_view_model.dart';



class StoryMainListView extends StatelessWidget {
  const StoryMainListView({
    Key? key,
    required StoryMainViewModel viewModel,
  }) : _viewModel = viewModel, super(key: key);

  final StoryMainViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, storyDetail);

          },
          child: Container(
            height: 80,
            child: Text(
              _viewModel.storyList[index],
              style: TextStyle(fontSize: 30),
            ),
          ),
        );
      },
    );
  }
}
