import 'package:contact_list/models/contacts.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const ContactCard({
    Key? key,
    required this.onLongPress,
    required this.onTap,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      child: ListTile(
        onTap: onTap,
        onLongPress: onLongPress,
        leading: CircleAvatar(
          child: Text(contact.firstName.substring(0, 1)),
        ),
        title: Text(
          contact.firstName + ' ' + contact.lastName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(contact.contactNumber),
      ),
    );
  }
}
