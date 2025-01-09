```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  int retries = 3;
  while (retries > 0) {
    try {
      final response = await http.get(Uri.parse('https://api.example.com/data'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Error: API returned status code ${response.statusCode}');
        // Handle specific error codes if needed
        // For example:  if (response.statusCode == 404) { ... }
      }
    } on SocketException catch (e) {
      print('Network error: $e');
      retries--;
      await Future.delayed(Duration(seconds: 2)); // Wait before retrying
      if (retries == 0) {
        rethrow; // Re-throw the exception after all retries are exhausted
      }
    } on FormatException catch (e) {
      print('JSON decoding error: $e');
      rethrow; // Re-throw the exception
    } catch (e) {
      print('An unexpected error occurred: $e');
      rethrow; // Re-throw the exception
    }
  }
  return null;
}
```