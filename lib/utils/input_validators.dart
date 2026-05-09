//*** Class chứa các phương thức kiểm tra đầu vào

//  - validateEmail: Kiểm tra xem email có hợp lệ không
//  - validateName: Kiểm tra xem tên có hợp lệ không
//  - validateMessage: Kiểm tra xem tin nhắn có hợp lệ không, với
// **/
class InputValidators {
  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Email không được để trống';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email.trim())) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  static String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'Tên không được để trống';
    }
    if (name.trim().length < 2) {
      return 'Tên phải có ít nhất 2 ký tự';
    }
    return null;
  }

  static String? validateMessage(String? message) {
    if (message == null || message.trim().isEmpty) {
      return 'Tin nhắn không được để trống';
    }
    if (message.trim().length < 30) {
      return 'Tin nhắn phải có ít nhất 30 ký tự';
    }
    return null;
  }
}
