

import 'package:flutter/material.dart';
import 'package:flutter_template/core/theme/app_colors.dart';

import '../theme/text_theme.dart';


class ChoiceFilterWidget extends StatelessWidget {
  const ChoiceFilterWidget({Key? key, required this.title,required this.selected,required this.onSelected}) : super(key: key);
  final String title;
  final bool selected;
  final void Function() onSelected;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      borderRadius: BorderRadius.circular(15),

      child: AnimatedContainer(
        decoration: BoxDecoration(
            color: selected ? context.appColors.primary : null,
            shape: BoxShape.rectangle,
            border: Border.all(color: context.appColors.primary),
            borderRadius: BorderRadius.circular(30)),
        duration: const Duration(milliseconds: 200),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: Text(
            title,textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : context.appColors.primary),
          ),
        ),
      ),
    );
  }
}