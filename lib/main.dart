// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// 🌎 Project imports:
import 'package:cbs_architecture/app.dart';
import 'package:cbs_architecture/data/bloc/app_bloc_observer.dart';
import 'package:cbs_architecture/data/services/root_service.dart';

Future main() async {
  // Initializing core services
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Bloc.observer = AppBlocObserver();
  await Hive.initFlutter();
  await RootService.init();

  runApp(
    EasyLocalization(
      path: "assets/langs",
      supportedLocales: [
        Locale("uz", "UZ"),
        Locale("ru", "RU"),
      ],
      child: App(),
      fallbackLocale: Locale("uz", "UZ"),
    ),
  );
}
