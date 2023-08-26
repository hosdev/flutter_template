import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/data/api/api_requests.dart';
import 'package:flutter_template/core/features/home/models/banner_model.dart';
import 'package:flutter_template/core/features/home/repositories/home_repository.dart';
import 'package:flutter_template/core/widgets/primary_future_builder.dart';

final homePageViewModelProvider = ChangeNotifierProvider(
  (ref) => HomePageViewModel(
      homeRepository:
          HomeRepository(remoteDataSource: ref.read(apiControllerProvider))),
);

class HomePageViewModel extends ChangeNotifier {
  final HomeRepository homeRepository;
  HomePageViewModel({required this.homeRepository}) {
    bannersController.addFutureCall(homeRepository.getBanners);
  }

  final FutureBuilderController<List<BannerModel>> bannersController =
      FutureBuilderController();

  Future<void> refresh() async {
    bannersController.refresh();
  }

  @override
  void dispose() {
    bannersController.dispose();
    super.dispose();
  }
}
