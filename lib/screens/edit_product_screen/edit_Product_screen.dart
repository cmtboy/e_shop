import 'package:e_shop/models/product_model.dart';
import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlControler = TextEditingController();
  final _imageFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct =
      Product(id: '', name: '', productDetails: '', price: 0.0, imgUrl: '');

  @override
  void initState() {
    _imageFocusNode.addListener(() {
      if (!_imageFocusNode.hasFocus) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _imageFocusNode.dispose();
    _priceFocusNode.dispose();
    _imageUrlControler.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    _form.currentState?.save();
    print(_editedProduct.id);
    print(_editedProduct.imgUrl);

    print(_editedProduct.productDetails);

    print(_editedProduct.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: const Icon(Icons.save),
          ),
        ],
        title: const Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  onSaved: (value) {
                    _editedProduct = Product(
                        id: _editedProduct.id,
                        name: value!,
                        productDetails: _editedProduct.productDetails,
                        price: _editedProduct.price,
                        imgUrl: _editedProduct.imgUrl);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                  onSaved: (value) {
                    _editedProduct = Product(
                        id: _editedProduct.id,
                        name: _editedProduct.name,
                        productDetails: _editedProduct.productDetails,
                        price: double.parse(value!),
                        imgUrl: _editedProduct.imgUrl);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  focusNode: _descriptionFocusNode,
                  onSaved: (value) {
                    _editedProduct = Product(
                        id: _editedProduct.id,
                        name: _editedProduct.name,
                        productDetails: value!,
                        price: _editedProduct.price,
                        imgUrl: _editedProduct.imgUrl);
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 8),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: _imageUrlControler.text.isEmpty
                          ? const Center(child: Text('Enter Image URL'))
                          : Container(
                              child: Image.asset(_imageUrlControler.text),
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        focusNode: _imageFocusNode,
                        controller: _imageUrlControler,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.url,
                        decoration:
                            const InputDecoration(labelText: 'Image Url'),
                        onSaved: (value) {
                          _editedProduct = Product(
                              id: _editedProduct.id,
                              name: _editedProduct.name,
                              productDetails: _editedProduct.productDetails,
                              price: _editedProduct.price,
                              imgUrl: value!);
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
