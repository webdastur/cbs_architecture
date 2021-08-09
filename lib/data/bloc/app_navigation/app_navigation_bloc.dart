import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_navigation_event.dart';
part 'app_navigation_state.dart';

class AppNavigationBloc extends Bloc<AppNavigationEvent, AppNavigationState> {
  AppNavigationBloc() : super(AppNavigationChange(appNavigationType: AppNavigationType.ALL));

  @override
  Stream<AppNavigationState> mapEventToState(
    AppNavigationEvent event,
  ) async* {
    if (event is AppNavigationChanged) yield AppNavigationChange(appNavigationType: event.appNavigationType);
  }
}
