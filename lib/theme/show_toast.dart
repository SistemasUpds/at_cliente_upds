import 'package:at_cliente_upds/theme/colors.dart';
import 'package:flutter/material.dart';

void showToastMessage(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(
        message,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: negro, fontWeight: FontWeight.bold, fontSize: 25),
      ),
      backgroundColor: rojoNaranja,
      duration: const Duration(seconds: 2),
    ),
  );
}
