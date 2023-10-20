import 'package:flutter/material.dart';

class FailurePage extends StatelessWidget {
  const FailurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Oops! Something went wrong, try again',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
