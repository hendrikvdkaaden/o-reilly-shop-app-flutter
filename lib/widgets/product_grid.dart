import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_providers.dart';
import 'package:shop/widgets/product_item.dart';

import '../providers/product.dart';

class ProductGrid extends StatelessWidget {
  final bool showFav;

  const ProductGrid({super.key, required this.showFav});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = showFav ? productData.favoriteItems :productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
      ),
      itemCount: products.length,
    );
  }
}
