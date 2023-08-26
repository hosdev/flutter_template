import 'package:flutter/material.dart';
import 'package:flutter_template/core/response/response.dart';


class AppPaginationController<T> extends ChangeNotifier {
  AppPaginationController();
  Future<AppResponse<List<T>>> Function(int page)? future;
  bool mounted = true;
  bool isLastPage = false;
  bool _loadingMore = false;
  bool get loadingMore => _loadingMore;
  set loadingMoreSet(bool value) {
    _loadingMore = value;
    notifyListeners();
  }

  int pageSize = 10;
  int pageKey = 1;
  List<AppResponse<List<T>>> value = [
    AppResponse<List<T>>(status: ApiResStatus.loading)
  ];
  void addFutureCall(
      Future<AppResponse<List<T>>> Function(int page) futureCallBack,{int? pageSize}) {
    this.pageSize = pageSize??this.pageSize;
    future = futureCallBack;
    notifyListeners();
  }

  void init() async {
    if (future != null&&value.length<2) {
      fetchPage();
    }
    notifyListeners();
  }

  void refresh() async {
    pageKey = 1;
    isLastPage = false;
    value = [AppResponse<List<T>>(status: ApiResStatus.loading)];
    notifyListeners();
    if (future != null) {
      fetchPage();
    }
    notifyListeners();
  }

  Future<void> fetchPage() async {
    if(loadingMore||isLastPage){
      return;
    }
    loadingMoreSet = true;
    final res = await future!(pageKey);
    if(res.status==ApiResStatus.error){
      value = [...value, res];
      isLastPage = true;
      loadingMoreSet = false;
      return;
    }
    final newItems = res.data;
    isLastPage = newItems.length < pageSize;
    value = [...value, res];
    loadingMoreSet = false;
    ++pageKey;
  }
}
