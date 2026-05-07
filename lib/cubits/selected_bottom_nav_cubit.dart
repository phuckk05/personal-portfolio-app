import 'package:flutter_bloc/flutter_bloc.dart';

/*  
  Cubit này quản lý index của tab được chọn
*/

class SelectedBottomNavCubit extends Cubit<int> {
  //Khởi tạo với index mặc định là 0
  SelectedBottomNavCubit() : super(0);

  //cập nhật index của tab được chọn
  void selectTab(int index) => emit(index);
}
