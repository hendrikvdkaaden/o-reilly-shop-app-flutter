import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_providers.dart';
import 'package:shop/widgets/product_item.dart';

import '../models/product.dart';

class ProductGrid extends StatelessWidget {

  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => ProductItem(
          id: products[i].id,
          title: products[i].title,
          imageUrl: products[i].imageUrl),
      itemCount: products.length,
    );
  }
}
