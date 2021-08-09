part of 'app_navigation_bloc.dart';

abstract class AppNavigationEvent extends Equatable {
  const AppNavigationEvent();

  @override
  List<Object> get props => [];
}

class AppNavigationChanged extends AppNavigationEvent {
  const AppNavigationChanged({
    required this.appNavigationType,
  });

  final AppNavigationType appNavigationType;

  @override
  List<Object> get props => [appNavigationType];
}
