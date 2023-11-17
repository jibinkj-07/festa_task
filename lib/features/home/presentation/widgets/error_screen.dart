import 'package:flutter/material.dart';
import '../../../../core/utils/widgets/app_button.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;
  const ErrorScreen({Key? key, required this.error, required this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error),
          AppButton(
            onPressed: onRetry,
            child: const Text("Retry"),
          )
        ],
      ),
    );
  }
}
