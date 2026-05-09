import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_portfolio/cubits/dark_mode_cubit.dart';
import 'package:personal_portfolio/utils/app_constants.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';

/*định nghĩa appbar */
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
  });

  void _toggleDarkMode(BuildContext context) {
    context.read<DarkModeCubit>().toggleDarkMode();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      leading: leading,
      actions:
          actions ??
          [
            BlocBuilder<DarkModeCubit, bool>(
              builder: (context, isDarkMode) {
                return IconButton(
                  onPressed: () {
                    _toggleDarkMode(context);
                  },
                  icon: Icon(
                    isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon,
                    color: Theme.of(context).appBarTheme.foregroundColor!,
                  ),
                );
              },
            ),
          ],
      title: Text(
        title,
        style: AppTextStyles.bottomNavLabel.copyWith(
          color: Theme.of(context).appBarTheme.foregroundColor!,
          fontWeight: FontWeight.bold,
          fontSize: AppConstants.fontSizeXL,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
