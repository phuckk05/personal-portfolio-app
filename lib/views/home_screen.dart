import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';
import 'package:personal_portfolio/widgets/button_cus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final String avatarPath = 'assets/images/avatar.jpg';
  final String tag = 'avatar';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        //Sử dụng SingleChildScrollView để tránh lỗi khi nội dung quá dài và trường hợp user co thắt giao diện
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(height: 100),
                _buildAvatar(),
                SizedBox(height: 20),
                _buildName('Nguyễn Văn A'),
                SizedBox(height: 10),
                _buildJobTitle('Flutter Developer'),
                SizedBox(height: 20),
                ButtonCus(
                  text: 'Liên hệ',
                  onPressed: () {
                    //Xử lý khi nhấn nút liên hệ
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Avatar
  Widget _buildAvatar() {
    return Hero(
      tag: tag,
      child: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage(avatarPath),
        ),
      ),
    );
  }

  //build tên
  Widget _buildName(String name) {
    return Text(
      name,
      style: AppTextStyles.bottomNavLabel.copyWith(color: AppColors.chuChinh),
    );
  }

  //build chức danh
  Widget _buildJobTitle(String jobTitle) {
    return Text(
      jobTitle,
      style: AppTextStyles.bottomNavLabel.copyWith(color: AppColors.chuChinh),
    );
  }
}
