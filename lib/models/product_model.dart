import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  String name;
  double price;
  bool inStock;
  Product({
    required this.name,
    required this.price,
    required this.inStock,
  });

  factory Product.fromJson(dynamic json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }
}
