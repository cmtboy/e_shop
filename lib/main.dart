import 'package:e_shop/providers/cart_provider.dart';
import 'package:e_shop/providers/orders_provider.dart';
import 'package:e_shop/providers/product_provider.dart';
import 'package:e_shop/screens/edit_product_screen/edit_Product_screen.dart';
import 'package:e_shop/screens/manage_products/manage_screen.dart';
import 'package:e_shop/screens/order_screen/OrderScreen.dart';
import 'package:e_shop/screens/product_details/product_details_screen.dart';
import 'package:e_shop/screens/profile_screen/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen/HomeScreen.dart';
import 'screens/cart_screen/CartScreen.dart';
//eid mubarak
void main() {
  runApp(const EShop());
}

class EShop extends StatelessWidget {
  const EShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: ((context) => CartProvider()),
        ),
        ChangeNotifierProvider(create: (context) => OrderProvider())
      ],
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 5,
          backgroundColor: Colors.white,
        )),
        debugShowCheckedModeBanner: false,
        routes: {
          'ProductDetails': (context) => const ProductDetails(),
          'cartScreen': (context) => const CartScreen(),
          'OrderScreen': (context) => const OrderScreen(),
          'ManageScreen': (context) => const ManageScreen(),
          'EditProductScreen': (context) => const EditProductScreen(),
        },
        home: const MyBottomNavBar(),
      ),
    );
  }
}

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const CartScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];

  //Implementing Bottom Navigation Bar

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 1,
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                ),
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.shopping_cart),
                icon: Icon(Icons.shopping_cart_outlined),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_shipping_outlined),
                  activeIcon: Icon(
                    Icons.local_shipping,
                  ),
                  label: "Orders"),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.account_circle),
                icon: Icon(Icons.account_circle_outlined),
                label: "Account",
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            }),
      ),
    );
  }
}
