import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  final String message;

  const ErrorTextWidget({super.key, this.message = "An error occurred"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}