import 'package:e_shop/screens/history_screen/HistoryScreen.dart';
import 'package:e_shop/screens/profile_screen/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen/HomeScreen.dart';
import 'screens/cart_screen/CartScreen.dart';

void main() {
  runApp(const EShop());
}

class EShop extends StatelessWidget {
  const EShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 5,
        backgroundColor: Colors.white,
      )),
      debugShowCheckedModeBanner: false,
      home: MyBottomNavBar(),
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

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HistoryScreen(),
    CartScreen(),
    ProfileScreen(),
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
                  icon: Icon(Icons.history_outlined),
                  activeIcon: Icon(
                    Icons.history,
                  ),
                  label: "History"),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.add_shopping_cart),
                icon: Icon(Icons.add_shopping_cart_outlined),
                label: "Cart",
              ),
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
