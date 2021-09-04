import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final String? Function(String?) validator;
  final TextInputType textInputType;
  final String? Function(String?) save;
  MyTextField(
      this.hint, this.icon, this.textInputType, this.save, this.validator);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon),
          Container(
            width: Get.width - 80,
            child: TextFormField(
              decoration: InputDecoration(hintText: hint),
              validator: validator,
              keyboardType: textInputType,
              onSaved: save,
            ),
          ),
        ],
      ),
    );
  }
}
