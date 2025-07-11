class ApiResponse<T> {
  final bool success;
  final String message;
  final String? error;
  final T data;

  ApiResponse({
    required this.success,
    required this.message,
    required this.data,
    this.error,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) {

    return ApiResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      error: json['error'],
      data: json['data'] != null
          ? fromJsonT(json['data'])
          : fromJsonT({}),
    );
  }
}


