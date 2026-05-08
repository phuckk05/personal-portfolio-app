import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_portfolio/blocs/contact/contact_bloc.dart';
import 'package:personal_portfolio/cubits/selected_bottom_nav_cubit.dart';
import 'package:personal_portfolio/cubits/selected_chip_cubit.dart';
import 'package:personal_portfolio/cubits/side_menu_display_mode_cubit.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/views/bottom_nav_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(
    //Đăng kí cubit || bloc ở đây
    MultiBlocProvider(
      providers: [
        //Cubit
        BlocProvider(create: (context) => SelectedBottomNavCubit()),
        BlocProvider(create: (context) => SideMenuDisplayModeCubit()),
        BlocProvider(create: (context) => SelectedChipCubit()),

        //bloc
        BlocProvider(create: (context) => ContactBloc()),
      ],
      child: const PersonalPortfolio(),
    ),
  );
}

class PersonalPortfolio extends StatelessWidget {
  const PersonalPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 600, name: MOBILE),

          const Breakpoint(start: 601, end: 1024, name: TABLET),

          const Breakpoint(start: 1025, end: 1920, name: DESKTOP),
        ],
      ),
      title: AppStrings.appName,
      theme: ThemeData(
        useMaterial3: true,
        //nền đen
        scaffoldBackgroundColor: AppColors.nen,
      ),
      home: const BottomNavScreen(),
    );
  }
}
