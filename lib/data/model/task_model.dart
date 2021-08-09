// 📦 Package imports:
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
// ignore: must_be_immutable
class TaskModel extends Equatable {
  TaskModel(this.name, this.status, this.dueDate,);

  @PrimaryKey(autoGenerate: true)
  int? id;
  String name;
  int dueDate;
  int status;

  @override
  List<Object> get props => [
        name,
        status,
        dueDate,
      ];
}
