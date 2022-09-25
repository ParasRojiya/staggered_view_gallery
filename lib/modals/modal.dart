class Photos {
  final String category;
  final String image;
  final int crossAxisCellCount;
  final int mainAxisCellCount;
  final List images;

  Photos({
    required this.category,
    required this.image,
    required this.crossAxisCellCount,
    required this.mainAxisCellCount,
    required this.images,
  });

  factory Photos.fromJSON(Map json) {
    return Photos(
      category: json['category'],
      image: json['image'],
      crossAxisCellCount: json['crossAxisCellCount'],
      mainAxisCellCount: json['mainAxisCellCount'],
      images: json['images'],
    );
  }
}
