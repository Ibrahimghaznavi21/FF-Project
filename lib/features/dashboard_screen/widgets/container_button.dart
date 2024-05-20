import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_firstapplication/utils/theme/color_class.dart';

class ButtonCard extends StatefulWidget {
  final String title;
  final Function onTap;
  final IconData icon;

  const ButtonCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  State<ButtonCard> createState() => _ButtonCardState();
}

class _ButtonCardState extends State<ButtonCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap as void Function()?,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: ColorsClass.colorwhite,
            boxShadow: const [
              BoxShadow(
                color: ColorsClass.colorgrey,
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    backgroundColor: ColorsClass.colorbluegrey,
                    radius: 25,
                    child: Icon(
                      widget.icon,
                      color: ColorsClass.colorwhite,
                    ),
                  ),
                ),
                Text(
                  widget.title,
                  style: GoogleFonts.aladin(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
