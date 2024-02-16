import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/widgets/product_grid.dart';
import '../widgets/badge.dart';

import '../providers/products_providers.dart';

enum FilterOptions { favorites, all }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavOnly = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.favorites) {
                    _showFavOnly = true;
                  }
                  if (selectedValue == FilterOptions.all) {
                    _showFavOnly = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: FilterOptions.favorites,
                      child: Text('Only Favorites'),
                    ),
                    const PopupMenuItem(
                        value: FilterOptions.all,
                        child: Text('Show All')),
                  ]),
          Consumer<Cart>(
            builder: (_, cartData, c) => Badges(
                value: cartData.itemCount.toString(),
                child: IconButton(
                  icon: const Icon(
                      Icons.shopping_cart
                  ),
                  onPressed: () {  },
                ),

              ),
          )
        ],
        backgroundColor: theme.primaryColor,
      ),
      body: ProductGrid(
        showFav: _showFavOnly,
      ),
    );
  }
}
