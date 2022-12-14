import 'package:e_shop/providers/product_provider.dart';
import 'package:e_shop/screens/home_screen/product_widget.dart';
import 'package:e_shop/widgets/cart_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_shop/providers/cart_provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    var _isInit = true;
    var _isLoading = false;
  @override
  void initState() {
    //  Provider.of<Products>(context).fatchAndsetProducts();
    super.initState();
   
  }
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ProductProvider>(context).fatchAndsetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }
Future<void> _productRefresh (BuildContext context)async{
      await Provider.of<ProductProvider>(context,listen: false).fatchAndsetProducts();

  }

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<ProductProvider>(context).getProducts();
    var cartInfo = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          CartIconButton(
            totalAddedItem: cartInfo.itemCount.toString(),
          )
        ],
      ),
      body: _isLoading?const Center(child:CircularProgressIndicator()) :RefreshIndicator(
        onRefresh: () => _productRefresh(context),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 2.7,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => HomeProduct(
                id: products[index].id,
                productImage: products[index].imgUrl,
                productName: products[index].name,
                productPrice: products[index].price),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'ManageScreen');
          },
          child: const Icon(Icons.settings)),
    );
  }
}
