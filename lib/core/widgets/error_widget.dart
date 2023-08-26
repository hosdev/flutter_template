import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/util/gen/assets.gen.dart';

class ErrorApiWidget extends StatelessWidget {
  final String errorMessage;

  final VoidCallback? onRetryPressed;

  const ErrorApiWidget(
      {Key? key, required this.errorMessage, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(Assets.images.notFound.path,width: 300.w),
          const SizedBox(height: 8),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          if (onRetryPressed != null)
            ElevatedButton(
              child: Text("retry", style: const TextStyle(color: Colors.white)),
              onPressed: onRetryPressed,
            )
        ],
      ),
    );
  }
}
