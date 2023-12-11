import 'package:application_edspert/core/config/app_router.dart';
import 'package:application_edspert/data/datasource/remote/course_remote_datasource.dart';
import 'package:application_edspert/data/datasource/remote/user_remote_datasource.dart';
import 'package:application_edspert/data/repository/banner_repository_impl.dart';
import 'package:application_edspert/data/repository/course_repository_impl.dart';
import 'package:application_edspert/data/repository/user_repository_impl.dart';
import 'package:application_edspert/domain/repository/course_repository.dart';
import 'package:application_edspert/domain/usecase/banner/get_banners_usecase.dart';
import 'package:application_edspert/domain/usecase/course/get_course_result.dart';
import 'package:application_edspert/domain/usecase/course/get_courses_usecase.dart';
import 'package:application_edspert/domain/usecase/course/get_exercise_by_course_id_usecase.dart';
import 'package:application_edspert/domain/usecase/course/submit_course_answer_usecase.dart';
import 'package:application_edspert/domain/usecase/user/get_user.dart';
import 'package:application_edspert/presentation/bloc/course/answer/answer_bloc.dart';
import 'package:application_edspert/presentation/bloc/course/exercise/exercise_bloc.dart';
import 'package:application_edspert/presentation/bloc/course/question/question_bloc.dart';
import 'package:application_edspert/presentation/bloc/course/result/result_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/datasource/remote/banner_remote_datasource.dart';
import 'domain/usecase/course/get_question_by_exercise_id.dart';
import 'presentation/bloc/banner/banner_bloc.dart';
import 'presentation/bloc/course/course_bloc.dart';
import 'presentation/bloc/user/user_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            CourseRepository repo = CourseRepositoryImpl(
              remoteDatasource: CourseRemoteDatasource(
                client: Dio(),
              ),
            );
            return CourseBloc(
              GetCoursesUsecase(repository: repo),
            )..add(GetCoursesEvent(majorName: 'IPA'));
          },
        ),
        BlocProvider(
          create: (context) {
            CourseRepository repo = CourseRepositoryImpl(
                remoteDatasource: CourseRemoteDatasource(
              client: Dio(),
            ));
            return ExerciseBloc(GetExerciseByCourseIdUsecase(repository: repo));
          },
        ),
        BlocProvider(
          create: (context) {
            CourseRepository repo = CourseRepositoryImpl(
                remoteDatasource: CourseRemoteDatasource(
              client: Dio(),
            ));
            return QuestionBloc(
                GetQuestionByExerciseIdUsecase(repository: repo));
          },
        ),
        BlocProvider(create: (context) {
          CourseRepository repo = CourseRepositoryImpl(
              remoteDatasource: CourseRemoteDatasource(
            client: Dio(),
          ));
          return AnswerBloc(SubmitCourseAnswerUsecase(repository: repo));
        }),
        BlocProvider(
          create: (context) {
            CourseRepository repo = CourseRepositoryImpl(
              remoteDatasource: CourseRemoteDatasource(
                client: Dio(),
              ),
            );
            return ResultBloc(
              GetCourseResultUsecase(repository: repo),
            );
          },
        ),
        BlocProvider(
          create: (context) => UserBloc(
            getUserRepository: GetUserUsecase(
              repository: UserRepositoryImpl(
                remoteDatasource: UserRemoteDatasource(
                  client: Dio(),
                ),
              ),
            ),
          )..add(GetUserByEmailEvent(email: 'juveticsatu@gmail.com')),
        ),
        BlocProvider(
          create: (context) => BannerBloc(
            getBannersUsecase: GetBannersUsecase(
              repository: BannerRepositoryImpl(
                remoteDatasource: BannerRemoteDatasource(
                  client: Dio(),
                ),
              ),
            ),
          )..add(GetBannersEvent()),
        ),
      ],
      child: ScreenUtilInit(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Edspert.id',
          themeMode: ThemeMode.system,
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
            useMaterial3: false,
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}
