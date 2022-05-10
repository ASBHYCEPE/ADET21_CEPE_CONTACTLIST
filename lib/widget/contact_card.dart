import 'package:contact_list/models/contacts.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  const ContactCard({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      child: ListTile(
        title: Text(
          contact.firstName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(contact.contactNumber),
      ),
    );
  }
}
