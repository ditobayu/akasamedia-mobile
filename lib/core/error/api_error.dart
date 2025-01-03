class ApiError extends Error {
  final String message;
  //status code
  final int statusCode;

  ApiError({required this.message, required this.statusCode});

  @override
  String toString() {
    return 'ApiError: $message';
  }
}
