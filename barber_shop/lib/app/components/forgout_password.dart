import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgoutPasswordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
            text: 'Esqueceu a senha?',
            style: TextStyle(color: Colors.white, fontSize: 12),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('Esqueceu a senha?"');
              }),
      ),
    );
  }
}
