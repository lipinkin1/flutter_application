// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageView(
        children: [
          Screen1(),
          Screen2(),
        ],
      ),
      theme: ThemeData(
  textTheme: GoogleFonts.bungeeSpiceTextTheme(),
),

      debugShowCheckedModeBanner: false
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('from LETO'),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Text(
              'COOLGRAM',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('swipe right to register ->',
                  textDirection: TextDirection.ltr),
            ),
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _formKey = GlobalKey<FormState>();
  String _status = 'busy';
  String _status1 = 'busy';

  void _buyCrypto() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final message = 'success';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  void _sellCrypto() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final message = 'well please register';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
  'registration',
  style: GoogleFonts.bungeeSpice(),
),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                onSaved: (value) => _status = value!,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'login',
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                onSaved: (value) => _status1 = value!,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _buyCrypto,
                    child: Text('register'),
                  ),
                  ElevatedButton(
                    onPressed: _sellCrypto,
                    child: Text('exit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}