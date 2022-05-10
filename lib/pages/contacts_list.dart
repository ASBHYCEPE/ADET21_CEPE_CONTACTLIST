import 'package:contact_list/models/contacts.dart';
import 'package:contact_list/services/database_helper.dart';
import 'package:contact_list/widget/contact_card.dart';
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
        child: FutureBuilder(
          future: DatabaseHelper.instance.getAllContacts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Contact>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              if (snapshot.data != null) {
                ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) =>
                        ContactCard(contact: snapshot.data![index]));
              }
            }
            return const Center(
              child: Text('NO CONTACTS'),
            );
          },
        ),
      ),
    );
  }
}
