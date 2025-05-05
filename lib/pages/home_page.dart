import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Refactor')),
      body: Column(
        children: [
          _buildElevatedButton(),
          _buildElevatedButton(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
            ),
            onPressed: () {},
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  ElevatedButton _buildElevatedButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      onPressed: () {},
      child: Text('Click Me'),
    );
  }
}
