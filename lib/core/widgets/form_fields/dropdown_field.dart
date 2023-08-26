import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_theme.dart';
import '../../util/sizes.dart';
import '../../util/translator.dart';

class PrimaryDropdownField<T> extends FormField<T> {
  PrimaryDropdownField({
    super.key,
    required List<DropdownMenuItem<T>>? items,
    DropdownButtonBuilder? selectedItemBuilder,
    T? value,
    required this.onChanged,
    VoidCallback? onTap,
    TextStyle? style,
    Widget? icon,
    bool isDense = true,
    bool isExpanded = false,
    bool hasBottomPadding = true,
    Color? focusColor,
    FocusNode? focusNode,
    bool autofocus = false,
    InputDecoration? decoration,
    String? validatorText,
    super.onSaved,
    String? Function(T?)? validator,
    AutovalidateMode? autovalidateMode,
    AlignmentGeometry alignment = AlignmentDirectional.centerStart,
    String? labelText,
    String? hintText,
  })  : decoration = decoration ?? InputDecoration(focusColor: focusColor),
        super(
          initialValue: value,
        validator: validator??(value) => value == null
            ? validatorText
            : null,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          builder: (FormFieldState<T> field) {
            final _DropdownButtonFormFieldState<T> state =
                field as _DropdownButtonFormFieldState<T>;
            final InputDecoration decorationArg =
                decoration ?? InputDecoration(focusColor: focusColor);
            final InputDecoration effectiveDecoration =
                decorationArg.applyDefaults(
              Theme.of(field.context).inputDecorationTheme,
            );

            final bool showSelectedItem = items != null &&
                items
                    .where(
                        (DropdownMenuItem<T> item) => item.value == state.value)
                    .isNotEmpty;

            final bool isEmpty = !showSelectedItem;
            final DropdownMenuItem<T>? selectedItem = showSelectedItem
                ? items.firstWhere(
                    (element) => element.value == state.value,
                  )
                : null;

            return Builder(builder: (BuildContext context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      if (items != null && items.isNotEmpty) {
                        final v = await showCupertinoModalPopup(
                            context: context,
                            builder: (_) => items.length > 20
                                ? _SelectSheetWithSearch(
                                    items: items,
                                    oldSelectedValue: state.value,
                                    title:  labelText ??hintText?? context.tr.select,
                                  )
                                : _SheetSelect(
                                    items: items,
                                    oldSelectedValue: state.value,
                                    title: labelText ??hintText?? context.tr.select,
                                  ));
                        if (v != null) {
                          state.didChange(v);
                        }
                      }
                    },
                    child: InputDecorator(
                      isEmpty: isEmpty,
                      expands: isExpanded,
                      decoration: effectiveDecoration.copyWith(
                        hintText: hintText,
                        labelText: labelText,
                        suffixIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.arrow_drop_down_outlined,),
                        ),
                        alignLabelWithHint: false,
                        errorText: state.errorText
                      ),
                      child: Container(
                        alignment: alignment,
                        child: selectedItem?.child,
                      ),
                    ),
                  ),
                  if (hasBottomPadding)
                    const SizedBox(
                      height: AppSizes.inputFieldSpace,
                    ),
                ],
              );
            });
          },
        );

  final ValueChanged<T?>? onChanged;
  final InputDecoration decoration;

  @override
  FormFieldState<T> createState() => _DropdownButtonFormFieldState<T>();
}

class _DropdownButtonFormFieldState<T> extends FormFieldState<T> {
  void listener() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChange(T? value) {
    super.didChange(value);
    final PrimaryDropdownField<T> dropdownButtonFormField =
        widget as PrimaryDropdownField<T>;
    assert(dropdownButtonFormField.onChanged != null);
    dropdownButtonFormField.onChanged!(value);
  }

  @override
  void didUpdateWidget(PrimaryDropdownField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      setValue(widget.initialValue);
    }
  }
}

///when big values
class _SelectSheetWithSearch<T> extends StatefulWidget {
  const _SelectSheetWithSearch(
      {Key? key,
      required this.items,
      this.oldSelectedValue,
      required this.title})
      : super(key: key);
  final List<DropdownMenuItem<T>> items;
  final T? oldSelectedValue;
  final String title;
  @override
  State<_SelectSheetWithSearch<T>> createState() =>
      _SelectSheetWithSearchState<T>();
}

class _SelectSheetWithSearchState<T> extends State<_SelectSheetWithSearch<T>> {
  T? selectedValue;
  String search = '';

  void onChange(T? v) {
    setState(() {
      selectedValue = v;
    });
    Navigator.pop(context, selectedValue);
  }

  @override
  void initState() {
    selectedValue = widget.oldSelectedValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    List<DropdownMenuItem<T>> itemsFiltered = widget.items.first.child is Text
        ? widget.items
            .where((element) =>
                (element.child as Text).data?.toLowerCase().contains(search) ??
                false)
            .toList()
        : [];
    return Material(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            TextField(
              onChanged: (s) => setState(() => search = s),
              decoration:  InputDecoration(hintText: context.tr.search),
            ),
            Scrollbar(
              thumbVisibility: true,
              child: LimitedBox(
                maxHeight: MediaQuery.of(context).size.height / 1.5,
                child: ListView.builder(
                  itemCount: itemsFiltered.length,
                  itemBuilder: (context, index) => RadioListTile<T?>(
                    groupValue: selectedValue,
                    value: itemsFiltered[index].value,
                    title: itemsFiltered[index].child,
                    onChanged: onChange,
                  ),
                ),
              ),
            ),
            //  SizedBox(height: 30),
            // PrimaryButton(onTap: ()=>Navigator.pop(context,selectedValue),text: tr.done,)
          ],
        ),
      ),
    );
  }
}

class _SheetSelect<T> extends StatefulWidget {
  const _SheetSelect({
    Key? key,
    required this.items,
    this.oldSelectedValue,
    required this.title,
  }) : super(key: key);
  final List<DropdownMenuItem<T>> items;
  final T? oldSelectedValue;
  final String title;
  @override
  State<_SheetSelect<T>> createState() => _SheetSelectState<T>();
}

class _SheetSelectState<T> extends State<_SheetSelect<T>> {
  T? selectedValue;

  void onChange(T? v) {
    setState(() {
      selectedValue = v;
    });
    Navigator.pop(context, selectedValue);
  }

  @override
  void initState() {
    selectedValue = widget.oldSelectedValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Scrollbar(
              thumbVisibility: true,
              child: LimitedBox(
                maxHeight: MediaQuery.of(context).size.height / 2,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: widget.items
                        .map((e) => RadioListTile<T?>(
                              groupValue: selectedValue,
                              value: e.value,
                              title: e.child,
                              onChanged: onChange,
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            //  SizedBox(height: 30),
            // PrimaryButton(onTap: ()=>Navigator.pop(context,selectedValue),text: tr.done,)
          ],
        ),
      ),
    );
  }
}
