import 'dart:async';

import 'package:aliftech_task/data/model/task_model.dart';
import 'package:aliftech_task/data/services/root_service.dart';
import 'package:aliftech_task/data/utils/app_logger_util.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitial());

  @override
  Stream<TasksState> mapEventToState(
    TasksEvent event,
  ) async* {
    if (event is TasksAdded) {
      yield* _mapTasksAddedToState(event, state);
    }
    if (event is TasksAllLoaded) {
      yield* _mapTasksLoadedToState(event, state);
    }
    if (event is TasksInProgressLoaded) {
      yield* _mapTasksInProgressLoadedToState(event, state);
    }
    if (event is TasksDoneLoaded) {
      yield* _mapTasksDoneLoadedToState(event, state);
    }
    if (event is TasksUpdated) {
      yield* _mapTasksUpdateToState(event, state);
    }
    if (event is TasksRemoved) {
      yield* _mapTasksRemovedToState(event, state);
    }
  }

  Stream<TasksState> _mapTasksAddedToState(TasksAdded event, TasksState state) async* {
    var db = await RootService.dbService;
    await db.saveTaskModel(event.taskModel);
    List<TaskModel> list = await db.getTaskModel();
    yield TasksLoad(list);
  }

  Stream<TasksState> _mapTasksLoadedToState(TasksAllLoaded event, TasksState state) async* {
    var db = await RootService.dbService;
    List<TaskModel> list = await db.getTaskModel();
    yield TasksLoad(list);
  }

  Stream<TasksState> _mapTasksInProgressLoadedToState(TasksInProgressLoaded event, TasksState state) async* {
    var db = await RootService.dbService;
    List<TaskModel> list = await db.getTaskModel();
    list.removeWhere((element) => element.status != 1);
    yield TasksLoad(list);
  }

  Stream<TasksState> _mapTasksDoneLoadedToState(TasksDoneLoaded event, TasksState state) async* {
    var db = await RootService.dbService;
    List<TaskModel> list = await db.getTaskModel();
    list.removeWhere((element) => element.status != 2);
    yield TasksLoad(list);
  }

  Stream<TasksState> _mapTasksUpdateToState(TasksUpdated event, TasksState state) async* {
    var db = await RootService.dbService;
   await db.update(event.taskModel);

    yield TasksInitial();
  }

  Stream<TasksState> _mapTasksRemovedToState(TasksRemoved event, TasksState state) async* {
    var db = await RootService.dbService;
    List<TaskModel> list = await db.getTaskModel();
    list.removeWhere((element) => element.status != 1);
    yield TasksLoad(list);
  }
}
