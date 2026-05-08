import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenuDisplayModeCubit extends Cubit<SideMenuDisplayMode> {
  SideMenuDisplayModeCubit() : super(SideMenuDisplayMode.open);
  //hàm chuyển đổi giữa hai chế độ open và compact
  void toggleDisplayMode() {
    emit(
      state == SideMenuDisplayMode.open
          ? SideMenuDisplayMode.compact
          : SideMenuDisplayMode.open,
    );
  }
}
