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

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      contactNumber: json['contactNumber']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'contactNumber': contactNumber
      };
}
