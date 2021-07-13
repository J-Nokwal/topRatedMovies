import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:posiblesoftwareinterntest/model/network.dart';
import 'package:posiblesoftwareinterntest/model/serialization.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchLoading());
  final ApiDataSource apiDataSource = ApiDataSource();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchEventPressedEvent) {
      yield SearchLoading();
      VideosDetails videosDetails = await apiDataSource.searchVideos();
      yield SearchSuccessFullState(videosDetails: videosDetails);
    } else {
      throw SearchBlocError();
    }
  }
}

class SearchBlocError implements Exception {}
