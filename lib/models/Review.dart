class Review {
  final String id;
  final String nickname;
  final String comment;
  final int rating;
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
    return Review(
      id: json['_id'] as String,
      nickname: json['nickname'] as String,
      comment: json['comment'] as String,
      rating: json['rating'] as int,
      images: json['images'] != null
          ? List<String>.from(json['images'] as List)
          : null,
      createdAt: DateTime.parse(json['timestamp'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'nickname': nickname,
      'comment': comment,
      'rating': rating,
      'images': images,
      'timestamp': createdAt.toIso8601String(),
    };
  }
}

