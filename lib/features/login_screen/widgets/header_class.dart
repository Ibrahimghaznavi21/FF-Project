import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_firstapplication/utils/theme/color_class.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageSize;
    if (screenWidth > 1200) {
      imageSize = 120;
    } else if (screenWidth > 800) {
      imageSize = 100;
    } else {
      imageSize = 80;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            height: imageSize,
            width: imageSize,
            image: const AssetImage('assets/image/FFLogo.png'),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome To',
                style: GoogleFonts.albertSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorsClass.colorlightBlueAccent,
                ),
              ),
              Text(
                'FF Store',
                style: GoogleFonts.albertSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorsClass.colororangeAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
