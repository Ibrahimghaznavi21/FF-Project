import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_firstapplication/features/dashboard_screen/widgets/large_screen.dart';
import 'package:my_firstapplication/features/dashboard_screen/widgets/medium_screen.dart';
import 'package:my_firstapplication/features/dashboard_screen/widgets/small_screen.dart';
import 'package:my_firstapplication/utils/theme/color_class.dart';

class DashboardFFScreen extends StatefulWidget {
  const DashboardFFScreen({super.key});

  @override
  State<DashboardFFScreen> createState() => _DashboardFFScreenState();
}

class _DashboardFFScreenState extends State<DashboardFFScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      drawer: const Drawer(
        backgroundColor: ColorsClass.colorwhite,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Ibrahim'),
              accountEmail: Text('ibrahimghaznavi001@gmail.com'),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return const LargeScreen();
          } else if (constraints.maxWidth > 700) {
            return const MediumScreen();
          } else {
            return const SmallScreen();
          }
        },
      ),
    );
  }
}
