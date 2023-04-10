import 'dart:async';
import 'package:api_com/api_com.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppSetup {
  Future<void> init() async {
    setupWeb();

    await _setupHive();

    await _setupApiCom();
  }

  Future<void> _setupHive() async {
    await Hive.initFlutter();
  }

  Future<void> _setupApiCom() async {
    Com.config = ComConfig(
      preDecorder: (payload) => payload['payload'],
    );
  }

  void setupWeb() {
    if (!kIsWeb) {
      return;
    }

    usePathUrlStrategy();
  }
}
