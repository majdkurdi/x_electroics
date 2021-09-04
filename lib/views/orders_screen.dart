import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/orders_controller.dart';
import '../modals/order.dart';
import '../widgets/order_card.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final ordersController = Get.find<OrdersController>();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    ordersController.updateOrders().then((_) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    ordersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Order> orders = ordersController.orders;
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
        ),
        body: loading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    if (orders.isEmpty)
                      Center(
                        child: Text('There is no Orders to show.'),
                      ),
                    ListView.builder(
                      itemBuilder: (ctx, i) => OrderCard(orders[i]),
                      itemCount: orders.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  ],
                ),
              ));
  }
}
