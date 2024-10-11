import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qeema_task/domain/entities/product_entity.dart';
import 'package:qeema_task/presentation/widgets/product_body.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  ProductDetailScreenState createState() => ProductDetailScreenState();
}

class ProductDetailScreenState extends State<ProductDetailScreen> {
  late PageController _imageController;
  int _currentImage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _imageController = PageController(initialPage: 0);

    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentImage < widget.product.images.length - 1) {
        _currentImage++;
      } else {
        _currentImage = 0;
      }
      _imageController.animateToPage(
        _currentImage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(widget.product.title,
            style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: ProductBody(pageController: _imageController, widget: widget),
    );
  }
}
