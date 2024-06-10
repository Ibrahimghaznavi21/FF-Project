import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_firstapplication/features/form_screen/provider/form_provider.dart';
import 'package:my_firstapplication/model_class.dart';
import 'package:my_firstapplication/utils/theme/color_class.dart';
import 'package:provider/provider.dart';

class SearchFilteredTextField extends StatefulWidget {
  final String labelText;
  final String field;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputformatters;
  final String hinttext;
  final TextInputType keyboard;
  final IconData iconData;


  SearchFilteredTextField({
    required this.labelText,
    required this.field,
    required this.controller,
    this.inputformatters,
    required this.hinttext,
    required this.keyboard,
    required this.iconData,

  });

  @override
  _SearchFilteredTextFieldState createState() =>
      _SearchFilteredTextFieldState();
}

class _SearchFilteredTextFieldState extends State<SearchFilteredTextField> {
  OverlayEntry? _overlayEntry;
  late FocusNode _focusNode;
  bool _isDropdownVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      _showDropdown();
    } else {
      _hideDropdown();
    }
  }

  void _showDropdown() {
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(
        builder: (context) {
          return Positioned(
            width: MediaQuery.of(context).size.width,
            child: Material(
              elevation: 4.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDropdownList(),
                ],
              ),
            ),
          );
        },
      );
      Overlay.of(context)?.insert(_overlayEntry!);
      _isDropdownVisible = true;
    }
  }

  Widget _buildDropdownList() {
    return Consumer<FormProvider>(
      builder: (context, formProvider, child) {
        List<ModelClass> filteredList = [];
        if (widget.field == 'id') {
          filteredList = formProvider.filteredPeople;
        } else if (widget.field == 'name') {
          filteredList = formProvider.filteredPeople
              .where((person) => person.name
                  .toLowerCase()
                  .contains(widget.controller.text.toLowerCase()))
              .toList();
        } else if (widget.field == 'department') {
          filteredList = formProvider.filteredPeople
              .where((person) => person.department
                  .toLowerCase()
                  .contains(widget.controller.text.toLowerCase()))
              .toList();
        }

        return ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: filteredList.map((modelClass) {
            return ListTile(
              title: Text(_getDisplayText(modelClass)),
              onTap: () {
                _selectItem(modelClass);
              },
            );
          }).toList(),
        );
      },
    );
  }

  String _getDisplayText(ModelClass modelClass) {
    if (widget.field == 'id') {
      return '${modelClass.id}';
    } else if (widget.field == 'name') {
      return '${modelClass.name}';
    } else if (widget.field == 'department') {
      return '${modelClass.department}';
    }
    return '';
  }

  void _selectItem(ModelClass modelClass) {
    Provider.of<FormProvider>(context, listen: false)
        .selectModelClass(modelClass);
    widget.controller.text = _getDisplayText(modelClass);
    _hideDropdown();
  }

  void _hideDropdown() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      _isDropdownVisible = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        inputFormatters: widget.inputformatters,
        keyboardType: widget.keyboard,
        cursorColor: ColorsClass.colorlightBlueAccent,
        style: const TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hinttext,
          fillColor: ColorsClass.colorwhite30,
          filled: true,
          prefixIcon: Icon(widget.iconData),
          suffixIcon: IconButton(
            icon: Icon(_isDropdownVisible
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down),
            onPressed: () {
              if (_isDropdownVisible) {
                _hideDropdown();
              } else {
                _showDropdown();
              }
            },
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorsClass.colorblack, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorsClass.colorblack, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorsClass.colorgrey, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value) {
          Provider.of<FormProvider>(context, listen: false)
              .filterPeople(value, widget.field);
        },
        onTap: () {
          _showDropdown();
        },
        onFieldSubmitted: (value) {
          Provider.of<FormProvider>(context, listen: false)
              .updateFieldsFromController(widget.field);
        },
      ),
    );
  }
}
