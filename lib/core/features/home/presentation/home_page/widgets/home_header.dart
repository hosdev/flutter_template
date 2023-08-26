import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/services/faker.dart';
import 'package:flutter_template/core/features/nav_holder/presentation/nav_holder.dart';
import 'package:flutter_template/core/features/nav_holder/presentation/nav_holder_viewmodel.dart';
import 'package:flutter_template/core/services/user_global_state.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/core/util/translator.dart';
import '../../../../../theme/text_theme.dart';
import '../../../../../widgets/primary_appbar.dart';

class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return PrimaryAppBar(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      // shadowColor: context.appColors.surface,
      // toolbarHeight: 70.h,
      title: Consumer(
        builder: (context, ref, child) {
          final vm = ref.watch(userGlobalStateProvider);
          final user = vm.userDetails;
          return Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tr.welcomeBack,
                      textAlign: TextAlign.start,
                      style: TypographyAppRegular.bodyS
                          .copyWith(color: context.appColors.subText),
                    ),
                    Text(
                      user?.fullName ?? tr.guestUser,
                      textAlign: TextAlign.start,
                      style: TypographyAppBold.heading5.copyWith(color: context.appColors.text),
                    ),
                  ],
                ),
              ),
               SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                onTap: () => ref.read(navHolderViewModelProvider).onChangeIndex(NavPagesData.profile),
                child: CircleAvatar(
                  radius: 27.r,
                  backgroundColor: context.appColors.primary,
                  child: CircleAvatar(
                    backgroundImage:
                    NetworkImage(user?.image ?? FakerHelper.image),
                    radius: 26.r,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(70.h);
}
