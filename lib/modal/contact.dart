class Contact {
  String name;
  String contact;
  String email;

  Contact({required this.name, required this.contact, required this.email});

  void updateData(
      {required String newName,
      required String newEmail,
      required String newContact}) {}
}
