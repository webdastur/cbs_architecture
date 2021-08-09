// 📦 Package imports:
import 'package:aliftech_task/data/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:aliftech_task/data/bloc/tasks/tasks_bloc.dart';
import 'package:get_it/get_it.dart';

// 🌎 Project imports:

class AppBloc {
  late AppNavigationBloc _navigationBloc;
  late TasksBloc _tasksBloc;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<AppBloc>(AppBloc());
    await getIt<AppBloc>().create();
  }

  Future create() async {
    _navigationBloc = AppNavigationBloc();
    _tasksBloc = TasksBloc()..add(TasksAllLoaded());
  }


  AppNavigationBloc get navigationBloc => _navigationBloc;
  TasksBloc get tasksBloc => _tasksBloc;
}
