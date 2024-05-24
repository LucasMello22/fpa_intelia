import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário'),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ),
      body: Center(
        child: Text(
          'Página do Usuário',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
