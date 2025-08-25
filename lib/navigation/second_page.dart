import 'package:flutter/material.dart';

import 'package:kayaku_widget_app/models/category.dart';

class SecondPage extends StatefulWidget {
  final List<Category> categories;
  const SecondPage({super.key, required this.categories});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categories.isNotEmpty ? widget.categories[0].name : 'Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Second Page!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back to First Page'),
            ),
          ],
        ),
      ),
    );
  }
}
