// 📦 Package imports:
import 'package:get_it/get_it.dart';

// 🌎 Project imports:
import 'package:cbs_architecture/data/bloc/number/number_bloc.dart';

class AppBloc {
  NumberBloc _numberBloc;

  static Future init() async {
    final getIt = GetIt.instance;

    getIt.registerSingleton<AppBloc>(AppBloc());
    await getIt<AppBloc>().create();
  }

  Future create() async {
    _numberBloc = NumberBloc();
  }

  NumberBloc get numberBloc => _numberBloc;
}
