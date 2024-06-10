import 'package:flutter/material.dart';
import 'package:my_firstapplication/features/form_screen/provider/required_provider.dart';
import 'package:my_firstapplication/required_model.dart';
import 'package:provider/provider.dart';

class PendingApprovalScreen extends StatelessWidget {
  const PendingApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ItemProvider>(context).cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: cart.map((itemData) {
            final item = itemData['item'] as Item;
            final quantity = itemData['quantity'];
            final remark = itemData['remark'];

            return Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Item: ${item.ItemName}'),
                  Text('Quantity: $quantity'),
                  Text('Remark: $remark'),
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {
                        // Show the saved data in a dialog or a new screen
                      },
                      child: const Text('Show Details'),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}