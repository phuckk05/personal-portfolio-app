import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_portfolio/cubits/selected_bottom_nav_cubit.dart';
import 'package:personal_portfolio/cubits/side_menu_display_mode_cubit.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';

class SideBarCus extends StatefulWidget {
  const SideBarCus({super.key});

  @override
  State<SideBarCus> createState() => _SideBarCusState();
}

class _SideBarCusState extends State<SideBarCus> {
  final SideMenuController sideMenuController = SideMenuController();

  @override
  void initState() {
    sideMenuController.addListener((index) {
      //Cập nhật index của bottom nav khi người dùng chọn
      context.read<SelectedBottomNavCubit>().selectTab(index);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //Cập nhật index của side menu khi người dùng chọn bottom nav
    final selectedIndex = context.watch<SelectedBottomNavCubit>().state;
    sideMenuController.changePage(selectedIndex);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    sideMenuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Theme.of(
                context,
              ).appBarTheme.foregroundColor!.withOpacity(0.2),
            ),
          ),
        ),
        child: Column(
          children: [
            //Nút co rộng sidebars
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => context
                    .read<SideMenuDisplayModeCubit>()
                    .toggleDisplayMode(),
                icon: Icon(
                  CupertinoIcons.sidebar_left,
                  color: Theme.of(context).appBarTheme.foregroundColor,
                ),
              ),
            ),
            BlocBuilder<SideMenuDisplayModeCubit, SideMenuDisplayMode>(
              builder: (context, state) {
                return SideMenu(
                  style: SideMenuStyle(
                    hoverColor: Theme.of(
                      context,
                    ).appBarTheme.foregroundColor!.withOpacity(0.1),

                    displayMode: state,
                    selectedColor: AppColors.chuChinh,
                    selectedTitleTextStyle: AppTextStyles.label.copyWith(
                      color: AppColors.nen,
                      fontSize: 24,
                    ),
                    unselectedTitleTextStyle: TextStyle(
                      color: AppColors.chuPhu,
                      fontSize: 16,
                    ),
                    selectedIconColor: AppColors.nen,
                    unselectedIconColor: AppColors.chuPhu,
                  ),
                  items: [
                    SideMenuItem(
                      title: AppStrings.home,
                      onTap: (index, _) => sideMenuController.changePage(index),
                      icon: const Icon(Icons.home),
                    ),
                    SideMenuItem(
                      title: AppStrings.resume,
                      onTap: (index, _) => sideMenuController.changePage(index),
                      icon: const Icon(Icons.description),
                    ),
                    SideMenuItem(
                      title: AppStrings.projects,
                      onTap: (index, _) => sideMenuController.changePage(index),
                      icon: const Icon(Icons.work),
                    ),
                    SideMenuItem(
                      title: AppStrings.skills,
                      onTap: (index, _) => sideMenuController.changePage(index),
                      icon: const Icon(Icons.build),
                    ),
                    SideMenuItem(
                      title: AppStrings.contact,
                      onTap: (index, _) => sideMenuController.changePage(index),
                      icon: const Icon(Icons.contact_mail),
                    ),
                  ],
                  controller: sideMenuController,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
