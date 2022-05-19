// ignore_for_file: constant_identifier_names

import 'package:projekt_pum/config/environment/base_config.dart';
import 'package:projekt_pum/config/environment/dev_config.dart';
import 'package:projekt_pum/config/environment/staging_config.dart';
import 'package:projekt_pum/config/production_config.dart';

class Environment {
  static final Environment _singleton = Environment._internal();

  static const String DEV = 'DEV';
  static const String STAGING = 'STAGING';
  static const String PROD = 'PROD';

  BaseConfig? config;
  String? environment;

  Environment._internal();

  factory Environment() {
    return _singleton;
  }

  initConfig(String env) {
    config = _getConfig(env);
    environment = env;
  }

  BaseConfig _getConfig(String env) {
    switch (env) {
      case Environment.PROD:
        return ProductionConfig();
      case Environment.STAGING:
        return StagingConfig();
      default:
        return DevelopmentConfig();
    }
  }
}
