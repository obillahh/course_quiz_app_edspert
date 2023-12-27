import 'package:application_edspert/core/themes/app_grayscale.dart';
import 'package:application_edspert/presentation/bloc/course/answer/answer_bloc.dart';
import 'package:application_edspert/presentation/bloc/course/result/result_bloc.dart';
import 'package:application_edspert/presentation/widgets/question_number_widget.dart';
import 'package:application_edspert/presentation/widgets/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/themes/app_colors.dart';
import '../../core/themes/app_fonts.dart';
import '../../data/models/course/course_answer_request_model.dart';
import '../bloc/course/question/question_bloc.dart';

class CourseQuestionPage extends StatefulWidget {
  const CourseQuestionPage({Key? key}) : super(key: key);

  @override
  _CourseQuestionPageState createState() => _CourseQuestionPageState();
}

class _CourseQuestionPageState extends State<CourseQuestionPage> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  bool isLastPage = false;
  List<String> answers = List.filled(10, '');

  void updateAnswer(String answer) {
    setState(() {
      answers[currentIndex] = answer;
    });
  }

  void _goToQuestion(int questionNumber) {
    _pageController.animateToPage(
      questionNumber,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGrayscale.bg,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Latihan Soal',
          style: AppFonts.appFont.headlineSmall,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: AppGrayscale.off,
            height: 50.h,
            child: BlocBuilder<QuestionBloc, QuestionState>(
              builder: (context, state) {
                if (state is CourseQuestionSuccess) {
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return QuestionNumberWidget(
                        index: index,
                        isSelected: state.courseQuestion![index].studentAnswer
                                .isNotEmpty ==
                            true,
                        onTap: () {
                          if (index >= 0 &&
                              index < state.courseQuestion!.length) {
                            _goToQuestion(index);
                            setState(
                              () {
                                currentIndex = index;
                              },
                            );
                          }
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 8.w);
                    },
                    itemCount: state.courseQuestion!.length,
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
      body: BlocBuilder<QuestionBloc, QuestionState>(
        builder: (context, state) {
          if (state is CourseQuestionSuccess) {
            return PageView.builder(
              controller: _pageController,
              itemBuilder: (context, index) {
                return QuestionWidget(
                  index: index,
                  question: state.courseQuestion![index],
                  onTap: () {
                    updateAnswer(state.courseQuestion![index].studentAnswer);
                    if (isLastPage != true) {
                      nextPage();
                    } else {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/images/kumpulin.png'),
                                Text(
                                  'Kumpulkan latihan soal sekarang?',
                                  style: AppFonts.appFont.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Boleh langsung kumpulin dong',
                                  style: AppFonts.appFont.bodyMedium,
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppGrayscale.off,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                            color: AppColors.primary,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Text(
                                          'Nanti Dulu',
                                          style: TextStyle(
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                    BlocListener<AnswerBloc, AnswerState>(
                                      listenWhen: (previous, current) =>
                                          (previous is AnswerLoading &&
                                              current is AnswerSuccess) ||
                                          (previous is AnswerLoading &&
                                              current is AnswerFail),
                                      listener: (context, state) {
                                        if (state is AnswerSuccess) {
                                          context.go('/result');
                                        } else if (state is AnswerFail) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(state.message),
                                            ),
                                          );
                                        }
                                      },
                                      child: ElevatedButton(
                                        onPressed: () {
                                          final List<String> studentAnswers =
                                              answers
                                                  .map((answer) =>
                                                      answer.isNotEmpty
                                                          ? answer
                                                          : '')
                                                  .toList();
                                          final answerRequest =
                                              CourseAnswerRequestModel(
                                            userEmail: "testerngbayu@gmail.com",
                                            exerciseId: state
                                                .courseQuestion![currentIndex]
                                                .exerciseIdFk,
                                            bankQuestionId: state
                                                .courseQuestion!
                                                .map((question) =>
                                                    question.bankQuestionId)
                                                .toList(),
                                            studentAnswer: studentAnswers,
                                          );
                                          print(answerRequest.studentAnswer);
                                          context.read<AnswerBloc>().add(
                                                SubmitAnswerEvent(
                                                  request: answerRequest,
                                                ),
                                              );
                                          context.read<ResultBloc>().add(
                                                GetCourseResultEvent(
                                                  exerciseId: state
                                                      .courseQuestion![index]
                                                      .exerciseIdFk,
                                                ),
                                              );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primary,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                              color: AppGrayscale.off,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Text('Kumpulin'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    print(state.courseQuestion![index].studentAnswer);
                  },
                  isLastPage: isLastPage,
                );
              },
              itemCount: state.courseQuestion!.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                  isLastPage = index == state.courseQuestion!.length - 1;
                });
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
