import 'package:flutter/material.dart';
import 'package:contact_list/pages/contacts_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ContactList());
  }
}
