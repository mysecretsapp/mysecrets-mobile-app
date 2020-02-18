import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/models/datastore.dart';
import 'package:mobile/pages/datastores/formTypes/local.dart';
import 'package:mobile/util/DBProviders/Provider.dart';

class DatastoreCreateForm extends StatefulWidget {
  const DatastoreCreateForm({Key key}) : super(key: key);
  @override
  _DatastoreCreateFormState createState() => _DatastoreCreateFormState();
}

class _DatastoreCreateFormState extends State<DatastoreCreateForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  String _type = 'kdbx';
  String _name = "";

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text('New Datastore'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name', 
                  hintText: 'Enter a search term',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (newText) {
                  setState(() {
                    _name = newText;
                  });
                },
              ),
              DropdownButtonFormField(
                items: <DropdownMenuItem>[
                  //DropdownMenuItem(value: '', child: Text('')),
                  DropdownMenuItem(value: 'local', child: Text('Local')),
                  DropdownMenuItem(value: 'kdbx', child: Text('KeePass File')),
                ],
                decoration: InputDecoration(
                  labelText: 'Type',
                ),
                onChanged: (newType) {
                  setState(() {
                    _type = newType;
                  });
                },
                value: _type,
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            // If the form is valid, display a Snackbar.
            dynamic form;
            switch(_type){
              case "local":
                form = LocalDatastoreForm(
                  datastore: Datastore(name: _name, type: _type)
                );
                break;
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => form,
              ),
            );
          }
        },
        tooltip: 'Add Datastore',
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
