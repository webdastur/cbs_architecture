// 📦 Package imports:
import 'package:aliftech_task/data/services/db_service.dart';
import 'package:get_it/get_it.dart';

// 🌎 Project imports:
import 'package:aliftech_task/data/bloc/app_bloc.dart';
import 'package:aliftech_task/data/services/hive_service.dart';
import 'package:aliftech_task/data/services/http_service.dart';
import 'package:aliftech_task/data/services/navigator_service.dart';

class RootService {
  static final _getIt = GetIt.instance;

  static Future init() async {
    if (!_getIt.isRegistered<RootService>()) {
      _getIt.registerSingleton<RootService>(RootService());
      await _getIt<RootService>().initServices();
    }
  }

  Future initServices() async {
    await DBService.init();
    await AppBloc.init();
    await NavigatorService.init();
    await HiveService.init();
    await HttpService.init();
  }

  static AppBloc get appBloc => _getIt.get<AppBloc>();

  static DBService get dbService => _getIt.get<DBService>();

  static NavigatorService get navigatorService => _getIt.get<NavigatorService>();

  static HiveService get hiveService => _getIt.get<HiveService>();

  static HttpService get httpService => _getIt.get<HttpService>();
}
