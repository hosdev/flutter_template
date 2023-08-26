import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive()
        // PhysicalModel(
        //   shape: BoxShape.circle,
        //   color: Colors.grey,
        //   elevation: 3,
        //   child: CircleAvatar(
        //     radius: 60,
        //     child: RotationTransition(
        //       turns: _animation,
        //       child:  Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Image.asset("assets/images/logo.png",height: 100),
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
