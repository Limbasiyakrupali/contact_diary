import 'package:flutter/foundation.dart';

import '../modal/contact.dart';

class HideContactProvider extends ChangeNotifier {
  List<Contact> hidecontact = [];

  void addcontact(Contact conatct) {
    hidecontact.add(conatct);
    notifyListeners();
  }

  void removecontact(Contact conatct) {
    hidecontact.remove(conatct);
    notifyListeners();
  }
}
