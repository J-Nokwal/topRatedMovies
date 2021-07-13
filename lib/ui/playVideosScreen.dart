import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posiblesoftwareinterntest/model/PlayVideoBloc/playvideo_bloc.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'loadingScreen.dart';
import 'noVideoScreen.dart';

class PlayVideoPage extends StatelessWidget {
  const PlayVideoPage({Key? key, required this.id}) : super(key: key);

  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PlayvideoBloc>(
        create: (context) =>
            PlayvideoBloc()..add(PlayVideoInitialEvent(movieId: id)),
        child: BlocBuilder<PlayvideoBloc, PlayvideoState>(
          builder: (context, state) {
            print(state.toString());
            if (state is PlayvideoLoading) {
              return LoadingScreen();
            } else if (state is PlayVideosNoVideosState) {
              return NoVideoScreen();
            } else if (state is PlayVideSuccessFullState) {
              return PlayVideo(
                videoId: state.id,
              );
            }
            return Text(id.toString());
          },
        ),
      ),
    );
  }
}

class PlayVideo extends StatefulWidget {
  final String videoId;
  const PlayVideo({Key? key, required this.videoId}) : super(key: key);

  @override
  _PlayVideoState createState() => _PlayVideoState(videoId);
}

class _PlayVideoState extends State<PlayVideo> {
  final String videoId;

  _PlayVideoState(this.videoId);
  YoutubePlayerController? _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    // print("aaaaaaaaaaaaaaaaaaaaaaa$videoId");
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      params: YoutubePlayerParams(
          // Defining custom playlist

          showControls: true,
          showFullscreenButton: false,
          strictRelatedVideos: true,
          showVideoAnnotations: false),
    );
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    this._youtubePlayerController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _youtubePlayerController!.stop();
        SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

        return true;
      },
      child: Container(
        color: Colors.black,
        child: YoutubePlayerControllerProvider(
          // Provides controller to all the widget below it.
          controller: _youtubePlayerController!,
          child: YoutubePlayerIFrame(
              aspectRatio: MediaQuery.of(context).size.width /
                  MediaQuery.of(context).size.height),
        ),
      ),
    );
  }
}
