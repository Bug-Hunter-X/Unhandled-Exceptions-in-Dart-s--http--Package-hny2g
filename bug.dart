```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success, process the JSON data
      final jsonData = jsonDecode(response.body);
      // ... further processing ...
    } else {
      // Handle error responses
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions (e.g., network errors)
    print('Error fetching data: $e');
    // Re-throw the exception to be handled by calling function.
    rethrow;
  }
}
```