import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:flutter_template/core/util/translator.dart';

import '../../util/sizes.dart';


class PrimaryDatePicker extends FormField<DateTime> {
  PrimaryDatePicker(
      {Key? key,
      FormFieldSetter<DateTime>? onSaved,
      FormFieldValidator<DateTime>? validator,
      DateTime? minimumDate, firstDate, initialValue,
      String? title,
      String? labelText,
      bool hasBottomPadding = true,

        void Function(DateTime?)? onChanged,
      AutovalidateMode autoValidate = AutovalidateMode.onUserInteraction,
        InputDecoration? decoration, String? validatorText})
      : super(
            key: key,
            onSaved: onSaved,
            validator: validator??(value) => value == null
                ? validatorText
                : null,
            initialValue: initialValue,
            autovalidateMode: autoValidate,
            builder: (FormFieldState<DateTime> state) {
              final tr = state.context.tr;

              return Padding(
                padding:  EdgeInsets.only(bottom: hasBottomPadding?AppSizes.inputFieldSpace:0),
                child: GestureDetector(
                  onTap: () async {
                    _showDialog(
                      state.context,
                      CupertinoDatePicker(
                        initialDateTime: state.value,
                        mode: CupertinoDatePickerMode.date,
                        dateOrder: DatePickerDateOrder.ymd,
                        minimumYear: minimumDate?.year??DateTime.now().year-1,
                        use24hFormat: true,
                        onDateTimeChanged: (DateTime newTime) {
                          onChanged?.call(newTime);
                          state.didChange(newTime);
                        },
                      ),
                    );
                    // final dt = await showDatePicker(
                    //     context: state.context,
                    //     initialDate:
                    //         state.value ?? DateTime.now().add(Duration(days: 1)),
                    //     firstDate: firstDate,
                    //     lastDate: DateTime(2025));
                    //
                    // if (dt != null) {
                    //   onChanged?.call(dt);
                    //   state.didChange(dt);
                    // }
                  },
                  child: InputDecorator(
                    isFocused: false,
                    isEmpty: state.value == null,
                    isHovering: false,
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        errorText: state.errorText,
                        suffixIcon: const Icon(CupertinoIcons.calendar_today),
                        labelText: labelText,
                        hintText: tr.date),
                    child: state.value != null
                        ? Text(
                            DateFormat.yMMMd().format(state.value!),
                          )
                        : null,
                  ),
                ),
              );
            });

 static void _showDialog(BuildContext context,Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 300,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system
          // navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                Expanded(child: child),
                Material(
                    color: Colors.transparent,
                    child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: Text("Done"))),
                SizedBox(height: 15,),
              ],
            ),
          ),
        ));
  }
}

class TimePickerCard extends FormField<TimeOfDay> {
  TimePickerCard(
      {Key? key,
      FormFieldSetter<TimeOfDay>? onSaved,
      FormFieldValidator<TimeOfDay>? validator,
      TimeOfDay? initialValue,
      required TimeOfDay firstTime,
      String? title,
      void Function(TimeOfDay?)? onChanged,
      AutovalidateMode autoValidate = AutovalidateMode.onUserInteraction})
      : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: autoValidate,
            builder: (FormFieldState<TimeOfDay> state) {
              final tr = AppLocalizations.of(state.context)!;

              return GestureDetector(
                onTap: () async {
                  final dt = await showTimePicker(
                      context: state.context,
                      initialTime: state.value ?? TimeOfDay.now());

                  if (dt != null) {
                    onChanged?.call(dt);
                    state.didChange(dt);
                  }
                },
                child: InputDecorator(
                  isFocused: false,
                  isEmpty: state.value == null,
                  isHovering: false,
                  decoration: InputDecoration().copyWith(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      errorText: state.errorText,
                      suffixIcon: const Icon(Icons.access_time_rounded),
                      hintText: "Time"),
                  child: state.value != null
                      ? Text(state.value!.format(state.context))
                      : null,
                ),
              );
            });
}
