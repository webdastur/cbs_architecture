part of 'tasks_bloc.dart';

@immutable
abstract class TasksState extends Equatable {}

class TasksInitial extends TasksState {
  @override
  List<Object?> get props => [];
}

class TasksLoad extends TasksState {
  TasksLoad(this.list);
  List<TaskModel> list;
  @override
  List<Object?> get props => [list];
}
