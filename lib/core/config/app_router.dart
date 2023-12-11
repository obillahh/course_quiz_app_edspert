import 'package:application_edspert/core/constant/router_constant.dart';
import 'package:application_edspert/domain/entity/course/course_result_response_entity.dart';
import 'package:application_edspert/presentation/pages/course_page.dart';
import 'package:application_edspert/presentation/pages/discussion_page.dart';
import 'package:application_edspert/presentation/pages/home_page.dart';
import 'package:application_edspert/presentation/pages/login_page.dart';
import 'package:application_edspert/presentation/pages/profile_page.dart';
import 'package:application_edspert/presentation/widgets/navbar_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/course_exercise_page.dart';
import '../../presentation/pages/course_question_page.dart';
import '../../presentation/pages/course_result_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _rootNavigatorHome = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _rootNavigatorDiscussion =
    GlobalKey<NavigatorState>(debugLabel: 'shellDiscussion');
final _rootNavigatorProfile =
    GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

final GoRouter router = GoRouter(
  initialLocation: '/login',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/login',
      name: AppConsRoute.loginPageRouteName,
      builder: (context, state) => LoginPage(
        key: state.pageKey,
      ),
    ),
    // GoRoute(
    //   parentNavigatorKey: _rootNavigatorKey,
    //   path: '/register',
    //   name: AppConsRoute.registerPageRouteName,
    //   builder: (context, state) => RegistrationPage(
    //     key: state.pageKey,
    //   ),
    // ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavbarBottomWidget(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _rootNavigatorHome,
          routes: [
            GoRoute(
              path: '/home',
              name: AppConsRoute.homePageRouteName,
              builder: (context, state) => HomePage(
                key: state.pageKey,
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _rootNavigatorDiscussion,
          routes: [
            GoRoute(
              path: '/discussion',
              name: AppConsRoute.discussionPageRouteName,
              builder: (context, state) => DiscussionPage(
                key: state.pageKey,
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _rootNavigatorProfile,
          routes: [
            GoRoute(
              path: '/profile',
              name: AppConsRoute.profilePageRouteName,
              builder: (context, state) => ProfilePage(
                key: state.pageKey,
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/course',
      name: AppConsRoute.coursePageRouteName,
      builder: (context, state) => CoursePage(
        key: state.pageKey,
      ),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/exercise',
      name: AppConsRoute.courseExercisePageRouteName,
      builder: (context, state) => CourseExercisePage(
        key: state.pageKey,
        courseTitle: state.extra as String,
      ),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/question',
      name: AppConsRoute.courseQuestionPageRouteName,
      builder: (context, state) => CourseQuestionPage(
        key: state.pageKey,
      ),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/result',
      name: AppConsRoute.courseResultPageRouteName,
      builder: (context, state) => CourseResultPage(
        key: state.pageKey,
      ),
    ),
  ],
);
