// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      inStock: json['inStock'] as bool,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'inStock': instance.inStock,
    };
