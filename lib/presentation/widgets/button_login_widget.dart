import 'package:application_edspert/core/themes/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonLoginWidget extends StatelessWidget {
  final Color bgColor;
  final String image;
  final String text;
  final Color textColor;
  final Color borderColor;
  final Function onTap;

  const ButtonLoginWidget({
    super.key,
    required this.bgColor,
    required this.image,
    required this.text,
    required this.textColor,
    required this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: 42.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.15),
            offset: const Offset(0, 18),
            blurRadius: 40,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(
              color: borderColor,
              width: 1,
            ),
          ),
          backgroundColor: bgColor,
        ),
        onPressed: () {
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(width: 20.w),
            Text(
              text,
              style: AppFonts.appFont.titleMedium!.copyWith(
                color: textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
