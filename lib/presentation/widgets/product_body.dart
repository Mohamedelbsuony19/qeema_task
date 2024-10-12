import 'package:flutter/material.dart';
import 'package:qeema_task/presentation/screens/product_details_screen.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({
    super.key,
    required PageController pageController,
    required this.widget,
  }) : _pageController = pageController;

  final PageController _pageController;
  final ProductDetailScreen widget;

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.product.images.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(widget.product.images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.product.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Category: ${widget.product.category}',
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 32, 17, 17),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.product.description,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              '\$${widget.product.price}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
