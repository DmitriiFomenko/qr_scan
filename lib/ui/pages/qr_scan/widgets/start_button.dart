import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text(
          'start',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
