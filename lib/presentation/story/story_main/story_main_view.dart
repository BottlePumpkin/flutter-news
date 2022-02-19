import 'package:flutter/material.dart';
import 'package:flutter_news/presentation/story/story_main/components/main_dropdown_button.dart';
import 'package:flutter_news/presentation/story/story_main/components/story_main_list_view.dart';
import 'package:flutter_news/presentation/story/story_main/story_main_view_model.dart';
import 'package:provider/provider.dart';

class StoryMainView extends StatefulWidget {
  const StoryMainView({Key? key}) : super(key: key);

  @override
  State<StoryMainView> createState() => _StoryMainViewState();
}

class _StoryMainViewState extends State<StoryMainView> {
  @override
  void initState() {
    Provider.of<StoryMainViewModel>(context, listen: false).fetchStoriesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StoryMainViewModel _viewModel = Provider.of<StoryMainViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: MainDropdownButton(viewModel: _viewModel),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _viewModel.fetchStoriesList();
        },
        child: !_viewModel.isLoading
            ? const LoadingView()
            : StoryMainListView(viewModel: _viewModel),
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
           CircularProgressIndicator(),
           Text('loading')
        ],
      ),
    );
  }
}
