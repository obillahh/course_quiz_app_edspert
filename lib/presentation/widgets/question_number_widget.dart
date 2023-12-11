import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:application_edspert/core/themes/app_colors.dart';
import 'package:application_edspert/core/themes/app_grayscale.dart';

class QuestionNumberWidget extends StatelessWidget {
  final int index;
  final bool isSelected = false;
  final VoidCallback onTap;
  const QuestionNumberWidget({
    Key? key,
    required this.index,
    required this.onTap, required bool isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.primary,
            width: 2.0,
          ),
          color: isSelected ? AppColors.primary : AppGrayscale.off,
        ),
        child: CircleAvatar(
          radius: 16.r,
          backgroundColor: AppGrayscale.off,
          foregroundColor: AppColors.primary,
          child: Text('${index + 1}'),
        ),
      ),
    );
  }
}
