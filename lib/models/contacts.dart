class Contact {
  final int? id;
  final String? email;
  final String firstName;
  final String lastName;
  final String contactNumber;

  Contact(
      {required this.firstName,
      required this.lastName,
      required this.contactNumber,
      this.email,
      this.id});
}
