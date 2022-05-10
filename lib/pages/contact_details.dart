import 'package:flutter/material.dart';
import 'package:contact_list/models/contacts.dart';

class ContactDetails extends StatelessWidget {
  final Contact? contact;
  const ContactDetails({Key? key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final contactNumberController = TextEditingController();

    if (contact != null) {
      firstNameController.text = contact!.firstName;
      lastNameController.text = contact!.lastName;
      emailController.text = contact!.email!;
      contactNumberController.text = contact!.contactNumber;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('CONTACT DETAILS'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Center(
              child: Text(
                'Contact Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(labelText: 'FIRST NAME'),
                )),
                const SizedBox(width: 10.0),
                Expanded(
                    child: TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(labelText: 'LAST NAME'),
                )),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: contactNumberController,
              decoration: const InputDecoration(labelText: 'CONTACT NUMBER'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'EMAIL'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'SAVE INFORMATION',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.lightBlue),
            )
          ],
        ),
      ),
    );
  }
}
