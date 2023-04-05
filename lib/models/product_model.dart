class ProductModel {
  final String image;
  final String title;
  final double rating;
  final int order;
  final dynamic price;
  final int? ind;

  ProductModel(
      {this.ind,
      required this.image,
      required this.title,
      required this.rating,
      required this.order,
      required this.price});
}
