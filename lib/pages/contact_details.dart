import 'package:flutter/material.dart';
import 'package:contact_list/models/contacts.dart';
import 'package:contact_list/services/database_helper.dart';
import 'package:flutter/services.dart';

class ContactDetails extends StatelessWidget {
  final Contact? contact;
  final String buttonText;

  const ContactDetails({Key? key, this.contact, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final contactNumberController = TextEditingController();
    final addressController = TextEditingController();

    if (contact != null) {
      firstNameController.text = contact!.firstName;
      lastNameController.text = contact!.lastName;
      emailController.text = contact!.email!;
      contactNumberController.text = contact!.contactNumber;
      addressController.text = contact!.address!;
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
              decoration: const InputDecoration(
                  labelText: 'CONTACT NUMBER', icon: Icon(Icons.phone)),
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: 'EMAIL', icon: Icon(Icons.email)),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                  labelText: 'Current Address',
                  icon: Icon(Icons.location_city)),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () async {
                final firstName = firstNameController.text;
                final lastName = lastNameController.text;
                final contactNumber = contactNumberController.text;
                final address = addressController.text;
                final email = emailController.text;

                if (firstName.isEmpty ||
                    lastName.isEmpty ||
                    contactNumber.isEmpty) {
                  return;
                }

                final Contact model = Contact(
                    firstName: firstName,
                    lastName: lastName,
                    contactNumber: contactNumber,
                    address: address,
                    email: email,
                    id: contact?.id);

                if (contact == null) {
                  await DatabaseHelper.instance.addContact(model);
                } else {
                  await DatabaseHelper.instance.updateContact(model);
                }

                Navigator.pop(context);
              },
              child: Text(
                buttonText,
                style: const TextStyle(
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
