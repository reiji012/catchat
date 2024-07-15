import 'development.dart';

enum Flavor {
  development,
  staging,
  production,
}

class Config extends EnvironmentConfig {
  static const String gptModel = EnvironmentConfig.gptModel;
  static const String gptApiUrl = EnvironmentConfig.gptApiUrl;
}
