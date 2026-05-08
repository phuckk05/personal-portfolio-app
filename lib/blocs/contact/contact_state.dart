import 'package:personal_portfolio/models/contact.dart';

/* State của contact
  - contact: thông tin contact
  - isLoading: trạng thái loading
  - isSuccess: trạng thái thành công
  - isError: trạng thái lỗi
  - errorMessage: thông báo lỗi
*/

class ContactState {
  final Contact? contact;
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final String errorMessage;

  ContactState({
    this.contact,
    this.isLoading = false,
    this.isSuccess = false,
    this.isError = false,
    this.errorMessage = '',
  });

  ContactState copyWith({
    Contact? contact,
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    String? errorMessage,
  }) {
    return ContactState(
      contact: contact ?? this.contact,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
