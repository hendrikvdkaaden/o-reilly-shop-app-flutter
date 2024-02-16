import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/order_tile_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  static const routeName = "/orders";

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderTileItem(order: orderData.orders[i]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
