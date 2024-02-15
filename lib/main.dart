import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_providers.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.purple,
          canvasColor: Colors.deepOrange,
          fontFamily: 'Lato'
        ),
        home: const ProductOverviewScreen(),
        routes: {ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        }
      ),
    );
  }
}
