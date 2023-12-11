import 'package:flutter/material.dart';

import '../../core/themes/app_colors.dart';
import '../../core/themes/app_fonts.dart';
import '../../core/themes/app_grayscale.dart';

class DiscussionPage extends StatelessWidget {
  const DiscussionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGrayscale.bg,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          'Diskusi Soal',
          style: AppFonts.appFont.headlineMedium,
        ),
        centerTitle: true,
      ),
    );
  }
}
