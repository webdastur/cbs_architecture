// 📦 Package imports:
// 🌎 Project imports:
import 'package:aliftech_task/data/model/task_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class TaskModelDao {
  @insert
  Future<int> insertTaskModel(TaskModel taskModel);

  @delete
  Future<int> deleteTaskModel(TaskModel taskModel);

  @Query("DELETE FROM TaskModel")
  Future<void> clearTaskTable();

  @Query("SELECT * FROM TaskModel")
  Future<List<TaskModel>> findAllTaskModels();

  @Query("UPDATE TaskModel SET status = :status WHERE name = :name and dueDate = :dueDate")
  Future<void> updateTaskModel(String name,int dueDate,int status);
}
