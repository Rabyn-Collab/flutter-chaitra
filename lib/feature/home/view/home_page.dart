import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/cart/view/controllers/cart_controller.dart';
import 'package:flutter_chaitra/feature/home/view/widgets/drawer.dart';
import 'package:flutter_chaitra/feature/products/view/products_list.dart';
import 'package:flutter_chaitra/feature/shared/user_state_controller.dart';
import 'package:flutter_chaitra/routes/route_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final userState = ref.watch(userStateControllerProvider);
              final cartState = ref.watch(cartControllerProvider);
              return userState.role == 'Admin'
                  ? SizedBox.shrink()
                  : Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.pushNamed(RouteEnum.cart.name);
                        },
                        icon: Icon(Icons.shopping_cart),
                      ),
                      if (cartState.isNotEmpty)
                        Positioned(
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 10,
                            child: Text(
                              '${cartState.length}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                    ],
                  );
            },
          ),
          IconButton(
            onPressed: () {
              context.pushNamed(RouteEnum.search.name);
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ProductsList(),
    );
  }
}
