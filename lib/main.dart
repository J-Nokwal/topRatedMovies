import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posiblesoftwareinterntest/model/network.dart';
import 'package:posiblesoftwareinterntest/ui/loadingScreen.dart';
import 'package:posiblesoftwareinterntest/ui/videosListScreen.dart';

import 'model/SearchBloc/search_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final ApiDataSource apiDataSource = ApiDataSource();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc()..add(SearchEventPressedEvent()),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return LoadingScreen();
          } else if (state is SearchSuccessFullState) {
            return VideoListPage(
              videosDetails: state.videosDetails,
            );
          }
          return Text('error on main');
        },
      ),
    );
  }
}
