

import 'package:flutter/material.dart';

enum Environment {
  dev,
  stage,
  prod,
}

class Constants {
  static late Map<String, dynamic> _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.dev:
        _config = _Config.debugConstants;
        break;
      case Environment.stage:
        _config = _Config.stageConstants;
        break;
      case Environment.prod:
        _config = _Config.prodConstants;
        break;
    }
  }

  static String get whereAmI {
    return _config[_Config.flavour] as String;
  }
}

class _Config {
  static const flavour = 'flavour';

  static Map<String, dynamic> debugConstants = {
    flavour: 'dev',
  };

  static Map<String, dynamic> stageConstants = {
    flavour: 'stage',
  };

  static Map<String, dynamic> prodConstants = {
    flavour: 'prod',
  };

}

extension FlavourTypeExtension on String {
  Color getFlavourColor() {
    switch (this) {
      case 'dev':
        return Colors.yellow[800]!;
      case 'stage':
        return Colors.grey[600]!;
      case 'prod':
        return Colors.green[600]!;
      default:
        return Colors.blue[600]!;
    }
  }

  String getFlavourName() {
    switch (this) {
      case 'dev':
        return 'Development';
      case 'stage':
        return 'Staging';
      case 'prod':
        return 'Production';
      default:
        return 'Unknown';
    }
  }
}