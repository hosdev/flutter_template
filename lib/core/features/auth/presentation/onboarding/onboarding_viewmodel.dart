import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/data/api/api_requests.dart';
import 'package:flutter_template/core/features/auth/models/onboarding_model.dart';
import 'package:flutter_template/core/features/auth/repositories/auth_repository.dart';
import 'package:flutter_template/core/features/auth/repositories/auth_repository_imp.dart';

import '../../../../widgets/primary_future_builder.dart';

  final onBoardingVMProvider = Provider.autoDispose<OnBoardingState>((ref) {
  final apiController = ref.read(apiControllerProvider);
  return OnBoardingState(
      repository: AuthAppRepositoryImpl(remoteDataSource: apiController));
});

class OnBoardingState {
  final AuthAppRepository repository;
  OnBoardingState({required this.repository}) {
    futureController.addFutureCall(repository.getOnboarding);
  }
  final FutureBuilderController<List<OnboardingModel>> futureController =
      FutureBuilderController();
}
