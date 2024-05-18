import 'dart:async';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppSetup {
  Future<void> init() async {
    setupWeb();

    await _setupHive();
  }

  Future<void> _setupHive() async {
    await Hive.initFlutter();
  }

  void setupWeb() {
    if (!kIsWeb) {
      return;
    }

    usePathUrlStrategy();
  }
}
