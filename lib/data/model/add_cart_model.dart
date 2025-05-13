import 'dart:convert';
import 'package:equatable/equatable.dart';

class Carting extends Equatable {
  final int id;
  final String title;
  final String price;
  final String ratings;
  final String image;
  final int size;
  final int totalAmount;
  const Carting(
      {required this.id,
      required this.title,
      required this.price,
      required this.ratings,
      required this.image,
      required this.size,
      required this.totalAmount});

  Carting copyWith({
    int? id,
    String? title,
    String? price,
    String? ratings,
    String? image,
    int? size,
    int? totalAmount,
  }) {
    return Carting(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      ratings: ratings ?? this.ratings,
      image: image ?? this.image,
      size: size ?? this.size,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'ratings': ratings,
      'image': image,
      'size': size,
      'totalAmount': totalAmount,
    };
  }

  factory Carting.fromMap(Map<String, dynamic> map) {
    return Carting(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as String,
      ratings: map['ratings'] as String,
      image: map['image'] as String,
      size: map['size'] as int,
      totalAmount: map['totalAmount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Carting.fromJson(String source) =>
      Carting.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [id, title, image, ratings, size, price];
}
