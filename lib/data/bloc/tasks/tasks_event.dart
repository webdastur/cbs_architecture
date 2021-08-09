part of 'tasks_bloc.dart';

@immutable
abstract class TasksEvent extends Equatable {}

class TasksAdded extends TasksEvent {
  TasksAdded(this.taskModel);

  final TaskModel taskModel;

  @override
  List<Object?> get props => [taskModel];
}

class TasksAllLoaded extends TasksEvent {
  @override
  List<Object?> get props => [];
}

class TasksInProgressLoaded extends TasksEvent {
  @override
  List<Object?> get props => [];
}

class TasksDoneLoaded extends TasksEvent {
  @override
  List<Object?> get props => [];
}

class TasksUpdated extends TasksEvent {
  TasksUpdated(this.taskModel);

  final TaskModel taskModel;

  @override
  List<Object?> get props => [taskModel];
}

class TasksRemoved extends TasksEvent {
  @override
  List<Object?> get props => [];
}
