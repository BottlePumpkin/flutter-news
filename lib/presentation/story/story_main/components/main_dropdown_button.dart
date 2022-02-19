
import 'package:flutter/material.dart';
import 'package:flutter_news/presentation/story/story_main/story_main_view_model.dart';

class MainDropdownButton extends StatelessWidget {
  const MainDropdownButton({
    Key? key,
    required StoryMainViewModel viewModel,
  }) : _viewModel = viewModel, super(key: key);

  final StoryMainViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _viewModel.currentCategoryValue,
      items: _viewModel.storyCategory
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        _viewModel.dropDownMenuName(value!);
      },
    );
  }
}
