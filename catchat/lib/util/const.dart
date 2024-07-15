class EnvironmentConfig {
  static const String developmentUrl =
      'https://dev.api.openai.com/v1/engines/davinci-codex/completions';
  static const String productionUrl =
      'https://api.openai.com/v1/engines/davinci-codex/completions';
  static const String stagingUrl =
      'https://staging.api.openai.com/v1/engines/davinci-codex/completions';

  static String getUrl(Environment environment) {
    switch (environment) {
      case Environment.development:
        return developmentUrl;
      case Environment.production:
        return productionUrl;
      case Environment.staging:
        return stagingUrl;
      default:
        return productionUrl;
    }
  }
}

enum Environment { development, production, staging }
