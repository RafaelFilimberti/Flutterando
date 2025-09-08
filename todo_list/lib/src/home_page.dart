import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Todo\'S')),

      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(title: Text('item $index'));
        },
      ),
    );
  }
}
