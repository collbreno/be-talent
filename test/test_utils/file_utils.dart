import 'dart:convert';
import 'dart:io';

class FileUtils {
  static Future<dynamic> loadJson(String filePath) async {
    final file = File('test/assets/$filePath');
    final jsonString = await file.readAsString();
    return json.decode(jsonString);
  }
}
