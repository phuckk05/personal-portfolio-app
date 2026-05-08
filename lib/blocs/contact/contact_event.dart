import 'package:personal_portfolio/models/contact.dart';

/* Event của contact
  - SendContactEvent: gửi contact
  - NameChangedEvent: thay đổi tên
  - EmailChangedEvent: thay đổi email
  - MessageChangedEvent: thay đổi tin nhắn
*/

abstract class ContactEvent {}

class SendContactEvent extends ContactEvent {
  final Contact contact;
  SendContactEvent({required this.contact});
}

class ClearContactEvent extends ContactEvent {}
