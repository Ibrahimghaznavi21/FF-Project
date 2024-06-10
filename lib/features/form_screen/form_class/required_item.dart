import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_firstapplication/required_model.dart';
import 'package:provider/provider.dart';
import 'package:my_firstapplication/utils/theme/color_class.dart';
import 'package:my_firstapplication/features/form_screen/provider/required_provider.dart';
import 'package:my_firstapplication/features/form_screen/widgets/filtered_textclass.dart';
import 'package:my_firstapplication/features/form_screen/widgets/required_dclass.dart';
import 'package:badges/badges.dart' as badges;

class RequiredItems extends StatefulWidget {
  const RequiredItems({super.key});

  @override
  State<RequiredItems> createState() => _RequiredItemsState();
}

class _RequiredItemsState extends State<RequiredItems> {
  Future<bool> _onWillPop() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to go back?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsClass.colororangeAccent,
          title: const Text('Required Item'),
          actions: [
            Consumer<ItemProvider>(
              builder: (context, provider, child) {
                return badges.Badge(
                  showBadge: provider.cart.isNotEmpty,
                  badgeContent: Text(
                    provider.cart.length.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const ItemLists(),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                DropdownButtonFormField<Item>(
                  hint: const Text('Select When You Required'),
                  items: Provider.of<ItemProvider>(context)
                      .items
                      .map((item) => DropdownMenuItem<Item>(
                            value: item,
                            child: Text(item.ItemName),
                          ))
                      .toList(),
                  onChanged: (item) {
                    if (item != null) {
                      Provider.of<ItemProvider>(context, listen: false)
                          .selectItem(item);
                    }
                  },
                ),
                Consumer<ItemProvider>(
                  builder: (context, provider, child) {
                    final selectedItem = provider.selectedItem;
                    return selectedItem != null
                        ? SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                TextFormField(
                                  readOnly: true,
                                  initialValue: selectedItem.ItemName,
                                  decoration: const InputDecoration(
                                    labelText: 'Item Name',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                TextFormField(
                                  readOnly: true,
                                  initialValue: selectedItem.AvailableQuantity,
                                  decoration: const InputDecoration(
                                    labelText: 'Available Quantity',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                TextFormField(
                                  readOnly: true,
                                  initialValue: selectedItem.UnitofMeasurment,
                                  decoration: const InputDecoration(
                                    labelText: 'Unit of Measurement',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Required Quantity',
                                    border: OutlineInputBorder(),
                                    hintText: 'Type...',
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  onChanged: (value) {
                                    final quantity = int.tryParse(value);
                                    if (quantity != null) {
                                      provider.setQuantity(quantity);
                                      provider.calculateTotal();
                                    }
                                  },
                                ),
                                const SizedBox(height: 8.0),
                                TextFormField(
                                  readOnly: true,
                                  initialValue: selectedItem.Rate,
                                  decoration: const InputDecoration(
                                    labelText: 'Rate',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                TextFormField(
                                  readOnly: true,
                                  initialValue:
                                      provider.total?.toString() ?? '',
                                  decoration: const InputDecoration(
                                    labelText: 'Total',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Remark',
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    provider.setRemark(value);
                                  },
                                ),
                                const SizedBox(height: 8.0),
                                ElevatedButton(
                                  onPressed: provider.isFormValid
                                      ? provider.addToCart
                                      : null,
                                  child: const Text('Add to Cart'),
                                ),
                              ],
                            ),
                          )
                        : Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
