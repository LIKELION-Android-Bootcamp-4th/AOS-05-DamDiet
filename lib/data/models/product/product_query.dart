class ProductQuery {
  final String? category;
  final String? search;
  final int? minPrice;
  final int? maxPrice;
  final String? sortBy;

  const ProductQuery({
    this.category,
    this.search,
    this.minPrice,
    this.maxPrice,
    this.sortBy,
  });

  static const _noChange = Object();

  ProductQuery copyWith({
    Object? category = _noChange,
    Object? search = _noChange,
    Object? minPrice = _noChange,
    Object? maxPrice = _noChange,
    Object? sortBy = _noChange,
  }) {
    return ProductQuery(
      category: category == _noChange ? this.category : category as String?,
      search: search == _noChange ? this.search : search as String?,
      minPrice: minPrice == _noChange ? this.minPrice : minPrice as int?,
      maxPrice: maxPrice == _noChange ? this.maxPrice : maxPrice as int?,
      sortBy: sortBy == _noChange ? this.sortBy : sortBy as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      if (category != null) 'category': category,
      if (search != null) 'search': search,
      if (minPrice != null) 'minPrice': minPrice,
      if (maxPrice != null) 'maxPrice': maxPrice,
      if (sortBy != null) 'sortBy': sortBy,
    };
  }
}
