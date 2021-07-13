part of 'playvideo_bloc.dart';

@immutable
abstract class PlayvideoState {}

class PlayvideoLoading extends PlayvideoState {}

class PlayVideSuccessFullState extends PlayvideoState {
  final String id;

  PlayVideSuccessFullState({required this.id});
}

class PlayVideosNoVideosState extends PlayvideoState {}
