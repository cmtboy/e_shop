import 'package:e_shop/providers/orders_provider.dart';
import 'package:flutter/material.dart';

class OrderScreenCard extends StatefulWidget {
  const OrderScreenCard({required this.items, Key? key}) : super(key: key);
  final Order items;

  @override
  State<OrderScreenCard> createState() => _OrderScreenCardState();
}

class _OrderScreenCardState extends State<OrderScreenCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title:
                Text('Total Amount: ${widget.items.amount.toStringAsFixed(2)}'),
            subtitle: Text(
                'Date: ${widget.items.dateTime.day}/${widget.items.dateTime.month}/${widget.items.dateTime.year} Time: ${widget.items.dateTime.hour}:${widget.items.dateTime.minute}'),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              icon: _isExpanded
                  ? Icon(Icons.expand_less)
                  : Icon(Icons.expand_more),
            ),
          ),
          if (_isExpanded)
            Container(
              height: (widget.items.products.length * 20).toDouble(),
              child: ListView.builder(
                itemCount: widget.items.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(widget.items.products[index].title),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                            '${widget.items.products[index].price} x ${widget.items.products[index].quantity}'),
                      )
                    ],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
