import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_portfolio/cubits/selected_bottom_nav_cubit.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_constants.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';
import 'package:personal_portfolio/widgets/side_bar_cus.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavScreen({super.key, required this.navigationShell});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  void _onItemTapped(int index) {
    //cập nhật index của bottom nav khi người dùng chọn
    context.read<SelectedBottomNavCubit>().selectTab(index);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWidth = width > AppConstants.mobileBreakpoint;
    return PopScope(
      //Không cho pop
      canPop: false,
      /* Sử dụng BlocBuilder để lắng nghe sự thay đổi của cubit và cập nhật giao diện */
      child: BlocBuilder<SelectedBottomNavCubit, int>(
        buildWhen: (previous, current) {
          if (previous != current) {
            widget.navigationShell.goBranch(
              current,
              initialLocation: widget.navigationShell.currentIndex == current,
            );
          }
          return true;
        },
        builder: (context, selectedIndex) {
          return Scaffold(
            // body: _screens[selectedIndex],
            // body: ResponsiveBreakpoints.of(context).isMobile
            //     ? PageAnimation(selectedIndex: selectedIndex)
            //     : Row(
            //         children: [
            //           SideBarCus(),
            //           Expanded(
            //             child: PageAnimation(selectedIndex: selectedIndex),
            //           ),
            //         ],
            //       ),
            body: ResponsiveBreakpoints.of(context).isMobile
                ? widget.navigationShell
                : Row(
                    children: [
                      SideBarCus(),
                      Expanded(child: widget.navigationShell),
                    ],
                  ),
            bottomNavigationBar: ResponsiveBreakpoints.of(context).isMobile
                ? SalomonBottomBar(
                    backgroundColor: Colors.transparent,

                    /* 
                -  Sử dụng dạng bottom nav kiểu slamon
                - 5 item: Home, Resume, Projects, Skills, Contact
               */
                    currentIndex: selectedIndex,
                    onTap: (index) {
                      //Cập nhật index của bottom nav khi người dùng chọn
                      _onItemTapped(index);
                    },
                    items: [
                      _buildBottomNavItem(
                        isWidth,
                        Icons.home,
                        AppStrings.home,
                        null,
                      ),
                      _buildBottomNavItem(
                        isWidth,
                        Icons.description,
                        AppStrings.resume,
                        null,
                      ),
                      _buildBottomNavItem(
                        isWidth,
                        Icons.work,
                        AppStrings.projects,
                        null,
                      ),
                      _buildBottomNavItem(
                        isWidth,
                        Icons.build,
                        AppStrings.skills,
                        null,
                      ),
                      _buildBottomNavItem(
                        isWidth,
                        Icons.contact_mail,
                        AppStrings.contact,
                        null,
                      ),
                    ],
                  )
                : null,
          );
        },
      ),
    );
  }

  //tạo item cho bottom nav
  SalomonBottomBarItem _buildBottomNavItem(
    bool isWidth,
    IconData icon,
    String label,
    Color? color,
  ) {
    return SalomonBottomBarItem(
      unselectedColor: Theme.of(
        context,
      ).appBarTheme.foregroundColor!.withOpacity(0.5),
      activeIcon: Icon(icon, color: AppColors.vangLuxury),
      icon: Icon(icon),
      title: isWidth
          ? Text(label, style: AppTextStyles.bottomNavLabel)
          : SizedBox(),
      selectedColor: color ?? Theme.of(context).appBarTheme.foregroundColor!,
    );
  }
}
