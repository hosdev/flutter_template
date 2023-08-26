import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/features/home/presentation/home_page/home_viewmodel.dart';
import 'package:flutter_template/core/features/home/presentation/home_page/widgets/home_banner.dart';
import 'package:flutter_template/core/features/home/presentation/home_page/widgets/home_header.dart';
import 'package:flutter_template/core/features/home/presentation/home_page/widgets/home_search_box.dart';
import 'package:flutter_template/core/features/home/presentation/home_page/widgets/shimmers/home_banner_shimmer.dart';
import 'package:flutter_template/core/util/translator.dart';
import 'package:flutter_template/core/widgets/primary_future_builder.dart';
import 'package:flutter_template/core/widgets/shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return Scaffold(
      appBar: const HomeHeader(),
      body: Shimmer(
        child: Consumer(
          builder: (context, ref, child) {
            final homVM = ref.watch(homePageViewModelProvider);
            return SafeArea(
              child: RefreshIndicator(
                onRefresh: homVM.refresh,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    children: [
                      const HomeSearchBox(),
                      SizedBox(
                        height: 15.h,
                      ),
                      PrimaryFutureBuilder(
                        controller: homVM.bannersController,
                        loadingBuilder: () => const HomeBannerShimmer(),
                        successBuilder: (data) => HomeBanner(
                          cards: data,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
