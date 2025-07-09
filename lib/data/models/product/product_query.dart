class ProductQuery {
  final String? category;
  final String? keyword;
  final int? minPrice;
  final int? maxPrice;
  final String? sortBy;

  const ProductQuery({
    this.category,
    this.keyword,
    this.minPrice,
    this.maxPrice,
    this.sortBy,
  });

  Map<String, dynamic> toJson() {
    return {
      if (category != null) 'category': category,
      if (keyword != null) 'keyword': keyword,
      if (minPrice != null) 'minPrice': minPrice,
      if (maxPrice != null) 'maxPrice': maxPrice,
      if (sortBy != null) 'sortBy': sortBy,
    };
  }
}
