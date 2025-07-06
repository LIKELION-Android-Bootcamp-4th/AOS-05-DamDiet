class Image {
  final String id;
  final String originalName;
  final String url;
  final String mimeType;
  final int size;

  Image({
    required this.id,
    required this.originalName,
    required this.url,
    required this.mimeType,
    required this.size,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['id'] as String,
      originalName: json['originalName'] as String,
      url: json['url'] as String,
      mimeType: json['mimeType'] as String,
      size: json['size'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'originalName': originalName,
      'url': url,
      'mimeType': mimeType,
      'size': size,
    };
  }
}
