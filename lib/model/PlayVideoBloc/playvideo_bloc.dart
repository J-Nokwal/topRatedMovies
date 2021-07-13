import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:posiblesoftwareinterntest/model/network.dart';
import 'package:posiblesoftwareinterntest/model/serializationofVideo.dart';

part 'playvideo_event.dart';
part 'playvideo_state.dart';

class PlayvideoBloc extends Bloc<PlayvideoEvent, PlayvideoState> {
  PlayvideoBloc() : super(PlayvideoLoading());
  ApiDataSource apiDataSource = ApiDataSource();
  @override
  Stream<PlayvideoState> mapEventToState(
    PlayvideoEvent event,
  ) async* {
    if (event is PlayVideoInitialEvent) {
      yield PlayvideoLoading();

      VideosPlay videosPlay =
          await apiDataSource.getVideoYouTubeId(id: event.movieId);
      if (videosPlay.results.length > 0) {
        for (Result aa in videosPlay.results) {
          if (aa.type == 'Trailer') {
            print("keeeyyyyyy: ${aa.key}");
            yield PlayVideSuccessFullState(id: aa.key);

            break;
          }
          yield PlayVideosNoVideosState();
        }
      } else {
        yield PlayVideosNoVideosState();
      }
    }
  }
}
