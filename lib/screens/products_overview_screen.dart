import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/widgets/product_grid.dart';
import 'package:shop/widgets/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  const ProductOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        backgroundColor: theme.primaryColor,
      ),
      body: ProductGrid(),
    );
  }
}
