// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:aliftech_task/data/utils/app_logger_util.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc? bloc, Object? event) {
    // AppLoggerUtil.d('onEvent: $bloc => $event');
    super.onEvent(bloc!, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    AppLoggerUtil.d('$bloc => $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    AppLoggerUtil.d('$bloc => $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    // AppLoggerUtil.d('$bloc => $change');
    super.onChange(bloc, change);
  }
}
