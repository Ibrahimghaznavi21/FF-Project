import 'package:flutter/material.dart';
import 'package:my_firstapplication/required_model.dart';

class ItemProvider with ChangeNotifier {
  final List<Item> _items = [
    Item(ItemName: 'Iphone 15pro', AvailableQuantity: '8', UnitofMeasurment: 'Hour', Rate: '100.0', Total: ''),
    Item(ItemName: 'Zero AirPod', AvailableQuantity: '27', UnitofMeasurment: 'Hour', Rate: '200.0', Total: ''),
    Item(ItemName: 'Vivo', AvailableQuantity: '4', UnitofMeasurment: 'Hour', Rate: '150.0', Total: ''),
    Item(ItemName: 'Furniture', AvailableQuantity: '5', UnitofMeasurment: 'Hour', Rate: '300.0', Total: ''),
    Item(ItemName: 'Houses', AvailableQuantity: '2', UnitofMeasurment: 'Hour', Rate: '500.0', Total: ''),
    Item(ItemName: 'Laptop', AvailableQuantity: '12', UnitofMeasurment: 'Hour', Rate: '250.0', Total: ''),
  ];

  List<Item> get items => _items;

  Item? _selectedItem;
  int? _quantity;
  String? _remark;
  double? _total;

  Item? get selectedItem => _selectedItem;
  int? get quantity => _quantity;
  String? get remark => _remark;
  double? get total => _total;

  void selectItem(Item item) {
    _selectedItem = item;
    notifyListeners();
  }

  void setQuantity(int quantity) {
    _quantity = quantity;
    notifyListeners();
  }

  void setRemark(String remark) {
    _remark = remark;
    notifyListeners();
  }

  void clearSelection() {
    _selectedItem = null;
    _quantity = null;
    _remark = null;
    _total = null;
    notifyListeners();
  }

  bool get isFormValid => _selectedItem != null && _quantity != null;

  List<Map<String, dynamic>> _cart = [];

  List<Map<String, dynamic>> get cart => _cart;

  void addToCart() {
    if (isFormValid) {
      _cart.add({
        'item': _selectedItem,
        'quantity': _quantity,
        'remark': _remark,
      });
      clearSelection();
    }
  }

  void removeFromCart(int index) {
    _cart.removeAt(index);
    notifyListeners();
  }

  void saveData() {
    // Implement saving data logic here
  }

  void calculateTotal() {
    if (_selectedItem != null && _quantity != null) {
      _total = double.tryParse(_selectedItem!.Rate)! * _quantity!;
      notifyListeners();
    }
  }
}
