import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_portfolio/cubits/loading_cubit.dart';
import 'package:personal_portfolio/utils/animations/widget_animation.dart';
import 'package:personal_portfolio/utils/app_constants.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/utils/routes/app_router_name.dart';
import 'package:personal_portfolio/widgets/avatar_cus.dart';
import 'package:personal_portfolio/widgets/loading_internal.dart';

class InitAppScreen extends StatefulWidget {
  const InitAppScreen({super.key});

  @override
  State<InitAppScreen> createState() => _InitAppScreenState();
}

class _InitAppScreenState extends State<InitAppScreen> {
  @override
  void initState() {
    context.read<LoadingCubit>().showLoading();

    //sau 3 giây thì ẩn loading và chuyển sang
    _navigateToBottomNavScreen();
    super.initState();
  }

  void _navigateToBottomNavScreen() async {
    await Future.delayed(
      const Duration(seconds: AppConstants.initAppDelaySeconds),
      () {
        context.goNamed(AppRouterName.home);
      },
    );
  }

  final String tag = AppStrings.avatarTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoadingCubit, bool>(
        builder: (context, isLoading) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WidgetAnimation(
                    beginOffset: const Offset(
                      AppConstants.animationOffsetSmallX,
                      0,
                    ),
                    child: AvatarCus(
                      semanticsLabel: AppStrings.avatarSemanticsLabel,
                      radius: AppConstants.size100,
                      imagePath: AppStrings.avatarAssetPath,
                      tag: tag,
                    ),
                  ),
                  SizedBox(height: AppConstants.size50),
                  isLoading
                      ? LoadingInternal(
                          color: Theme.of(context).appBarTheme.foregroundColor!,
                          size: AppConstants.size50,
                          loading: isLoading,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
