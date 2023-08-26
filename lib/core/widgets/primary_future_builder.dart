import 'package:flutter/material.dart';
import '../response/response.dart';
import 'empty_list_widget.dart';
import 'error_widget.dart';
import 'loading_widget.dart';

class PrimaryFutureBuilder<T> extends StatefulWidget {
  const PrimaryFutureBuilder({
    Key? key,
    required this.controller,
    required this.successBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.emptyBuilder,
  }) : super(key: key);
  final Widget Function(T data) successBuilder;
  final Widget Function()? loadingBuilder;
  final Widget Function(String message)? errorBuilder;
  final Widget Function(String message)? emptyBuilder;
  final FutureBuilderController<T> controller;

  @override
  State<PrimaryFutureBuilder<T>> createState() =>
      _PrimaryFutureBuilderState<T>();
}

class _PrimaryFutureBuilderState<T> extends State<PrimaryFutureBuilder<T>> {
  @override
  void initState() {
    widget.controller.init();
    super.initState();
  }

  @override
  void dispose() {
    // widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.controller,
        builder: (context, value, c) {
          Widget child;
          switch (value.status) {

            case ApiResStatus.loading:
              child = widget.loadingBuilder?.call() ?? const LoadingWidget();
              break;
            case ApiResStatus.error:
              child = widget.errorBuilder?.call(value.message) ??
                  ErrorApiWidget(errorMessage: value.message);
              break;

            case ApiResStatus.empty:
              child = widget.emptyBuilder?.call(value.message) ??
                  const EmptyWidget();
              break;
            case ApiResStatus.completed:
              child = widget.successBuilder(value.data);
              break;
          }
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              key: ObjectKey(value.status),
              child: child,
            ),
          );
        });
  }
}

class FutureBuilderController<T> extends ValueNotifier<AppResponse<T>> {
  FutureBuilderController()
      : super(AppResponse<T>(status: ApiResStatus.loading));
  Future<AppResponse<T>> Function()? future;
  bool mounted = true;

  void addFutureCall(Future<AppResponse<T>> Function() futureCallBack) {
    future = futureCallBack;
  }

  void init() async {
    if (future != null&&value.status!=ApiResStatus.completed) {
      value = await future!.call();
    }
  }

  void refresh() async {
    value = AppResponse<T>(status: ApiResStatus.loading);
    if (future != null) {
      value = await future!.call();
    }
  }
  void refreshWithoutLoading() async {
    if (future != null) {
      value = await future!.call();
    }
  }
}

