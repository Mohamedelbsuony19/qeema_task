import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qeema_task/app/config/app_router.dart';
import 'package:qeema_task/presentation/blocs/product/product_bloc.dart';

import 'prdouct_card.dart';

class ItemsTab extends StatelessWidget {
  const ItemsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return state.maybeMap(
              orElse: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              loadSuccess: (value) {
                return ListView.builder(
                  itemCount: value.products?.length ??
                      0, 
                  itemBuilder: (context, index) {
                    return ListCard(
                      onTap: () {
                        context.push(
                          Routes.productDetails,
                          extra: {
                            'product': value.products?[index],
                          },
                        );
                      },
                      categoryName: value.products?[index].title ?? "",
                      description: value.products?[index].description ?? "",
                      price: value.products?[index].price ?? "",
                      title: value.products?[index].title ?? "",
                      imageUrl: value.products?[index].images.first ?? "",
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
