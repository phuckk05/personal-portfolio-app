import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_portfolio/blocs/contact/contact_bloc.dart';
import 'package:personal_portfolio/blocs/contact/contact_event.dart';
import 'package:personal_portfolio/blocs/contact/contact_state.dart';
import 'package:personal_portfolio/models/contact.dart' show Contact;
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';
import 'package:personal_portfolio/widgets/button_cus.dart';
import 'package:personal_portfolio/widgets/snack_bar_cus.dart';
import 'package:personal_portfolio/widgets/text_field_cus.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  //khai báo biến

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController messageController;

  //kích thước widget của crad

  @override
  void initState() {
    super.initState();
    //clear state khi vào màn hình
    context.read<ContactBloc>().add(ClearContactEvent());

    //khi vào màn hình thì khởi tạo các biến
    nameController = TextEditingController();
    emailController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    //giải phóng bộ nhớ
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  //Xử lý khi nhấn nút liên hệ
  void _handleSendContact() {
    //kiểm tra xem contact có hợp lệ không

    context.read<ContactBloc>().add(
      SendContactEvent(
        contact: Contact(
          name: nameController.text,
          email: emailController.text,
          message: messageController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.nen,
        title: Text(
          AppStrings.contact,
          style: AppTextStyles.bottomNavLabel.copyWith(
            color: AppColors.chuChinh,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: BlocListener<ContactBloc, ContactState>(
        listener: (context, stateListener) async {
          if (stateListener.isSuccess) {
            SnackBarCus.show(context, text: 'Liên hệ đã được gửi');
            nameController.clear();
            emailController.clear();
            messageController.clear();
            context.read<ContactBloc>().add(ClearContactEvent());
          }
        },
        child: BlocBuilder<ContactBloc, ContactState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: SizedBox(
                  width:
                      ResponsiveBreakpoints.of(context).isMobile ||
                          ResponsiveBreakpoints.of(context).isTablet
                      ? null
                      : MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      TextFieldCus(
                        width: double.infinity,
                        height: 50,
                        controller: nameController,
                        hintText: 'Nhập tên của bạn',
                        maxLines: 1,
                        minLines: 1,
                        textColor: AppColors.chuChinh,
                        textInputType: TextInputType.name,
                        suffixIcon: state.isError && nameController.text.isEmpty
                            ? Icons.error
                            : null,
                      ),
                      SizedBox(height: 12),
                      TextFieldCus(
                        width: double.infinity,
                        height: 50,
                        controller: emailController,
                        hintText: 'Nhập email của bạn',
                        maxLines: 1,
                        minLines: 1,
                        textColor: AppColors.chuChinh,
                        textInputType: TextInputType.emailAddress,
                        suffixIcon:
                            state.isError && emailController.text.isEmpty
                            ? Icons.error
                            : null,
                      ),
                      SizedBox(height: 12),
                      TextFieldCus(
                        width: double.infinity,
                        height: 100,
                        controller: messageController,
                        hintText: 'Nhập tin nhắn của bạn',
                        maxLines: 10,
                        minLines: 10,
                        maxLength: 500,
                        textColor: AppColors.chuChinh,
                        textInputType: TextInputType.text,
                        suffixIcon:
                            state.isError && messageController.text.isEmpty
                            ? Icons.error
                            : null,
                      ),
                      SizedBox(height: 12),
                      ButtonCus(
                        isLoading: state.isLoading,
                        width: double.infinity,
                        height: 50,
                        text: 'Gửi',
                        onPressed: state.isLoading ? null : _handleSendContact,
                        textStyle: AppTextStyles.bottomNavLabel.copyWith(
                          color: AppColors.chuChinh,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
