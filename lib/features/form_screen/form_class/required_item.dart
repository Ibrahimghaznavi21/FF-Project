import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_firstapplication/features/form_screen/widgets/filtered_textclass.dart';
import 'package:my_firstapplication/features/form_screen/widgets/textfield_class.dart';
import 'package:my_firstapplication/utils/theme/color_class.dart';

class RequiredItems extends StatefulWidget {
  const RequiredItems({super.key});

  @override
  State<RequiredItems> createState() => _RequiredItemsState();
}

class _RequiredItemsState extends State<RequiredItems> {
  final TextEditingController requiredQuantityController =
      TextEditingController();
  bool isAddToCartButtonVisible = false;

  @override
  void initState() {
    super.initState();
    requiredQuantityController.addListener(_validateRequiredQuantity);
  }

  @override
  void dispose() {
    requiredQuantityController.removeListener(_validateRequiredQuantity);
    requiredQuantityController.dispose();
    super.dispose();
  }

  void _validateRequiredQuantity() {
    setState(() {
      isAddToCartButtonVisible = requiredQuantityController.text.isNotEmpty;
    });
  }

  void _addToCart() {
    // Add to cart functionality
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsClass.colorwhite,
      appBar: AppBar(
        actions: [
          TextButton(onPressed: () {}, child: Text('Validate')),
          IconButton(
            onPressed: (){
    _addToCart;
    },
            icon: Icon(Icons.add_shopping_cart),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.save)),
        ],
        iconTheme: const IconThemeData(color: ColorsClass.colorwhite),
        title: Text(
          'Required Items',
          style: GoogleFonts.albertSans(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: ColorsClass.colorwhite,
          ),
        ),
        backgroundColor: ColorsClass.colororangeAccent,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth > 600;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: isWideScreen ? 600 : double.infinity),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SearchFilteredTextField(
                        labelText: 'Item Name',
                        field: 'name',
                        controller: TextEditingController(),
                        hinttext: 'Type...',
                        keyboard: TextInputType.text,
                        iconData: CupertinoIcons.shopping_cart,
                      ),
                      SimpleTextField(
                        labelText: 'Available Quantity',
                        controller: TextEditingController(),
                        iconData: Icons.production_quantity_limits_sharp,
                        hinttext: 'Type...',
                        readonly: true,
                        keyboard: TextInputType.number,
                        inputformatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                      SimpleTextField(
                        labelText: 'Unit Of Measurement',
                        controller: TextEditingController(),
                        iconData: Icons.medical_information_outlined,
                        hinttext: 'Type...',
                        readonly: true,
                        keyboard: TextInputType.text,
                      ),
                      SimpleTextField(
                        readonly: false,
                        labelText: 'Required Quantity',
                        controller: requiredQuantityController,
                        iconData: Icons.domain_add_sharp,
                        inputformatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboard: TextInputType.number,
                        hinttext: 'Type...',
                      ),
                      SimpleTextField(
                        labelText: 'Rate',
                        controller: TextEditingController(),
                        iconData: Icons.rate_review_outlined,
                        hinttext: 'Type...',
                        readonly: true,
                        keyboard: TextInputType.number,
                      ),
                      SimpleTextField(
                        labelText: 'Total',
                        controller: TextEditingController(),
                        iconData: Icons.money,
                        hinttext: 'Type...',
                        readonly: true,
                        keyboard: TextInputType.number,
                      ),
                      SimpleTextField(
                        readonly: false,
                        labelText: 'General Remarks',
                        controller: TextEditingController(),
                        iconData: Icons.generating_tokens_sharp,
                        hinttext: 'Type...',
                        keyboard: TextInputType.text,
                      ),
                      if (isAddToCartButtonVisible)
                        ElevatedButton.icon(
                          onPressed: () {
                            _addToCart;
                          },
                          icon: Icon(Icons.add_shopping_cart),
                          label: Text('Add to Cart'),
                          style: ElevatedButton.styleFrom(
                            shadowColor: ColorsClass.colororangeAccent,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
