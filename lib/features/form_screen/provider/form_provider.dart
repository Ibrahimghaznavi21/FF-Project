import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:my_firstapplication/model_class.dart';

class FormProvider with ChangeNotifier {
  List<ModelClass> _people = [];
  List<ModelClass> _filteredPeople = [];
  ModelClass? _selectedModelClass;

  final TextEditingController searchIdController = TextEditingController();
  final TextEditingController searchNameController = TextEditingController();
  final TextEditingController searchDepartmentController =
      TextEditingController();
  final TextEditingController simpleField1Controller = TextEditingController();
  final TextEditingController simpleField2Controller = TextEditingController();

  List<ModelClass> get filteredPeople => _filteredPeople;
  ModelClass? get selectedModelClass => _selectedModelClass;

  FormProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    final String response = await rootBundle.loadString('assets/people.json');
    final List<dynamic> data = json.decode(response);
    _people = data.map((json) => ModelClass.fromJson(json)).toList();
    _filteredPeople = _people;
    notifyListeners();
  }

  void filterPeople(String query, String field) {
    _filteredPeople = _people.where((modelClass) {
      return field == 'id'
          ? modelClass.id.toString().contains(query)
          : field == 'name'
              ? modelClass.name.toLowerCase().contains(query.toLowerCase())
              : false;
    }).toList();
    notifyListeners();
  }

  void selectModelClass(ModelClass modelClass) {
    _selectedModelClass = modelClass;
    searchIdController.text = modelClass.id.toString();
    searchNameController.text = modelClass.name;
    _filteredPeople.clear();
    notifyListeners();
  }

  void updateFieldsFromController(String field) {
    if (field == 'id' && searchIdController.text.isNotEmpty) {
      final id = int.tryParse(searchIdController.text);
      final match = _people.firstWhere((model) => model.id == id,
          orElse: () => ModelClass(id: 0, name: '', department: ''));
      if (match.id != 0) {
        selectModelClass(match);
      }
    } else if (field == 'name' && searchNameController.text.isNotEmpty) {
      final match = _people.firstWhere(
          (model) =>
              model.name.toLowerCase() ==
              searchNameController.text.toLowerCase(),
          orElse: () => ModelClass(id: 0, name: '', department: ''));
      if (match.id != 0) {
        selectModelClass(match);
      }
    }
  }

  bool get isFormValid {
    return searchIdController.text.isNotEmpty &&
        searchNameController.text.isNotEmpty;
  }
}
