import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'conectivity_event.dart';
part 'conectivity_state.dart';

class ConectivityBloc extends Bloc<ConectivityEvent, ConectivityState> {
  ConectivityBloc() : super(ConectivityFalse());
  ConnectivityResult? connectivityResult;

  @override
  Stream<ConectivityState> mapEventToState(
    ConectivityEvent event,
  ) async* {
    connectivityResult = await Connectivity().checkConnectivity();
    print('object');
    if (event is ConectivityInitialEvent) {
      if (connectivityResult == ConnectivityResult.none) {
        yield ConectivityFalse();
      } else {
        yield ConectivityTrue();
      }
    }
  }
}
