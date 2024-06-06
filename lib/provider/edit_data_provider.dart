import 'package:contactdairy/modal/contact.dart'; // Import your Contact model
import 'package:flutter/material.dart';

class editdataProvider extends ChangeNotifier {
  // Initialize contact data
  Contact contact = Contact(
    name: '',
    email: '',
    contact: '',
  );

  // Getter for contact data
  // Contact get contact => contact;

  // Method to update contact data
  void updateContactData({
    required String newName,
    required String newEmail,
    required String newContact,
  }) {
    contact.updateData(
      newName: newName,
      newEmail: newEmail,
      newContact: newContact,
    );
    notifyListeners(); // Notify listeners of the change
  }
}
