import 'package:flutter/material.dart';

import '../../core/themes/app_colors.dart';

class ButtonQuestion extends StatelessWidget {
  const ButtonQuestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text('Selajutnya'),
      ),
    );
  }
}