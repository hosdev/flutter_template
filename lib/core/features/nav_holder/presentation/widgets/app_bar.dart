import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import '../../../../theme/text_theme.dart';
import '../../../../util/gen/assets.gen.dart';
import '../../../../widgets/primary_appbar.dart';

class RootPrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RootPrimaryAppBar({
    Key? key,
    required this.index,
    required this.onOpenDrawer,
  }) : super(key: key);
  final void Function() onOpenDrawer;
  final int index;
  @override
  Widget build(BuildContext context) {
    return PrimaryAppBar(
      title: Container(
        child: Row(
          children: [

            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Good Morning 👋",textAlign: TextAlign.start,style: TypographyAppRegular.heading5,),
                Text("Hosam Abufasha",textAlign: TextAlign.start,style: TypographyAppBold.heading6,),
              ],
            )),
            SizedBox(width: 20,),
            GestureDetector(
              onTap: () => null,
              child: SvgPicture.asset(
                Assets.iconly.curved.notification,
                color: Colors.white,
                height: 27,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String title(BuildContext context) {
    if (index == 0) {
      return "Home";
    }
    if (index == 1) {
      return "";
    }
    if (index == 2) {
      return "";
    }
    if (index == 3) {
      return "";
    }
    return "";
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
