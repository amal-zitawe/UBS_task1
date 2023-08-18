import 'package:flutter/material.dart';
import 'app_bar.dart';

bool isTabOpen = false;

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isTabOpen: isTabOpen),
      body: const Text(
        'List',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
