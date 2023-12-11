import 'package:application_edspert/core/themes/app_grayscale.dart';
import 'package:application_edspert/domain/entity/course/course_question_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/themes/app_colors.dart';
import '../../core/themes/app_fonts.dart';

class QuestionWidget extends StatefulWidget {
  final int index;
  final CourseQuestionDataEntity question;
  final bool isLastPage;
  final Function() onTap;
  const QuestionWidget({
    super.key,
    required this.index,
    required this.question,
    required this.onTap,
    required this.isLastPage,
  });

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Soal Nomor ${widget.index + 1}',
              style: AppFonts.appFont.bodyMedium!.copyWith(
                color: AppGrayscale.placeholder,
              ),
            ),
            SizedBox(height: 12.h),
            if (widget.question.questionTitleImg != null)
              Image.network(widget.question.questionTitleImg,
                  errorBuilder: (context, error, stackTrace) {
                return const Text(
                  'No IMG',
                );
              }),
            Html(
              data: widget.question.questionTitle,
              style: {
                'body': Style(
                  textAlign: TextAlign.justify,
                  fontSize: FontSize(12.sp),
                )
              },
            ),
            SizedBox(height: 12.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.question.studentAnswer = 'A';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: widget.question.studentAnswer == 'A'
                      ? AppColors.primary
                      : AppGrayscale.off,
                  borderRadius: BorderRadius.circular(
                      10), // Replace with the desired border radius
                  border: Border.all(
                    color: AppGrayscale.placeholder,
                  ),
                ),
                child: Html(
                  data: widget.question.optionA,
                  style: {
                    'body': Style(
                      padding: HtmlPaddings.symmetric(horizontal: 20.w),
                      fontSize: FontSize(12.sp),
                      alignment: Alignment.topLeft,
                      width: Width(320.w),
                      color: widget.question.studentAnswer == 'A'
                          ? AppGrayscale.off
                          : AppColors.primary,
                    ),
                  },
                ),
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.question.studentAnswer = 'B';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: widget.question.studentAnswer == 'B'
                      ? AppColors.primary
                      : AppGrayscale.off,
                  borderRadius: BorderRadius.circular(
                      10), // Replace with the desired border radius
                  border: Border.all(
                    color: AppGrayscale.placeholder,
                  ),
                ),
                child: Html(
                  data: widget.question.optionB,
                  style: {
                    'body': Style(
                      padding: HtmlPaddings.symmetric(horizontal: 20.w),
                      fontSize: FontSize(12.sp),
                      alignment: Alignment.topLeft,
                      width: Width(320.w),
                      color: widget.question.studentAnswer == 'B'
                          ? AppGrayscale.off
                          : AppColors.primary,
                    ),
                  },
                ),
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.question.studentAnswer = 'C';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: widget.question.studentAnswer == 'C'
                      ? AppColors.primary
                      : AppGrayscale.off,
                  borderRadius: BorderRadius.circular(
                      10), // Replace with the desired border radius
                  border: Border.all(
                    color: AppGrayscale.placeholder,
                  ),
                ),
                child: Html(
                  data: widget.question.optionC,
                  style: {
                    'body': Style(
                      padding: HtmlPaddings.symmetric(horizontal: 20.w),
                      fontSize: FontSize(12.sp),
                      alignment: Alignment.topLeft,
                      width: Width(320.w),
                      color: widget.question.studentAnswer == 'C'
                          ? AppGrayscale.off
                          : AppColors.primary,
                    ),
                  },
                ),
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.question.studentAnswer = 'D';
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: widget.question.studentAnswer == 'D'
                      ? AppColors.primary
                      : AppGrayscale.off,
                  borderRadius: BorderRadius.circular(
                      10), // Replace with the desired border radius
                  border: Border.all(
                    color: AppGrayscale.placeholder,
                  ),
                ),
                child: Html(
                  data: widget.question.optionD,
                  style: {
                    'body': Style(
                      padding: HtmlPaddings.symmetric(horizontal: 20.w),
                      fontSize: FontSize(12.sp),
                      alignment: Alignment.topLeft,
                      width: Width(320.w),
                      color: widget.question.studentAnswer == 'D'
                          ? AppGrayscale.off
                          : AppColors.primary,
                    ),
                  },
                ),
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.question.studentAnswer = 'E';
                });
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: widget.question.studentAnswer == 'E'
                      ? AppColors.primary
                      : AppGrayscale.off,
                  borderRadius: BorderRadius.circular(
                      10), // Replace with the desired border radius
                  border: Border.all(
                    color: AppGrayscale.placeholder,
                  ),
                ),
                child: Html(
                  data: widget.question.optionE,
                  style: {
                    'body': Style(
                      padding: HtmlPaddings.symmetric(horizontal: 20.w),
                      fontSize: FontSize(12.sp),
                      alignment: Alignment.topLeft,
                      width: Width(320.w),
                      color: widget.question.studentAnswer == 'E'
                          ? AppGrayscale.off
                          : AppColors.primary,
                    ),
                  },
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: widget.onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: widget.isLastPage
                      ? const Text('Kumpulin')
                      : const Text('Selajutnya'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
