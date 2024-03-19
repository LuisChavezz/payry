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

Future<String?> selectContact() async {
  List<Contact> contacts = await ContactsService.getContacts();
  if (contacts.isNotEmpty) {
    // Aquí podrías realizar algún procesamiento adicional con la lista de contactos,
    // como seleccionar un contacto específico y obtener su número de teléfono
    Contact? firstContact = contacts.firstOrNull;
    if (firstContact != null) {
      Item? phoneItem = firstContact.phones?.firstOrNull;
      if (phoneItem != null && phoneItem.value != null) {
        return phoneItem.value;
      }
    }
  }
  return ''; // Devolver null si no se puede obtener el contacto o el número de teléfono
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
