import 'package:aliftech_task/data/bloc/tasks/tasks_bloc.dart';
import 'package:aliftech_task/data/services/root_service.dart';
import 'package:aliftech_task/data/utils/app_logger_util.dart';
import 'package:aliftech_task/data/utils/app_utils.dart';
import 'package:aliftech_task/data/utils/date_time_util.dart';
import 'package:aliftech_task/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllTasksPage extends StatelessWidget {
  const AllTasksPage({Key? key}) : super(key: key);
  static const routeName = "/allTasksPage";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      bloc: RootService.appBloc.tasksBloc,
      builder: (context, state) {
        if (state is TasksLoad) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              DateTime date = new DateTime.fromMillisecondsSinceEpoch(state.list[index].dueDate);
              return Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                // height: SizeConst.SIZE_100,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppWidgets.text(text: state.list[index].name),
                          SizedBox(
                            height: 10,
                          ),
                          AppWidgets.text(text: DateTimeUtil.dMEEE(date, context.locale)),
                        ],
                      ),
                    ),
                    Center(
                      child: DropdownButton(
                        hint: Text('Please choose a location'), // Not necessary for Option 1
                        value: status[state.list[index].status],
                        onChanged: (newValue) {
                          AppLoggerUtil.e(newValue.toString());
                          AppLoggerUtil.e(state.list[index].status.toString());
                          int k = status.indexOf(newValue.toString());
                          RootService.appBloc.tasksBloc.add(TasksUpdated(state.list[index]..status=k));
                          RootService.appBloc.tasksBloc.add(TasksAllLoaded());
                        },
                        items: status.map((s) {
                          return DropdownMenuItem(
                            child: AppWidgets.text(text: s),
                            value: s,
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: state.list.length,
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
