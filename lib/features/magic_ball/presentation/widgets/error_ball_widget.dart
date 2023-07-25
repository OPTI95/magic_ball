import 'package:flutter/material.dart';

class ErrorBallWidget extends StatelessWidget {
  const ErrorBallWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.normal,
            color: Colors.red.withOpacity(0.5),
            blurRadius: 130,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }
}
