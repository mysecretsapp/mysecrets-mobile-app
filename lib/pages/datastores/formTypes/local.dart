import 'package:biometric_storage/biometric_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/models/datastore.dart';
import 'package:mobile/util/DBProviders/LocalDSProvider.dart';

class LocalDatastoreForm extends StatefulWidget {
  const LocalDatastoreForm({Key key, this.datastore}) : super(key: key);
  final Datastore datastore;
  @override
  createState() => _LocalDatastoreFormState(this.datastore);
}

class _LocalDatastoreFormState extends State {
  _LocalDatastoreFormState(this.datastore);

  final Datastore datastore ;
  final _formKey = GlobalKey<FormState>();
  bool _biometric = true;
  int _timeout = 300;

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text('New Local Datastore'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  labelText: 'Timeout', 
                  hintText: '',
                  filled: true,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a number';
                  } else if (int.parse(value.toString()) <= 0){
                    return 'Please enter a number greater than 0';
                  }
                  return null;
                },
                onChanged: (newText) {
                  setState(() {
                    _timeout = int.parse(newText);
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Use Biometric'),
                value: _biometric,
                onChanged: (bool val)  async {
                  //final response = await BiometricStorage().getStorage(name, );
                  setState(() => _biometric = val);
                }
              ),
            ],
          )
        ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a Snackbar.
                Scaffold.of(_formKey.currentContext).showSnackBar(SnackBar(
                  content: Text('Saving'),
                  duration: Duration(seconds: 30),
                  onVisible: () async {
                    var newDatastore = Datastore(name: this.datastore.name, type: 'local', settings: {
                      "biometric": _biometric.toString(),
                      "timeout": _timeout.toString(),
                    });
                    await LocalDSProvider.db.create(newDatastore);
                    var nav = Navigator.of(context);
                    nav.pop();
                    nav.pop();
                  },
                ));
              }
            },
            tooltip: 'Add Datastore',
            child: Icon(Icons.save),
          ),
    );
  }
}