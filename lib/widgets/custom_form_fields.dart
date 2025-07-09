import 'package:flutter/material.dart';

class CustomDropdownFormField extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;

  const CustomDropdownFormField({
    Key? key,
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: value,
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final TextInputType keyboardType;
  final Function(String) onChanged;

  const CustomTextField({
    Key? key,
    required this.label,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        initialValue: initialValue,
        onChanged: onChanged,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
