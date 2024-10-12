import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qeema_task/app/config/app_router.dart';

import '../../domain/entities/product_entity.dart';
import 'prdouct_card.dart';

class ItemsTab extends StatelessWidget {
  const ItemsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('products').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No products found.'));
            }

            final products = snapshot.data!.docs.map((doc) {
              return ProductEntity.fromJson(doc.data() as Map<String, dynamic>);
            }).toList();

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  onTap: () {
                    context.push(
                      Routes.productDetails,
                      extra: {'product': product},
                    );
                  },
                  categoryName: product.category,
                  description: product.description,
                  price: product.price,
                  title: product.title,
                  imageUrl: product.images.first,
                );
              },
            );
          },
        );
      },
    );
  }
}
