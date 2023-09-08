import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.purple,
      borderRadius: BorderRadius.circular(2),
      child: InkWell(
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "CustomButton",
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
