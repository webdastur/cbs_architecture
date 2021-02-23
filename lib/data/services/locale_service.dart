// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart';

// 🌎 Project imports:
import 'package:cbs_architecture/data/services/root_service.dart';

class LocaleService {
  static Future init() async {
    final getIt = GetIt.instance;

    getIt.registerSingleton<LocaleService>(LocaleService());
    await getIt<LocaleService>().create();
  }

  Future create() async {}

  void changeLocale({BuildContext context, Locale locale}) {
    context.locale = locale;
    RootService.hiveService.setLang(locale);
  }
}
