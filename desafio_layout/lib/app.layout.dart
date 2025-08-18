import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Changer',
      home: Scaffold(
        backgroundColor: Color(0xFFF15A5A),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 150),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Image.asset(
                    'assets/images/icone.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Location Changer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Plugin app for Linder',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  //logica botão
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                ),
                child: Text('Login with Facebook',
                style: TextStyle(
                  color: Color(0xFFF15A5A),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
