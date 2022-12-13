import 'package:e_shop/models/product_model.dart';
import 'package:e_shop/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  var isloading = false;
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

  Future<void> _saveForm() async {
    setState(() {
      isloading = true;
    });
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      Navigator.of(context).pop();
      return;
    }
    _form.currentState?.save();
    try {
      await Provider.of<ProductProvider>(context, listen: false)
          .addProduct(_editedProduct);
    } catch (error) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("an error occur"),
                content: const Text("something went wrong"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok"))
                ],
              ));
    }
finally{
  // (_) {
      setState(() {
        isloading = false;
      });
      Navigator.of(context).pop();
    // };
}
  

    // Navigator.of(context).pop();
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
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter the title';
                          }
                          return null;
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
                          FocusScope.of(context)
                              .requestFocus(_descriptionFocusNode);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the price';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          if (double.parse(value) < 0) {
                            return 'Price must be >0';
                          }
                          return null;
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
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        focusNode: _descriptionFocusNode,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a description';
                          }
                          if (value.length < 10) {
                            return 'Write a longer description';
                          }
                          return null;
                        },
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter a valid URL';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _editedProduct = Product(
                                    id: _editedProduct.id,
                                    name: _editedProduct.name,
                                    productDetails:
                                        _editedProduct.productDetails,
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
