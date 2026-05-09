import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_portfolio/blocs/contact/contact_event.dart';
import 'package:personal_portfolio/blocs/contact/contact_state.dart';
import 'package:personal_portfolio/utils/input_validators.dart';

/* Quản lý state của contact
*/

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactState()) {
    on<SendContactEvent>(_onSendContact);
    on<ClearContactEvent>(_onClearContact);
  }

  void _onSendContact(
    SendContactEvent event,
    Emitter<ContactState> emit,
  ) async {
    // Clear state cũ
    // add(ClearContactEvent());

    emit(state.copyWith(isLoading: true));

    // Validate từng field
    final nameError = InputValidators.validateName(event.contact.name);
    final emailError = InputValidators.validateEmail(event.contact.email);
    final messageError = InputValidators.validateMessage(event.contact.message);

    if (nameError != null || emailError != null || messageError != null) {
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage:
              nameError ?? emailError ?? messageError ?? 'Lỗi validation',
        ),
      );
      return;
    }

    //giả lập gửi contact thành công sau 2s
    await Future.delayed(const Duration(seconds: 2));

    emit(
      state.copyWith(
        isLoading: false,
        isError: false,
        errorMessage: '',
        isSuccess: true,
      ),
    );
  }

  void _onClearContact(ClearContactEvent event, Emitter<ContactState> emit) {
    emit(
      state.copyWith(
        isLoading: false,
        isSuccess: false,
        isError: false,
        errorMessage: '',
      ),
    );
  }
}
