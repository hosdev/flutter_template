import 'package:flutter/material.dart';
import 'package:flutter_template/core/widgets/loading_widget.dart';

class LoadingHolder extends StatelessWidget {
  const LoadingHolder({Key? key, required this.child, required this.loading})
      : super(key: key);
  final Widget child;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (loading)
          const ModalBarrier(
            color: Colors.black45,
          ),
        if (loading) LoadingWidget()
      ],
    );
  }
}
