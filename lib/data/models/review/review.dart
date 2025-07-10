class Review {
  final String id;
  final String nickname;
  final String comment;
  final double rating;
  final List<String>? images;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.nickname,
    required this.comment,
    required this.rating,
    this.images,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    final user = json['user'] as Map<String, dynamic>?;

    final rawImages = json['images'];
    List<String> parsedImages = [];

    if (rawImages is List) {
      parsedImages = rawImages
          .whereType<Map>() // Map 타입만 필터링
          .map((e) => e['url']?.toString() ?? '')
          .where((url) => url.isNotEmpty)
          .toList();
    }

    return Review(
      id: json['id'] as String,
      nickname: user?['nickName'] as String? ?? '',
      comment: json['comment'] as String,
      rating: (json['rating'] as num).toDouble(),
      images: parsedImages,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': {
        'nickName': nickname,
      },
      'comment': comment,
      'rating': rating,
      'images': images,
      'timestamp': createdAt.toIso8601String(),
    };
  }
}

