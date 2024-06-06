import 'package:flutter/cupertino.dart';

import '../modal/contact.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> allContact = [];

  void addContact(Contact contact) {
    allContact.add(contact);
    notifyListeners();
  }

  void removeContact(Contact contact) {
    allContact.remove(contact);
    notifyListeners();
  }
}
