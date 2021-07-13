part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchSuccessFullState extends SearchState {
  final VideosDetails videosDetails;

  SearchSuccessFullState({required this.videosDetails});
}

class SearchLoading extends SearchState {}
