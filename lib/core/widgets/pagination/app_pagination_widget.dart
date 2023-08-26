import 'package:flutter/material.dart';
import 'package:flutter_template/core/response/response.dart';
import 'package:flutter_template/core/util/translator.dart';
import 'app_pagination_controller.dart';
import '../error_widget.dart';
import '../loading_widget.dart';

typedef ItemWidgetBuilder<ItemType> = Widget Function(
  BuildContext context,
  ItemType item,
  int index,
);

///Grid Pagination
class GridViewPagination<V> extends StatefulWidget {
  final AppPaginationController<V> controller;
  final ItemWidgetBuilder<V> successBuilder;
  final Widget Function()? loadingBuilder;
  final Widget Function(String message)? errorBuilder;
  final Widget Function(String message)? emptyBuilder;
  final SliverGridDelegate gridDelegate;
  final EdgeInsetsGeometry? padding;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;

  const GridViewPagination({
    super.key,
    required this.controller,
    required this.successBuilder,
    required this.gridDelegate,
    this.padding,
    this.loadingBuilder,
    this.errorBuilder,
    this.emptyBuilder,
    this.scrollController,
    this.physics,
  });

  @override
  State createState() => _GridViewPaginationState();
}

class _GridViewPaginationState<V> extends State<GridViewPagination<V>> {
  @override
  void initState() {
    widget.controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (context, c) {
          final value = widget.controller.value;
          if (value.last.status == ApiResStatus.error) {
            return widget.errorBuilder?.call(value.last.message) ??
                ErrorApiWidget(errorMessage: value.last.message);
          }
          if (value.length == 1 &&
              value.single.status == ApiResStatus.loading) {
            return widget.loadingBuilder?.call() ?? const LoadingWidget();
          }
          final items = value
              .where((e) => e.status == ApiResStatus.completed)
              .map((e) => e.data)
              .expand((element) => element)
              .toList();
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification sn) {
              if (sn is ScrollUpdateNotification &&
                  sn.metrics.pixels == sn.metrics.maxScrollExtent) {
                widget.controller.fetchPage();
              }
              return true;
            },
            child: items.isEmpty
                ? Center(
                    child: widget.emptyBuilder?.call(value.last.message) ??
                        Text(context.tr.noResult))
                : CustomScrollView(
                    physics: widget.physics,
                    controller: widget.scrollController,
                    slivers: <Widget>[
                      SliverPadding(
                        padding: widget.padding ?? EdgeInsets.zero,
                        sliver: SliverGrid(
                          gridDelegate: widget.gridDelegate,
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => widget.successBuilder(
                                context, items[index], index),
                            childCount: items.length,
                            addAutomaticKeepAlives: true,
                            addRepaintBoundaries: true,
                            addSemanticIndexes: true,
                          ),
                        ),
                      ),
                      if (widget.controller.loadingMore)
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: 5,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: LinearProgressIndicator())),
                          ),
                        ),
                    ],
                  ),
          );
        });
  }
}

///List Pagination
class ListViewPagination<V> extends StatefulWidget {
  final AppPaginationController<V> controller;
  final ItemWidgetBuilder<V> successBuilder;
  final Widget Function()? loadingBuilder;
  final Widget Function(String message)? errorBuilder;
  final Widget Function(String message)? emptyBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final EdgeInsets? padding;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;
  const ListViewPagination(
      {super.key,
      required this.controller,
      required this.successBuilder,
      this.loadingBuilder,
      this.errorBuilder,
      this.emptyBuilder,
      this.padding,
      this.separatorBuilder,
      this.scrollController,
      this.physics});

  @override
  State createState() => _ListViewPaginationState();
}

class _ListViewPaginationState<V> extends State<ListViewPagination<V>> {
  @override
  void initState() {
    widget.controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (context, c) {
          final value = widget.controller.value;
          if (value.last.status == ApiResStatus.error) {
            return widget.errorBuilder?.call(value.last.message) ??
                ErrorApiWidget(errorMessage: value.last.message);
          }
          if (value.length == 1 &&
              value.single.status == ApiResStatus.loading) {
            return widget.loadingBuilder?.call() ?? const LoadingWidget();
          }
          final items = value
              .where((e) => e.status == ApiResStatus.completed)
              .map((e) => e.data)
              .expand((element) => element)
              .toList();
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification sn) {
              if (sn.metrics.pixels == sn.metrics.maxScrollExtent) {
                widget.controller.fetchPage();
              }
              return true;
            },
            child: CustomScrollView(
              controller: widget.scrollController,
              physics: widget.physics,
              slivers: <Widget>[
                items.isEmpty
                    ? SliverToBoxAdapter(
                        child: Center(
                            child:
                                widget.emptyBuilder?.call(value.last.message) ??
                                    Text(context.tr.noResult)),
                      )
                    : SliverPadding(
                        padding: widget.padding ?? EdgeInsets.zero,
                        sliver: SliverList.separated(
                          separatorBuilder: widget.separatorBuilder ??
                              (context, index) => const SizedBox(height: 20),
                          itemBuilder: (context, index) => widget
                              .successBuilder(context, items[index], index),
                          itemCount: items.length,
                          addAutomaticKeepAlives: true,
                          addRepaintBoundaries: true,
                          addSemanticIndexes: true,
                        ),
                      ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                        height: 5,
                        child: widget.controller.loadingMore
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: LinearProgressIndicator())
                            : null),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

///Page Pagination
class PageViewPagination<V> extends StatefulWidget {


  final AppPaginationController<V> controller;
  final ItemWidgetBuilder<V> successBuilder;
  final Widget Function()? loadingBuilder;
  final Widget Function(String message)? errorBuilder;
  final Widget Function(String message)? emptyBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final EdgeInsets? padding;
  final PageController pageController;
  final ScrollPhysics? physics;
  final void Function(int)? onPageChanged;
   PageViewPagination(
      {super.key,
        required this.controller,
        required this.successBuilder,
        this.loadingBuilder,
        this.errorBuilder,
        this.emptyBuilder,
        this.padding,
        this.separatorBuilder,
        required PageController? pageController ,
        this.physics, this.onPageChanged}): pageController = pageController ?? PageController();
  @override
  State createState() => _PageViewPaginationState();
}

class _PageViewPaginationState<V> extends State<PageViewPagination<V>> {



  void listener(){
    widget.pageController;
  }

  @override
  void initState() {
    widget.controller.init();
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (context, c) {
          final value = widget.controller.value;
          if (value.last.status == ApiResStatus.error) {
            return widget.errorBuilder?.call(value.last.message) ??
                ErrorApiWidget(errorMessage: value.last.message);
          }
          if (value.length == 1 &&
              value.single.status == ApiResStatus.loading) {
            return widget.loadingBuilder?.call() ?? const LoadingWidget();
          }
          final items = value
              .where((e) => e.status == ApiResStatus.completed)
              .map((e) => e.data)
              .expand((element) => element)
              .toList();
          return items.isEmpty
              ? Center(
                  child:
                  widget.emptyBuilder?.call(value.last.message) ??
                      Text(context.tr.noResult))
              : PageView.builder(
            controller: widget.pageController,
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, index) => widget
                .successBuilder(context, items[index], index),
            onPageChanged: (value) {
              widget.onPageChanged?.call(value);
              if (value == items.length - 1) {
                widget.controller.fetchPage();
              }
            },
          );
        });
  }
}
