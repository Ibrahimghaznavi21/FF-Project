import 'package:flutter/material.dart';
import 'package:my_firstapplication/features/form_screen/provider/required_provider.dart';
import 'package:my_firstapplication/features/pending_approval/pending_screen/pending_class.dart';
import 'package:my_firstapplication/required_model.dart';
import 'package:provider/provider.dart';

class ItemLists extends StatelessWidget {
  const ItemLists({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ItemProvider>(context).cart;

    return AlertDialog(
      title: const Text('Cart Items'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: cart.asMap().entries.map((entry) {
          final index = entry.key;
          final itemData = entry.value;
          final item = itemData['item'] as Item;
          final quantity = itemData['quantity'];
          final remark = itemData['remark'];

          return ListTile(
            title: Text(item.ItemName),
            subtitle: Text('Quantity: $quantity, Remark: $remark'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                Provider.of<ItemProvider>(context, listen: false)
                    .removeFromCart(index);
              },
            ),
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<ItemProvider>(context, listen: false).saveData();
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
