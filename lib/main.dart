

import 'package:flutter/material.dart';
import 'package:my_firstapplication/features/form_screen/provider/form_provider.dart';
import 'package:my_firstapplication/features/form_screen/provider/required_provider.dart';
import 'package:my_firstapplication/features/login_screen/login_class/login_class.dart';
import 'package:my_firstapplication/features/login_screen/provider/login_provider.dart';
import 'package:my_firstapplication/utils/hive_services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => FormProvider()),
  ChangeNotifierProvider(
  create: (context) => ItemProvider())

      ],
    child: const SteelFF(),
  ));
}

class SteelFF extends StatelessWidget {
  const SteelFF({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
