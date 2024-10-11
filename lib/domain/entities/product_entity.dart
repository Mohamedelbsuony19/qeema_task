import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String title;
  final String price;
  final String description;
  final List<String> images;
  final String category;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
  });

  // Factory method to create a Product from JSON
  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['des'],
      images: List<String>.from(json['images']),
      category: json['category'],
    );
  }

  // Method to convert a Product to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'des': description,
      'images': images,
      'category': category,
    };
  }

  @override
  List<Object?> get props => [id, title, price, description, images, category];
}

