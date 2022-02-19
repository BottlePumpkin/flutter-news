
import 'package:flutter_news/presentation/story/story_main/story_main_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviderConfig {
  AppProviderConfig._();

  static List<SingleChildWidget> providers() {
    return [
    ChangeNotifierProvider<StroyMainViewModel>(
      create: (_) => StroyMainViewModel(),
    )
    ]

  }


}