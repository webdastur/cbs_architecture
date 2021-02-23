// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get_it/get_it.dart';

class NavigatorService {
  GlobalKey<NavigatorState> _key;
  GlobalKey<NavigatorState> get key => _key;

  static Future init() async {
    final getIt = GetIt.instance;

    getIt.registerSingleton<NavigatorService>(NavigatorService());
    await getIt<NavigatorService>().create();
  }

  Future create() async {
    _key = GlobalKey<NavigatorState>();
  }

  Future<dynamic> pushNamed(String routeName, {Object arguments}) {
    return _key.currentState.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object arguments}) {
    return _key.currentState.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pop([result]) {
    _key.currentState.maybePop(result);
  }

  bool canPop([result]) {
    return _key.currentState.canPop();
  }
}
