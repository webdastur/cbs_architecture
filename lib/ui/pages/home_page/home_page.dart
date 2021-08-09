// 🐦 Flutter imports:
import 'package:aliftech_task/data/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:aliftech_task/data/bloc/tasks/tasks_bloc.dart';
// 🌎 Project imports:
import 'package:aliftech_task/data/localization/locale_keys.g.dart';
import 'package:aliftech_task/data/model/task_model.dart';
import 'package:aliftech_task/data/services/root_service.dart';
import 'package:aliftech_task/ui/pages/all_tasks_page/all_tasks_page.dart';
import 'package:aliftech_task/ui/pages/done_tasks_page/done_tasks_page.dart';
import 'package:aliftech_task/ui/pages/in_progress_tasks_page/in_progress_tasks_page.dart';
import 'package:aliftech_task/ui/widgets/app_navigation_bar.dart';
import 'package:aliftech_task/ui/widgets/app_navigation_bar_item.dart';
import 'package:aliftech_task/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/homePage";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
        bloc: RootService.appBloc.navigationBloc,
        builder: (context, state) {
          if (state is AppNavigationChange) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: AppWidgets.textLocale(
                  localeKey: LocaleKeys.app_name,
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      AppWidgets.showAlertDialog(context, "content", (content, dateTime) {
                        RootService.appBloc.tasksBloc.add(TasksAdded(TaskModel(content, 0, dateTime.millisecondsSinceEpoch)));
                        Navigator.pop(context);
                      }, DateTime.now());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              body: bodyBuilder(state.appNavigationType, context),
              bottomNavigationBar: AppNavigationBar(
                children: [
                  AppNavigationBarItem(
                    title: "All",
                    onPressed: () {
                      RootService.appBloc.navigationBloc.add(AppNavigationChanged(appNavigationType: AppNavigationType.ALL));
                      RootService.appBloc.tasksBloc.add(TasksAllLoaded());
                    },
                    icon: Icons.home,
                    isActive: state.appNavigationType == AppNavigationType.ALL,
                  ),
                  AppNavigationBarItem(
                    title: "In progress",
                    onPressed: () {
                      RootService.appBloc.navigationBloc.add(AppNavigationChanged(appNavigationType: AppNavigationType.IN_PROGRESS));
                      RootService.appBloc.tasksBloc.add(TasksInProgressLoaded());
                    },
                    icon: Icons.pie_chart_rounded,
                    isActive: state.appNavigationType == AppNavigationType.IN_PROGRESS,
                  ),
                  AppNavigationBarItem(
                    title: "Done",
                    onPressed: () {
                      RootService.appBloc.navigationBloc.add(AppNavigationChanged(appNavigationType: AppNavigationType.DONE));
                      RootService.appBloc.tasksBloc.add(TasksDoneLoaded());
                    },
                    icon: Icons.done_all,
                    isActive: state.appNavigationType == AppNavigationType.DONE,
                  ),
                ],
              ),
            );
          }
          return Container();
        });
  }

  Widget bodyBuilder(AppNavigationType appNavigationType, BuildContext context) {
    switch (appNavigationType) {
      case AppNavigationType.ALL:
        return AllTasksPage();
      case AppNavigationType.IN_PROGRESS:
        return InProgressTasksPage();
      case AppNavigationType.DONE:
        return DoneTasksPage();
      default:
        return Container();
    }
  }
}
