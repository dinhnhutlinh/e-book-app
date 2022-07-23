import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  final TextEditingController controller;

  final FormFieldValidator<String>? validator;

  const InputForm({
    Key? key,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final bool _isHide = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: const InputDecoration(border: OutlineInputBorder()),
      validator: widget.validator,
    );
  }
}
