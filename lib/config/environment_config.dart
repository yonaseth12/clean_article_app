import "package:flutter_dotenv/flutter_dotenv.dart";

class Environment {
  static String get apiKey => dotenv.env["NEWS_API_KEY"] ?? "No API Key";
}