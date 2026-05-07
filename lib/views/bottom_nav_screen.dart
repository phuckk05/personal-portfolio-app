import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_portfolio/cubits/selected_bottom_nav_cubit.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';
import 'package:personal_portfolio/views/contact_screen.dart';
import 'package:personal_portfolio/views/home_screen.dart';
import 'package:personal_portfolio/views/projects_screen.dart';
import 'package:personal_portfolio/views/resume_screen.dart';
import 'package:personal_portfolio/views/skills_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  //tạo 1 danh sách màn hình
  final List<Widget> _screens = [
    HomeScreen(),
    ResumeScreen(),
    ProjectsScreen(),
    SkillsScreen(),
    ContactScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return PopScope(
      //Không cho pop
      canPop: false,
      /* Sử dụng BlocBuilder để lắng nghe sự thay đổi của cubit và cập nhật giao diện */
      child: BlocBuilder<SelectedBottomNavCubit, int>(
        builder: (context, selectedIndex) {
          return Scaffold(
            body: _screens[selectedIndex],
            bottomNavigationBar: SalomonBottomBar(
              backgroundColor: AppColors.nen,
              /* 
                -  Sử dụng dạng bottom nav kiểu slamon
                - 5 item: Home, Resume, Projects, Skills, Contact
               */
              currentIndex: selectedIndex,
              onTap: (index) {
                //Cập nhật index của bottom nav khi người dùng chọn
                context.read<SelectedBottomNavCubit>().selectTab(index);
              },
              items: [
                _buildBottomNavItem(Icons.home, AppStrings.home, null),
                _buildBottomNavItem(Icons.description, AppStrings.resume, null),
                _buildBottomNavItem(Icons.work, AppStrings.projects, null),
                _buildBottomNavItem(Icons.build, AppStrings.skills, null),
                _buildBottomNavItem(
                  Icons.contact_mail,
                  AppStrings.contact,
                  null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  //tạo item cho bottom nav
  SalomonBottomBarItem _buildBottomNavItem(
    IconData icon,
    String label,
    Color? color,
  ) {
    return SalomonBottomBarItem(
      unselectedColor: AppColors.chuPhu,
      icon: Icon(icon),
      title: Text(label, style: AppTextStyles.bottomNavLabel),
      selectedColor: color ?? AppColors.chuChinh,
    );
  }
}
