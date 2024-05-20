
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:my_firstapplication/features/form_screen/form_class/required_item.dart';
import 'package:my_firstapplication/features/form_screen/provider/form_provider.dart';
import 'package:my_firstapplication/features/form_screen/widgets/filtered_textclass.dart';
import 'package:my_firstapplication/features/form_screen/widgets/textfield_class.dart';
import 'package:my_firstapplication/utils/theme/color_class.dart';
import 'package:provider/provider.dart';

class FFFormScreen extends StatelessWidget {
  const FFFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormProvider(),
      child: Scaffold(
        backgroundColor: ColorsClass.colorwhite,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: ColorsClass.colorwhite),
          title: Text(
            'Dashboard',
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
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Consumer<FormProvider>(
                    builder: (context, formProvider, child) {
                      bool isIdValid =
                          formProvider.searchIdController.text.isNotEmpty;
                      bool isNameValid =
                          formProvider.searchNameController.text.isNotEmpty;
                      bool isDepartmentValid = formProvider
                          .searchDepartmentController.text.isNotEmpty;

                      bool isFormValid =
                          isIdValid && isNameValid && isDepartmentValid;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SearchFilteredTextField(

                            inputformatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            labelText: 'Receiver ID(وصول کنندہ آئی ڈی)',
                            hinttext: 'Type...',
                            field: 'id',
                            controller: formProvider.searchIdController,
                            keyboard: TextInputType.number,
                            iconData: Icons.numbers_sharp,
                          ),
                          SearchFilteredTextField(

                            labelText: 'Receiver Name(وصول کنندہ کا نام)',
                            hinttext: 'Type...',
                            field: 'name',
                            controller: formProvider.searchNameController,
                            keyboard: TextInputType.text,
                            iconData: Icons.nest_cam_wired_stand_outlined,
                          ),
                          SearchFilteredTextField(

                            keyboard: TextInputType.text,
                            labelText: 'Department',
                            hinttext: 'Type...',
                            field: 'department',
                            controller: formProvider.searchDepartmentController,
                            iconData: Icons.local_fire_department_outlined,
                          ),
                          SimpleTextField(
                            readonly: false,
                            keyboard: TextInputType.text,
                            labelText: 'Place',
                            hinttext: 'Type..',
                            iconData: Icons.type_specimen_outlined,
                            controller: formProvider.simpleField1Controller,
                          ),
                          SimpleTextField(
                            readonly: false,
                            keyboard: TextInputType.text,
                            labelText: 'General Remarks(عام تبصرہ)',
                            hinttext: 'Type...',
                            iconData: Icons.generating_tokens_sharp,
                            controller: formProvider.simpleField2Controller,
                          ),
                          if (isFormValid)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 15),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor:
                                      ColorsClass.colorlightBlueAccent,
                                  shadowColor: ColorsClass.colorblack,
                                  elevation: 4,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RequiredItems()),
                                  );
                                },
                                child: Text(
                                  'Submit',
                                  style: GoogleFonts.aboreto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsClass.colorwhite,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
