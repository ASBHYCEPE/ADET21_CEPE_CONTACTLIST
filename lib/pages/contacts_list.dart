import 'package:flutter/material.dart';
import 'package:contact_list/pages/contact_details.dart';

class ContactList extends StatefulWidget {
  ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CONTACT LIST')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ContactDetails()));
        },
        child: const Icon(Icons.person_add),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Container(),
      ),
    );
  }
}
