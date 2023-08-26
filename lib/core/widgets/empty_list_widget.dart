import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/util/translator.dart';
import 'package:flutter_template/core/theme/text_theme.dart';

import '../util/gen/assets.gen.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key, this.onRefresh, this.text}) : super(key: key);
  final VoidCallback? onRefresh;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

              Image.asset(Assets.images.notFound.path,width: 300.w),
            const SizedBox(height: 8),
            Text(
              text ?? context.tr.noResult,
              textAlign: TextAlign.center,
              style: TypographyAppMedium.bodyXL,
            ),
          ],
        ),
      ),
    );
  }
}
