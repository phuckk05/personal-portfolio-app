import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedChipCubit extends Cubit<String?> {
  SelectedChipCubit() : super("Tất cả");

  void selectChip(String? chip) {
    emit(chip);
  }
}
