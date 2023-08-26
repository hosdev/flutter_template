import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/theme/text_theme.dart';

import '../../theme/app_colors.dart';


class PrimaryButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final Color? color;
  final Color? textColor;
  final bool isLoading;
  final double padding;
  const PrimaryButton({
    Key? key, required this.onTap, required this.text,this.padding=20, this.color,this.isLoading=false, this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:   EdgeInsets.symmetric(horizontal:padding),

      child: GestureDetector(

        onTap:isLoading?null: (){
          HapticFeedback.lightImpact();
          onTap?.call();
        },
        child: AnimatedContainer(
          curve: Curves.easeInOutQuad,
          duration:  const Duration(milliseconds: 400),
          margin:const EdgeInsets.all(2),
          height: 50.h,
          width:isLoading?50.w: 350.w,
          decoration: BoxDecoration(
              color: color??(onTap==null?Colors.grey.shade400:isLoading?context.appColors.gray:context.appColors.primary),
              borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(color: context.appColors.primary.shade200,blurRadius: 0,spreadRadius: 0)
            ]
          ),
          child: isLoading?
          FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 300)),
            builder:(_,c)=> c.connectionState == ConnectionState.waiting
                ?const SizedBox()
                : Padding(
              padding:const EdgeInsets.all(15.0),
              child: CircularProgressIndicator(color:context.appColors.primary,),
            ),
          )
              :Center(
              child: Text(text,textAlign:TextAlign.center ,
                style:TypographyAppBold .bodyM.copyWith(color:textColor??Colors.white),)
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final Color? color;
  final Color? textColor;
  final double padding;
  const SecondaryButton({
    Key? key, required this.onTap, required this.text,this.padding=20, this.color, this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:   EdgeInsets.symmetric(horizontal:padding),

      child: GestureDetector(

        onTap: (){
          HapticFeedback.lightImpact();
          onTap?.call();
        },
        child: AnimatedContainer(
          curve: Curves.easeInOutQuad,
          duration:  const Duration(milliseconds: 400),
          margin:const EdgeInsets.all(2),
          height: 50.h,
          width:350.w,
          decoration: BoxDecoration(
              color: color??(onTap==null?Colors.grey.shade400:context.appColors.primary.shade200),
              borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
              child: Text(text,textAlign:TextAlign.center ,
                style: TypographyAppBold .bodyM.copyWith(color:textColor??Colors.white),)
          ),
        ),
      ),
    );
  }
}


