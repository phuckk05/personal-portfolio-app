import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingCubit extends Cubit<bool> {
  LoadingCubit() : super(false);

  void showLoading() {
    emit(true);
  }

  void hideLoading() {
    emit(false);
  }
}
