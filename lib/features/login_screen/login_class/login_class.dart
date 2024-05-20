
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_firstapplication/features/dashboard_screen/dashboard_class/dashboard_class.dart';
import 'package:my_firstapplication/features/login_screen/provider/login_provider.dart';
import 'package:my_firstapplication/features/login_screen/widgets/header_class.dart';
import 'package:my_firstapplication/features/login_screen/widgets/texfield_class.dart';
import 'package:my_firstapplication/utils/hive_services.dart';
import 'package:my_firstapplication/utils/theme/color_class.dart';
import 'package:provider/provider.dart';


import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _employeeId = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: ColorsClass.colorwhite,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: SizedBox(
                      width: constraints.maxWidth < 600
                          ? constraints.maxWidth * 0.8
                          : 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const HeaderCard(),

                          CustomTextfield(
                            obscureText: false,
                            iconData: Icons.people_outline,
                            hinttext: 'Type...',
                            labletext: 'Employee Id',
                            textEditingController: _employeeId,
                            keyboard: TextInputType.number,
                            inputformatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            Validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Employee Id';
                              } else if (value.length <= 3) {
                                return 'Write Id';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextfield(
                            textEditingController: _password,
                            Validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Password';
                              } else if (value.length <= 6) {
                                return 'Write Password';
                              }
                              return null;
                            },
                            obscureText: loginProvider.obscureText,
                            iconData: Icons.password_sharp,
                            hinttext: 'Type...',
                            labletext: 'Password',
                            keyboard: TextInputType.number,
                            suffixIcon: IconButton(
                              icon: Icon(loginProvider.obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                loginProvider.toggleObscureText();
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: ColorsClass.colorlightBlueAccent,
                              shadowColor: ColorsClass.colorblack,
                              elevation: 4,
                            ),
                            onPressed: () {
                              HiveService.setID(_employeeId.text);
                              HiveService.setpassword(_password.text);
                              print('Save Data: $HiveService');

                              if (_formKey.currentState?.validate() ?? false) {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const DashboardFFScreen()));
                              }
                            },
                            child: Text(
                              'Login',
                              style: GoogleFonts.aboreto(
                                  fontSize: 16, fontWeight: FontWeight.bold,color: ColorsClass.colorwhite
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
