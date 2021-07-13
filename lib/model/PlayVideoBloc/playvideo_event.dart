part of 'playvideo_bloc.dart';

@immutable
abstract class PlayvideoEvent {}

class PlayVideoInitialEvent extends PlayvideoEvent {
  final int movieId;

  PlayVideoInitialEvent({required this.movieId});
}
