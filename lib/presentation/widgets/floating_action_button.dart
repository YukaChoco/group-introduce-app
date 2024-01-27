import 'package:flutter/material.dart';

class FloatinActionButtonWidget extends StatelessWidget {
  const FloatinActionButtonWidget({Key? key, required this.onPressed,required this.tooltip,required this.icon}) : super(key: key);

  final VoidCallback onPressed;
  final String tooltip;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      child: Icon(icon),
    );
  }
}
