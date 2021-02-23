// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:cbs_architecture/data/utils/app_logger_util.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    AppLoggerUtil.d('$bloc => $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    // AppLoggerUtil.d('$cubit => $change');
    super.onChange(cubit, change);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    // AppLoggerUtil.d('onEvent: $bloc => $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    AppLoggerUtil.d('$cubit => $error');
    super.onError(cubit, error, stackTrace);
  }
}
