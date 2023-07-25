import 'package:flutter/material.dart';

class TextBottomWidget extends StatelessWidget {
  const TextBottomWidget({
    super.key,
    required this.textStyle,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 185,
      child: Column(
        children: [
          Text(
            "Нажмите на шар",
            style: textStyle,
          ),
          Text(
            "или потрясите телефон",
            style: textStyle,
          )
        ],
      ),
    );
  }
}