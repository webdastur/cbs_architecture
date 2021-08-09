// 📦 Package imports:
// 🌎 Project imports:
import 'package:aliftech_task/data/db/database.dart';
import 'package:aliftech_task/data/model/task_model.dart';
import 'package:get_it/get_it.dart';

class DBService {
  static AppDatabase? _appDatabase;

  static Future init() async {
    final getIt = GetIt.instance;
    getIt.registerSingleton<DBService>(DBService());
    await getIt<DBService>().create();
  }

  Future create() async {
    if (_appDatabase == null) {
      _appDatabase = await $FloorAppDatabase.databaseBuilder('aliftech.db').build();
    }
  }

  Future<List<TaskModel>> getTaskModel() async {
    return await _appDatabase!.tasksDao.findAllTaskModels();
  }

  Future<int> saveTaskModel(TaskModel userModel) async {
    return await _appDatabase!.tasksDao.insertTaskModel(userModel);
  }

  Future<void> update(TaskModel userModel) async {
    return await _appDatabase!.tasksDao.updateTaskModel(userModel.name,userModel.dueDate,userModel.status);
  }

  Future<void> clearTaskModel() async {
    return await _appDatabase!.tasksDao.clearTaskTable();
  }
}
