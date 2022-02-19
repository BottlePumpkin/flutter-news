
import 'package:flutter/material.dart';
import 'package:flutter_news/app/palette/dimensions/inset.dart';
import 'package:flutter_news/app/palette/dimensions/line.dart';
import 'package:flutter_news/presentation/story/story_detail/story_detail_view_model.dart';
import 'package:flutter_news/presentation/story/story_main/story_main_view.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryDetailView extends StatefulWidget {
  const StoryDetailView({Key? key}) : super(key: key);

  @override
  State<StoryDetailView> createState() => _StoryDetailViewState();
}

class _StoryDetailViewState extends State<StoryDetailView> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments as String;
      Provider.of<StoryDetailViewModel>(context, listen: false)
          .fetchStoryDetail(args);
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    Provider.of<StoryDetailViewModel>(context, listen: false).close();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    StoryDetailViewModel _viewModel =
        Provider.of<StoryDetailViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stories'),
      ),
      body: !_viewModel.isLoading
          ? const LoadingView()
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsExtension.horizontal20,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBoxExtension.space12,
                        Row(
                          children: [
                            Text('by: ${_viewModel.entity!.by}'),
                            const Spacer(),
                            Text('type: ${_viewModel.entity!.type}'),
                            const Spacer(),
                            Text('score: ${_viewModel.entity!.score}')
                          ],
                        ),
                        SizedBoxExtension.space12,
                        Text(_viewModel.entity!.title),
                        Text(_viewModel.entity!.text),
                        GestureDetector(
                          onTap: () {
                            _launchURL(_viewModel.entity!.url);
                          },
                          child: Text(
                            _viewModel.entity!.url,
                            style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
