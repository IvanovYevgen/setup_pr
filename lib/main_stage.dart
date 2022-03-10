import 'package:flutter_template_project/flavour_config.dart';
import 'package:flutter_template_project/main.dart';

void main() async {
  Constants.setEnvironment(Environment.stage);
  await initializeApp();
}