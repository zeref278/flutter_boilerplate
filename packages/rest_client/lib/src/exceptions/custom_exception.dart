class CustomException implements Exception {
  CustomException();

  /// TODO: implement your exception from json
  CustomException.fromJson(Map<String, dynamic> json);

  /// TODO: implement your message
  @override
  String toString() {
    return 'CustomException';
  }
}
