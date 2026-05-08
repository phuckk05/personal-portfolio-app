import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_portfolio/blocs/contact/contact_event.dart';
import 'package:personal_portfolio/blocs/contact/contact_state.dart';

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
    emit(state.copyWith(isLoading: true));
    if (event.contact.name.isEmpty ||
        event.contact.email.isEmpty ||
        event.contact.message.isEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: 'Vui lòng nhập đầy đủ thông tin!',
        ),
      );
      return;
    }
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
