import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String)? onSubmitted;
  final String? label;

  AdaptativeTextField({
    required this.controller,
    required this.keyboardType,
    this.onSubmitted,
    this.label
});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoTextField(
      controller: controller,
      keyboardType: keyboardType,
      onSubmitted: onSubmitted,
      placeholder: label,

    ) :TextField(
      controller: controller,
      keyboardType: keyboardType,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: label,
      ),
    ) ;
  }
}
