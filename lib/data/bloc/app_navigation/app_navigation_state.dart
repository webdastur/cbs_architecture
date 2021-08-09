part of 'app_navigation_bloc.dart';

enum AppNavigationType { ALL, IN_PROGRESS, DONE }

abstract class AppNavigationState extends Equatable {
  const AppNavigationState();

  @override
  List<Object> get props => [];
}

class AppNavigationChange extends AppNavigationState {
  const AppNavigationChange({
    required this.appNavigationType,
  });

  final AppNavigationType appNavigationType;

  @override
  List<Object> get props => [appNavigationType];
}
