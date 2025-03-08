class OpenWeatherMapAPI {
  OpenWeatherMapAPI(this.apiKey);
  final String apiKey;

  static const String _apiBaseUrl = "api.openweathermap.org";
  static const String _apiPath = "/data/2.5";

  Uri weather(String city) => _buildUri(
        endpoint: "weather",
        parameterBuilder: () => cityQueryParameters(city),
      );

  Uri forecast(String city) => _buildUri(
        endpoint: "forecast",
        parameterBuilder: () => cityQueryParameters(city),
      );

  Uri _buildUri({
    required String endpoint,
    required Map<String, dynamic> Function() parameterBuilder,
  }) {
    return Uri(
      scheme: "https",
      host: _apiBaseUrl,
      path: "$_apiPath$endpoint",
      queryParameters: parameterBuilder(),
    );
  }

  Map<String, dynamic> cityQueryParameters(String city) => {
        "q": city,
        "appid": apiKey,
        "units": "metric",
      };
}
