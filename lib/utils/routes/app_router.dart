import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_portfolio/utils/animations/page_animation.dart';
import 'package:personal_portfolio/utils/routes/app_router_name.dart';
import 'package:personal_portfolio/utils/routes/app_router_path.dart';
import 'package:personal_portfolio/views/bottom_nav_screen.dart';
import 'package:personal_portfolio/views/contact_screen.dart';
import 'package:personal_portfolio/views/home_screen.dart';
import 'package:personal_portfolio/views/init_app_screen.dart';
import 'package:personal_portfolio/views/projects_screen.dart';
import 'package:personal_portfolio/views/resume_screen.dart';
import 'package:personal_portfolio/views/skills_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter(BuildContext context) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRouterPath.root,
    //Redirect logic
    // redirect: (context, state) async {
    //   // final authRoutes = [
    //   //   RouterName().loginPath,
    //   //   RouterName().registerPath,
    //   //   RouterName().setupProfilePath,
    //   //   RouterName().inputEmailPath,
    //   //   RouterName().updatePasswordPath,
    //   // ];
    //   // final isOnAuthRoute = authRoutes.contains(location);

    //   // // Đang ở initial state → không redirect
    //   // if (authState.status == AuthStatus.initial) {
    //   //   return location == RouterName().initPath ? null : RouterName().initPath;
    //   // }

    //   // // Chưa đăng nhập → về login
    //   // if (authState.isUnauthenticated && !isOnAuthRoute) {
    //   //   return RouterName().loginPath;
    //   // }

    //   // // Cần setup profile → về setup
    //   // if (authState.needProfile && location != RouterName().setupProfilePath) {
    //   //   return RouterName().setupProfilePath;
    //   // }

    //   // // Đã đăng nhập đầy đủ mà vẫn ở auth routes → vào home
    //   // if (authState.isAuthenticated &&
    //   //     (isOnAuthRoute || location == RouterName().initPath)) {
    //   //   return RouterName().homePath;
    //   // }
    //   // if (authState.isProfileCreated &&
    //   //     authState.loginMethod == LoginMethod.google) {
    //   //   //delay 1s
    //   //   return RouterName().homePath;
    //   // }
    //   // if (authState.isProfileCreated &&
    //   //     authState.loginMethod == LoginMethod.email) {
    //   //   return RouterName().loginPath;
    //   // }
    //   // if (authState.status == AuthStatus.isWaitingVerifyEmail ||
    //   //     authState.status == AuthStatus.isVerifiedEmail) {
    //   //   return null;
    //   // }

    //   return null;
    // },
    routes: [
      GoRoute(
        name: AppRouterName.root,
        path: AppRouterPath.root,
        builder: (context, state) =>
            PageAnimation(child: const InitAppScreen()),
      ),

      // App routes sau khi đăng nhập
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouterName.home,
                path: AppRouterPath.home,
                builder: (context, state) => PageAnimation(child: HomeScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouterName.resume,
                path: AppRouterPath.resume,
                builder: (context, state) =>
                    PageAnimation(child: ResumeScreen()),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouterName.project,
                path: AppRouterPath.project,
                builder: (context, state) =>
                    PageAnimation(child: ProjectsScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouterName.skill,
                path: AppRouterPath.skill,
                builder: (context, state) =>
                    PageAnimation(child: const SkillsScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouterName.contact,
                path: AppRouterPath.contact,
                builder: (context, state) =>
                    PageAnimation(child: const ContactScreen()),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
