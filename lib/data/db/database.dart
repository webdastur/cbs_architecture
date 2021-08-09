import 'dart:async';

import 'package:aliftech_task/data/db/dao/task_model_dao.dart';
import 'package:aliftech_task/data/model/task_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [TaskModel])
abstract class AppDatabase extends FloorDatabase {
  TaskModelDao get tasksDao;

}
