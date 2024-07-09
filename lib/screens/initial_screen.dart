import 'package:flutter/material.dart';

class Initial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade800, Colors.green.shade600],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo1.png',
                  height: 150.0, // Ajuste o tamanho da imagem conforme necessário
                ),
                SizedBox(height: 40.0),
                Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 200.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.green.shade800,
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text(
                          'Iniciar',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade800,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 200.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/user');
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.green.shade800,
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text(
                          'Usuário',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
