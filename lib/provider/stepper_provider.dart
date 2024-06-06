import 'package:contactdairy/modal/contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contact_provider.dart';

class StepperProvider extends ChangeNotifier {
  int step = 0;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController contactcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  void forwardstep(BuildContext context) {
    if (step == 2) {
      Contact contact = Contact(
        name: namecontroller.text,
        contact: contactcontroller.text,
        email: emailcontroller.text,
      );

      Provider.of<ContactProvider>(context, listen: false).addContact(contact);
      Navigator.pop(context);
    }
    if (step < 2) {
      step++;
    }
    notifyListeners();
  }

  void backward() {
    if (step > 0) {
      step--;
    }
    notifyListeners();
  }
}
