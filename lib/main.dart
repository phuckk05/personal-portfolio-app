import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_portfolio/cubits/selected_bottom_nav_cubit.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/views/bottom_nav_screen.dart';

void main() {
  runApp(
    //Đăng kí cubit || bloc ở đây
    MultiBlocProvider(
      providers: [
        //Cubit
        BlocProvider(create: (context) => SelectedBottomNavCubit()),
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
