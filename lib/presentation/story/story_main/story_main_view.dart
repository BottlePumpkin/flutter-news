import 'package:flutter/material.dart';
import 'package:flutter_news/presentation/story/story_main/story_main_view_model.dart';
import 'package:provider/provider.dart';

class StoryMainView extends StatefulWidget {
  @override
  State<StoryMainView> createState() => _StoryMainViewState();
}

class _StoryMainViewState extends State<StoryMainView> {


  @override
  void initState() {
    Provider.of<StoryMainViewModel>(context,listen: false).fetchStoriesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    StoryMainViewModel _viewModel = Provider.of<StoryMainViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: DropdownButton(
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
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _viewModel.fetchStoriesList();
        },
        child:

        !_viewModel.isLoading ? Container(color: Colors.red,) :
        ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
                    height: 80, child: Text(_viewModel.storyList[index])));
          },
        ),
      ),
    );
  }
}
