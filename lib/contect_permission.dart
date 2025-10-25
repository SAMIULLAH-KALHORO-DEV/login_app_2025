import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact> contacts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    // Ask for permission
    if (await FlutterContacts.requestPermission()) {
      // Fetch contacts with phone numbers
      List<Contact> fetched = await FlutterContacts.getContacts(withProperties: true);
      setState(() {
        contacts = fetched;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Permission denied to read contacts')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Contacts')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : contacts.isEmpty
          ? const Center(child: Text('No contacts found'))
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                // final c = contacts[index];
                // print(' Contact: ${c.displayName}, Phones: ${c.phones.map((p) => p.number).join(', ')}');
                // final phone = c.phones.isNotEmpty ? c.phones.first.number : 'No number';
                return ListTile(
                  // leading: CircleAvatar(child: Text(c.displayName[0])),
                  // title: Text(c.displayName),
                  // subtitle: Text(phone),
                  // title: Center(child: Text('your contacts are saved on our server')),
                );
              },
            ),
    );
  }
}
