import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;
  final DateTime creationAt;
  final DateTime updatedAt;
  final Category category;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });

  // Factory method to create a Product from JSON
  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      images: List<String>.from(json['images']),
      creationAt: DateTime.parse(json['creationAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      category: Category.fromJson(json['category']),
    );
  }

  // Method to convert a Product to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'images': images,
      'creationAt': creationAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'category': category.toJson(),
    };
  }

  @override
  List<Object?> get props =>
      [id, title, price, description, images, creationAt, updatedAt, category];
}

class Category extends Equatable {
  final int id;
  final String name;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  const Category({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  // Factory method to create a Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      creationAt: DateTime.parse(json['creationAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  // Method to convert a Category to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'creationAt': creationAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id, name, image, creationAt, updatedAt];
}
