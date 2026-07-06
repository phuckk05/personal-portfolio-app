import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_portfolio/blocs/contact/contact_bloc.dart';
import 'package:personal_portfolio/cubits/dark_mode_cubit.dart';
import 'package:personal_portfolio/cubits/loading_cubit.dart';
import 'package:personal_portfolio/cubits/selected_bottom_nav_cubit.dart';
import 'package:personal_portfolio/cubits/selected_chip_cubit.dart';
import 'package:personal_portfolio/cubits/side_menu_display_mode_cubit.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/utils/routes/app_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  //Sử dụng PathUrlStrategy để loại bỏ dấu # trong URL
  setUrlStrategy(PathUrlStrategy());
  runApp(
    //Đăng kí cubit || bloc ở đây
    MultiBlocProvider(
      providers: [
        //Cubit
        BlocProvider(create: (context) => SelectedBottomNavCubit()),
        BlocProvider(create: (context) => SideMenuDisplayModeCubit()),
        BlocProvider(create: (context) => SelectedChipCubit()),
        BlocProvider(create: (context) => LoadingCubit()),
        BlocProvider(create: (context) => DarkModeCubit()),

        //bloc
        BlocProvider(create: (context) => ContactBloc()),
      ],
      child: const PersonalPortfolio(),
    ),
  );
}

class PersonalPortfolio extends StatefulWidget {
  const PersonalPortfolio({Key? key}) : super(key: key);

  @override
  State<PersonalPortfolio> createState() => _PersonalPortfolioState();
}

class _PersonalPortfolioState extends State<PersonalPortfolio> {
  late final GoRouter _router;

  @override
  void initState() {
    _router = createRouter(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 600, name: MOBILE),
            const Breakpoint(start: 601, end: 1024, name: TABLET),
            const Breakpoint(start: 1025, end: 1920, name: DESKTOP),
          ],
        );
      },
      title: AppStrings.appName,
      theme: AppColors.lightTheme,
      darkTheme: AppColors.darkTheme,

      themeMode: context.select(
        (DarkModeCubit darkModeCubit) =>
            darkModeCubit.state ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}
