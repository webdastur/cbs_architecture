// 🎯 Dart imports:
import 'dart:ui';

// 📦 Package imports:
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

// 🌎 Project imports:
import 'package:aliftech_task/data/localization/locale_keys.g.dart';

class HiveService {
  late Box _box;
  static Future init() async {
    final getIt = GetIt.instance;

    getIt.registerSingleton<HiveService>(HiveService());
    await getIt<HiveService>().create();
  }

  Future create() async {
    _box = await Hive.openBox(LocaleKeys.app_name);
  }

  String getLang() {
    return _box.get(_HiveKeys.LANG, defaultValue: "uz_UZ");
  }

  void setLang(Locale locale) {
    _box.put(_HiveKeys.LANG, locale.toString());
  }
}

class _HiveKeys {
  static const String LANG = "lang";
}
