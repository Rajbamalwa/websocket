import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CoinbaseResponse {
  final String price;
  @JsonKey(name: 'product_id')
  final String productId;

  CoinbaseResponse(this.price, this.productId);

  factory CoinbaseResponse.fromJson(Map<String, dynamic> json) =>
      _$CoinbaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoinbaseResponseToJson(this);
}
////////////////////////////////////////////////////////////////////////////////////////////
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinbaseResponse _$CoinbaseResponseFromJson(Map<String, dynamic> json) =>
    CoinbaseResponse(
      json['price'] as String,
      json['product_id'] as String,
    );

Map<String, dynamic> _$CoinbaseResponseToJson(CoinbaseResponse instance) =>
    <String, dynamic>{
      'price': instance.price,
      'product_id': instance.productId,
    };
