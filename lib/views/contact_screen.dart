import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_portfolio/blocs/contact/contact_bloc.dart';
import 'package:personal_portfolio/blocs/contact/contact_event.dart';
import 'package:personal_portfolio/blocs/contact/contact_state.dart';
import 'package:personal_portfolio/models/contact.dart' show Contact;
import 'package:personal_portfolio/utils/app_colors.dart';
import 'package:personal_portfolio/utils/app_constants.dart';
import 'package:personal_portfolio/utils/app_strings.dart';
import 'package:personal_portfolio/utils/app_text_styles.dart';
import 'package:personal_portfolio/widgets/app_bar_cus.dart';
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

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController messageController;

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
    //clear state cũ
    context.read<ContactBloc>().add(ClearContactEvent());

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
      appBar: CustomAppBar(title: AppStrings.contact),
      body: BlocListener<ContactBloc, ContactState>(
        listener: (context, stateListener) async {
          if (stateListener.isSuccess) {
            SnackBarCus.show(context, text: AppStrings.contactSuccessMessage);
            nameController.clear();
            emailController.clear();
            messageController.clear();
            context.read<ContactBloc>().add(ClearContactEvent());
          }
          if (stateListener.isError) {
            SnackBarCus.show(context, text: stateListener.errorMessage);
            // context.read<ContactBloc>().add(ClearContactEvent());
          }
        },
        child: BlocBuilder<ContactBloc, ContactState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(AppConstants.spacingM),
              child: SingleChildScrollView(
                child: SizedBox(
                  width:
                      ResponsiveBreakpoints.of(context).isMobile ||
                          ResponsiveBreakpoints.of(context).isTablet
                      ? null
                      : MediaQuery.of(context).size.height *
                            AppConstants.contactDesktopWidthFactor,
                  child: Column(
                    children: [
                      SizedBox(height: AppConstants.spacingXL),
                      TextFieldCus(
                        width: double.infinity,
                        height: AppConstants.size50,
                        controller: nameController,
                        hintText: AppStrings.contactNameHint,
                        maxLines: AppConstants.contactSingleLine,
                        minLines: AppConstants.contactSingleLine,
                        textColor: Theme.of(
                          context,
                        ).appBarTheme.foregroundColor!,
                        textInputType: TextInputType.name,
                        suffixIcon: state.isError && nameController.text.isEmpty
                            ? Icons.error
                            : null,
                      ),
                      SizedBox(height: AppConstants.spacingM),
                      TextFieldCus(
                        width: double.infinity,
                        height: AppConstants.size50,
                        controller: emailController,
                        hintText: AppStrings.contactEmailHint,
                        maxLines: AppConstants.contactSingleLine,
                        minLines: AppConstants.contactSingleLine,
                        textColor: Theme.of(
                          context,
                        ).appBarTheme.foregroundColor!,
                        textInputType: TextInputType.emailAddress,
                        suffixIcon:
                            state.isError && emailController.text.isEmpty
                            ? Icons.error
                            : null,
                      ),
                      SizedBox(height: AppConstants.spacingM),
                      TextFieldCus(
                        width: double.infinity,
                        height: AppConstants.size100,
                        controller: messageController,
                        hintText: AppStrings.contactMessageHint,
                        maxLines: AppConstants.contactMessageLines,
                        minLines: AppConstants.contactMessageLines,
                        maxLength: AppConstants.contactMessageMaxLength,
                        textColor: Theme.of(
                          context,
                        ).appBarTheme.foregroundColor!,
                        textInputType: TextInputType.text,
                        suffixIcon:
                            state.isError && messageController.text.isEmpty
                            ? Icons.error
                            : null,
                      ),
                      SizedBox(height: AppConstants.spacingM),
                      ButtonCus(
                        backgroundColor: Theme.of(
                          context,
                        ).appBarTheme.foregroundColor!,
                        textColor: Theme.of(
                          context,
                        ).appBarTheme.backgroundColor!,
                        isLoading: state.isLoading,
                        width: double.infinity,
                        height: AppConstants.size50,
                        text: AppStrings.contactSendButton,
                        onPressed: state.isLoading ? null : _handleSendContact,
                        textStyle: AppTextStyles.bottomNavLabel.copyWith(
                          color: Theme.of(context).appBarTheme.backgroundColor!,
                          fontWeight: FontWeight.bold,
                          fontSize: AppConstants.fontSizeXL,
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
