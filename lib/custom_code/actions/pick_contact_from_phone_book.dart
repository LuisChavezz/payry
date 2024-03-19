// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:contacts_service/contacts_service.dart';

Future<dynamic> pickContactFromPhoneBook() async {
  // open native phonebook and return a json data for a contact selected
  // Use the contacts_service package to open the native phonebook
  final Contact? contact = await ContactsService.openDeviceContactPicker();

  // Check if a contact was selected
  if (contact != null) {
    // Create a map of the selected contact's data
    final Map<String, dynamic> contactData = {
      'name': contact.displayName ?? '',
      'phone': contact.phones?.isNotEmpty ?? false
          ? contact.phones!.first.value ?? ''
          : '',
      'email': contact.emails?.isNotEmpty ?? false
          ? contact.emails!.first.value ?? ''
          : '',
      'address': contact.postalAddresses?.isNotEmpty ?? false
          ? {
              'street': contact.postalAddresses!.first.street,
              'city': contact.postalAddresses!.first.city,
              'region': contact.postalAddresses!.first.region,
              'country': contact.postalAddresses!.first.country,
            }
          : '',
    };
    // Return the contact data as a JSON string
    return contactData;
  }

  // If no contact was selected,
  return null;
}
